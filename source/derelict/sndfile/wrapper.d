module derelict.sndfile.wrapper;

import derelict.sndfile.sndfile;
import std.string;


deprecated("This wrapper will be deprecated, not useful enough")  class SoundFileException : Exception
{
public:
    this(string msg)
    {
        super(msg);
    }
}

// resource class for libsndfile usage
deprecated("This wrapper will be deprecated, not useful enough") class SoundFileLibrary
{
    public
    {
        this()
        {
            DerelictSndFile.load();
        }

        ~this()
        {
            DerelictSndFile.unload();
        }
    }
}

// Wrapper for easy libsndfile usage.
deprecated("This wrapper will be deprecated") class SoundFile
{
    public
    {
        enum Format
        {
            WAV          = 0x010000,
            AIFF         = 0x020000,
            AU           = 0x030000,
            RAW          = 0x040000,
            PAF          = 0x050000,
            SVX          = 0x060000,
            NIST         = 0x070000,
            VOC          = 0x080000,
            IRCAM        = 0x0A0000,
            W64          = 0x0B0000,
            MAT4         = 0x0C0000,
            MAT5         = 0x0D0000,
            PVF          = 0x0E0000,
            XI           = 0x0F0000,
            HTK          = 0x100000,
            SDS          = 0x110000,
            AVR          = 0x120000,
            WAVEX        = 0x130000,
            SD2          = 0x160000,
            FLAC         = 0x170000,
            CAF          = 0x180000,
            WVE          = 0x190000,
            OGG          = 0x200000,
            MPC2K        = 0x210000,
            RF64         = 0x220000,
        }

        enum Type
        {
            PCM_S8       = 0x0001,       /* Signed 8 bit data */
            PCM_16       = 0x0002,       /* Signed 16 bit data */
            PCM_24       = 0x0003,       /* Signed 24 bit data */
            PCM_32       = 0x0004,       /* Signed 32 bit data */
            PCM_U8       = 0x0005,       /* Unsigned 8 bit data (WAV and RAW only) */
            FLOAT        = 0x0006,       /* 32 bit float data */
            DOUBLE       = 0x0007,       /* 64 bit float data */
            ULAW         = 0x0010,       /* U-Law encoded. */
            ALAW         = 0x0011,       /* A-Law encoded. */
            IMA_ADPCM    = 0x0012,       /* IMA ADPCM. */
            MS_ADPCM     = 0x0013,       /* Microsoft ADPCM. */
            GSM610       = 0x0020,       /* GSM 6.10 encoding. */
            VOX_ADPCM    = 0x0021,       /* Oki Dialogic ADPCM encoding. */
            G721_32      = 0x0030,       /* 32kbs G721 ADPCM encoding. */
            G723_24      = 0x0031,       /* 24kbs G723 ADPCM encoding. */
            G723_40      = 0x0032,       /* 40kbs G723 ADPCM encoding. */
            DWVW_12      = 0x0040,       /* 12 bit Delta Width Variable Word encoding. */
            DWVW_16      = 0x0041,       /* 16 bit Delta Width Variable Word encoding. */
            DWVW_24      = 0x0042,       /* 24 bit Delta Width Variable Word encoding. */
            DWVW_N       = 0x0043,       /* N bit Delta Width Variable Word encoding. */
            DPCM_8       = 0x0050,       /* 8 bit differential PCM (XI only) */
            DPCM_16      = 0x0051,       /* 16 bit differential PCM (XI only) */
            VORBIS       = 0x0060,       /* Xiph Vorbis encoding. */
        }

        enum Endianness
        {
            DEFAULT = 0x00000000,
            LITTLE  = 0x10000000,
            BIG     = 0x20000000,
            CPU     = 0x30000000
        }

        enum Access
        {
            READ,
            WRITE
        }

        // open for reading
        this(SoundFileLibrary library, string path)
        {
           _library = library;
           _info = _info.init;
           _access = Access.READ;
           _handle = sf_open(toStringz(path), SFM_READ, &_info);
           if (_handle is null)
           {
               string msg = std.string.format("sound error while opening %s", path);
               throw new SoundFileException(msg);
           }
        }

        // open for writing
        this(SoundFileLibrary library, string path, int channels, int samplerate,
             Format format = Format.WAV, Type _type = Type.PCM_24, Endianness end = Endianness.DEFAULT)
        {
            _library = library;
            _info = _info.init;
            _info.format = format | _type | end;
            _info.channels = channels;
            _info.samplerate = samplerate;
            if (sf_format_check(&_info) == SF_FALSE)
                throw new SoundFileException(std.string.format("cannot output sound to %s with this format", path));

            _access = Access.WRITE;
            _handle = sf_open(toStringz(path), SFM_WRITE, &_info);
            if (_handle is null)
                throw new SoundFileException(std.string.format("sound error while opening %s", path));
        }

        ~this()
        {
            sf_close(_handle);
        }

        void flush()
        {
            sf_write_sync(_handle);
        }

        Format format() const
        {
            return cast(Format)(_info.format & 0x0FFF0000);
        }

        Type type() const
        {
            return cast(Type)(_info.format & 0x0000FFFF);
        }

        int channels() const
        {
            return _info.channels;
        }

        long frames() const
        {
            return _info.frames;
        }

        int sampleRate() const
        {
            return _info.samplerate;
        }

        int sections() const
        {
            return _info.sections;
        }

        Endianness endianness() const
        {
            return cast(Endianness)(_info.format & SF_FORMAT_ENDMASK);
        }

        void readSamples(T)(T[] samples) if (is(T == float) || is(T == double))
        {
            assert(_access == Access.READ);
            assert((samples.length % _info.channels) == 0);
            static if (is(T == float))
                sf_count_t actualRead = sf_read_float(_handle, samples.ptr, samples.length);
            else
                sf_count_t actualRead = sf_read_double(_handle, samples.ptr, samples.length);
            samples[cast(uint)actualRead..$] = 0; // fill the rest with zero
        }

        void writeSamples(T)(T[] samples) if (is(T == float) || is(T == double))
        {
            assert(_access == Access.WRITE);
            assert((samples.length % _info.channels) == 0);
            static if (is(T == float))
                sf_count_t actualWritten = sf_write_float(_handle, samples.ptr, samples.length);
            else
                sf_count_t actualWritten = sf_write_double(_handle, samples.ptr, samples.length);
            if (actualWritten != samples.length)
                throw new SoundFileException(std.string.format("couldn't write %s samples", samples.length));
        }
    }

    private
    {
        string errorString()
        {
            return errorToString(sf_error(_handle));
        }

        SoundFileLibrary _library;
        SF_INFO _info;
        SNDFILE* _handle;
        Access _access;
    }
}

private
{
    string errorToString(int err)
    {
        switch(err)
        {
            case SF_ERR_NO_ERROR: return "no error";
            case SF_ERR_UNRECOGNISED_FORMAT: return "unrecognized format";
            case SF_ERR_SYSTEM: return "system error";
            case SF_ERR_MALFORMED_FILE: return "malformed file";
            case SF_ERR_UNSUPPORTED_ENCODING: return "unsupported encoding";
            default: return "unknown error";
        }
    }
}
