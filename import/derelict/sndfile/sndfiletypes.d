/**
 * This is free and unencumbered software released into the public domain.
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.
 *
 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * For more information, please refer to <http://unlicense.org/>
 */
/**
 * IMPORTANT: Despite this binding being public domain you still
 * MUST comply with the libsndfile licence terms if you use it.
 * http://www.mega-nerd.com/libsndfile/
 */
module derelict.sndfile.sndfiletypes;

/* This is the version 1.0.X header file. */
version = SNDFILE_1;

/* The following file types can be read and written.
** A file type would consist of a major type (ie SF_FORMAT_WAV) bitwise
** ORed with a minor type (ie SF_FORMAT_PCM). SF_FORMAT_TYPEMASK and
** SF_FORMAT_SUBMASK can be used to separate the major and minor file
** types.
*/

enum
{
    /* Major formats. */
    SF_FORMAT_WAV          = 0x010000,        /* Microsoft WAV format (little endian default). */
    SF_FORMAT_AIFF         = 0x020000,        /* Apple/SGI AIFF format (big endian). */
    SF_FORMAT_AU           = 0x030000,        /* Sun/NeXT AU format (big endian). */
    SF_FORMAT_RAW          = 0x040000,        /* RAW PCM data. */
    SF_FORMAT_PAF          = 0x050000,        /* Ensoniq PARIS file format. */
    SF_FORMAT_SVX          = 0x060000,        /* Amiga IFF / SVX8 / SV16 format. */
    SF_FORMAT_NIST         = 0x070000,        /* Sphere NIST format. */
    SF_FORMAT_VOC          = 0x080000,        /* VOC files. */
    SF_FORMAT_IRCAM        = 0x0A0000,        /* Berkeley/IRCAM/CARL */
    SF_FORMAT_W64          = 0x0B0000,        /* Sonic Foundry's 64 bit RIFF/WAV */
    SF_FORMAT_MAT4         = 0x0C0000,        /* Matlab (tm) V4.2 / GNU Octave 2.0 */
    SF_FORMAT_MAT5         = 0x0D0000,        /* Matlab (tm) V5.0 / GNU Octave 2.1 */
    SF_FORMAT_PVF          = 0x0E0000,        /* Portable Voice Format */
    SF_FORMAT_XI           = 0x0F0000,        /* Fasttracker 2 Extended Instrument */
    SF_FORMAT_HTK          = 0x100000,        /* HMM Tool Kit format */
    SF_FORMAT_SDS          = 0x110000,        /* Midi Sample Dump Standard */
    SF_FORMAT_AVR          = 0x120000,        /* Audio Visual Research */
    SF_FORMAT_WAVEX        = 0x130000,        /* MS WAVE with WAVEFORMATEX */
    SF_FORMAT_SD2          = 0x160000,        /* Sound Designer 2 */
    SF_FORMAT_FLAC         = 0x170000,        /* FLAC lossless file format */
    SF_FORMAT_CAF          = 0x180000,        /* Core Audio File format */
    SF_FORMAT_WVE          = 0x190000,        /* Psion WVE format */
    SF_FORMAT_OGG          = 0x200000,        /* Xiph OGG container */
    SF_FORMAT_MPC2K        = 0x210000,        /* Akai MPC 2000 sampler */
    SF_FORMAT_RF64         = 0x220000,        /* RF64 WAV file */

    /* Subtypes from here on. */

    SF_FORMAT_PCM_S8       = 0x0001,        /* Signed 8 bit data */
    SF_FORMAT_PCM_16       = 0x0002,        /* Signed 16 bit data */
    SF_FORMAT_PCM_24       = 0x0003,        /* Signed 24 bit data */
    SF_FORMAT_PCM_32       = 0x0004,        /* Signed 32 bit data */

    SF_FORMAT_PCM_U8       = 0x0005,        /* Unsigned 8 bit data (WAV and RAW only) */

    SF_FORMAT_FLOAT        = 0x0006,        /* 32 bit float data */
    SF_FORMAT_DOUBLE       = 0x0007,        /* 64 bit float data */

    SF_FORMAT_ULAW         = 0x0010,        /* U-Law encoded. */
    SF_FORMAT_ALAW         = 0x0011,        /* A-Law encoded. */
    SF_FORMAT_IMA_ADPCM    = 0x0012,        /* IMA ADPCM. */
    SF_FORMAT_MS_ADPCM     = 0x0013,        /* Microsoft ADPCM. */

    SF_FORMAT_GSM610       = 0x0020,        /* GSM 6.10 encoding. */
    SF_FORMAT_VOX_ADPCM    = 0x0021,        /* OKI / Dialogix ADPCM */

    SF_FORMAT_G721_32      = 0x0030,        /* 32kbs G721 ADPCM encoding. */
    SF_FORMAT_G723_24      = 0x0031,        /* 24kbs G723 ADPCM encoding. */
    SF_FORMAT_G723_40      = 0x0032,        /* 40kbs G723 ADPCM encoding. */

    SF_FORMAT_DWVW_12      = 0x0040,        /* 12 bit Delta Width Variable Word encoding. */
    SF_FORMAT_DWVW_16      = 0x0041,        /* 16 bit Delta Width Variable Word encoding. */
    SF_FORMAT_DWVW_24      = 0x0042,        /* 24 bit Delta Width Variable Word encoding. */
    SF_FORMAT_DWVW_N       = 0x0043,        /* N bit Delta Width Variable Word encoding. */

    SF_FORMAT_DPCM_8       = 0x0050,        /* 8 bit differential PCM (XI only) */
    SF_FORMAT_DPCM_16      = 0x0051,        /* 16 bit differential PCM (XI only) */

    SF_FORMAT_VORBIS       = 0x0060,        /* Xiph Vorbis encoding. */

    /* Endian-ness options. */

    SF_ENDIAN_FILE         = 0x00000000,    /* Default file endian-ness. */
    SF_ENDIAN_LITTLE       = 0x10000000,    /* Force little endian-ness. */
    SF_ENDIAN_BIG          = 0x20000000,    /* Force big endian-ness. */
    SF_ENDIAN_CPU          = 0x30000000,    /* Force CPU endian-ness. */

    SF_FORMAT_SUBMASK      = 0x0000FFFF,
    SF_FORMAT_TYPEMASK     = 0x0FFF0000,
    SF_FORMAT_ENDMASK      = 0x30000000
}

/*
** The following are the valid command numbers for the sf_command()
** interface.  The use of these commands is documented in the file
** command.html in the doc directory of the source code distribution.
*/

enum
{    SFC_GET_LIB_VERSION            = 0x1000,
    SFC_GET_LOG_INFO                = 0x1001,
    SFC_GET_CURRENT_SF_INFO         = 0x1002,


    SFC_GET_NORM_DOUBLE             = 0x1010,
    SFC_GET_NORM_FLOAT              = 0x1011,
    SFC_SET_NORM_DOUBLE             = 0x1012,
    SFC_SET_NORM_FLOAT              = 0x1013,
    SFC_SET_SCALE_FLOAT_INT_READ    = 0x1014,
    SFC_SET_SCALE_INT_FLOAT_WRITE   = 0x1015,

    SFC_GET_SIMPLE_FORMAT_COUNT     = 0x1020,
    SFC_GET_SIMPLE_FORMAT           = 0x1021,

    SFC_GET_FORMAT_INFO             = 0x1028,

    SFC_GET_FORMAT_MAJOR_COUNT      = 0x1030,
    SFC_GET_FORMAT_MAJOR            = 0x1031,
    SFC_GET_FORMAT_SUBTYPE_COUNT    = 0x1032,
    SFC_GET_FORMAT_SUBTYPE          = 0x1033,

    SFC_CALC_SIGNAL_MAX             = 0x1040,
    SFC_CALC_NORM_SIGNAL_MAX        = 0x1041,
    SFC_CALC_MAX_ALL_CHANNELS       = 0x1042,
    SFC_CALC_NORM_MAX_ALL_CHANNELS  = 0x1043,
    SFC_GET_SIGNAL_MAX              = 0x1044,
    SFC_GET_MAX_ALL_CHANNELS        = 0x1045,

    SFC_SET_ADD_PEAK_CHUNK          = 0x1050,
    SFC_SET_ADD_HEADER_PAD_CHUNK    = 0x1051,

    SFC_UPDATE_HEADER_NOW           = 0x1060,
    SFC_SET_UPDATE_HEADER_AUTO      = 0x1061,

    SFC_FILE_TRUNCATE               = 0x1080,

    SFC_SET_RAW_START_OFFSET        = 0x1090,

    SFC_SET_DITHER_ON_WRITE         = 0x10A0,
    SFC_SET_DITHER_ON_READ          = 0x10A1,

    SFC_GET_DITHER_INFO_COUNT       = 0x10A2,
    SFC_GET_DITHER_INFO             = 0x10A3,

    SFC_GET_EMBED_FILE_INFO         = 0x10B0,

    SFC_SET_CLIPPING                = 0x10C0,
    SFC_GET_CLIPPING                = 0x10C1,

    SFC_GET_INSTRUMENT              = 0x10D0,
    SFC_SET_INSTRUMENT              = 0x10D1,

    SFC_GET_LOOP_INFO               = 0x10E0,

    SFC_GET_BROADCAST_INFO          = 0x10F0,
    SFC_SET_BROADCAST_INFO          = 0x10F1,

    SFC_GET_CHANNEL_MAP_INFO        = 0x1100,
    SFC_SET_CHANNEL_MAP_INFO        = 0x1101,

    SFC_RAW_DATA_NEEDS_ENDSWAP      = 0x1110,

    /* Support for Wavex Ambisonics Format */
    SFC_WAVEX_SET_AMBISONIC         = 0x1200,
    SFC_WAVEX_GET_AMBISONIC         = 0x1201,

    SFC_SET_VBR_ENCODING_QUALITY    = 0x1300,

    /* Following commands for testing only. */
    SFC_TEST_IEEE_FLOAT_REPLACE     = 0x6001,

    /*
    ** SFC_SET_ADD_* values are deprecated and will disappear at some
    ** time in the future. They are guaranteed to be here up to and
    ** including version 1.0.8 to avoid breakage of existng software.
    ** They currently do nothing and will continue to do nothing.
    */
    SFC_SET_ADD_DITHER_ON_WRITE     = 0x1070,
    SFC_SET_ADD_DITHER_ON_READ      = 0x1071
}


/*
** String types that can be set and read from files. Not all file types
** support this and even the file types which support one, may not support
** all string types.
*/

enum
{    SF_STR_TITLE                   = 0x01,
    SF_STR_COPYRIGHT                = 0x02,
    SF_STR_SOFTWARE                 = 0x03,
    SF_STR_ARTIST                   = 0x04,
    SF_STR_COMMENT                  = 0x05,
    SF_STR_DATE                     = 0x06,
    SF_STR_ALBUM                    = 0x07,
    SF_STR_LICENSE                  = 0x08,
    SF_STR_TRACKNUMBER              = 0x09,
    SF_STR_GENRE                    = 0x10
}

/*
** Use the following as the start and end index when doing metadata
** transcoding.
*/

enum SF_STR_FIRST = SF_STR_TITLE;
enum SF_STR_LAST = SF_STR_GENRE;

enum
{    /* True and false */
    SF_FALSE    = 0,
    SF_TRUE     = 1,

    /* Modes for opening files. */
    SFM_READ    = 0x10,
    SFM_WRITE   = 0x20,
    SFM_RDWR    = 0x30,

    SF_AMBISONIC_NONE        = 0x40,
    SF_AMBISONIC_B_FORMAT    = 0x41
}

/* Public error values. These are guaranteed to remain unchanged for the duration
** of the library major version number.
** There are also a large number of private error numbers which are internal to
** the library which can change at any time.
*/

enum
{
    SF_ERR_NO_ERROR               = 0,
    SF_ERR_UNRECOGNISED_FORMAT    = 1,
    SF_ERR_SYSTEM                 = 2,
    SF_ERR_MALFORMED_FILE         = 3,
    SF_ERR_UNSUPPORTED_ENCODING   = 4
}


/* Channel map values (used with SFC_SET/GET_CHANNEL_MAP).
*/

enum
{
    SF_CHANNEL_MAP_INVALID = 0,
    SF_CHANNEL_MAP_MONO = 1,
    SF_CHANNEL_MAP_LEFT,                    /* Apple calls this 'Left' */
    SF_CHANNEL_MAP_RIGHT,                   /* Apple calls this 'Right' */
    SF_CHANNEL_MAP_CENTER,                  /* Apple calls this 'Center' */
    SF_CHANNEL_MAP_FRONT_LEFT,
    SF_CHANNEL_MAP_FRONT_RIGHT,
    SF_CHANNEL_MAP_FRONT_CENTER,
    SF_CHANNEL_MAP_REAR_CENTER,             /* Apple calls this 'Center Surround', Msft calls this 'Back Center' */
    SF_CHANNEL_MAP_REAR_LEFT,               /* Apple calls this 'Left Surround', Msft calls this 'Back Left' */
    SF_CHANNEL_MAP_REAR_RIGHT,              /* Apple calls this 'Right Surround', Msft calls this 'Back Right' */
    SF_CHANNEL_MAP_LFE,                     /* Apple calls this 'LFEScreen', Msft calls this 'Low Frequency'  */
    SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER,    /* Apple calls this 'Left Center' */
    SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER,   /* Apple calls this 'Right Center */
    SF_CHANNEL_MAP_SIDE_LEFT,               /* Apple calls this 'Left Surround Direct' */
    SF_CHANNEL_MAP_SIDE_RIGHT,              /* Apple calls this 'Right Surround Direct' */
    SF_CHANNEL_MAP_TOP_CENTER,              /* Apple calls this 'Top Center Surround' */
    SF_CHANNEL_MAP_TOP_FRONT_LEFT,          /* Apple calls this 'Vertical Height Left' */
    SF_CHANNEL_MAP_TOP_FRONT_RIGHT,         /* Apple calls this 'Vertical Height Right' */
    SF_CHANNEL_MAP_TOP_FRONT_CENTER,        /* Apple calls this 'Vertical Height Center' */
    SF_CHANNEL_MAP_TOP_REAR_LEFT,           /* Apple and MS call this 'Top Back Left' */
    SF_CHANNEL_MAP_TOP_REAR_RIGHT,          /* Apple and MS call this 'Top Back Right' */
    SF_CHANNEL_MAP_TOP_REAR_CENTER,         /* Apple and MS call this 'Top Back Center' */

    SF_CHANNEL_MAP_AMBISONIC_B_W,
    SF_CHANNEL_MAP_AMBISONIC_B_X,
    SF_CHANNEL_MAP_AMBISONIC_B_Y,
    SF_CHANNEL_MAP_AMBISONIC_B_Z,

    SF_CHANNEL_MAP_MAX
}

alias void SNDFILE;

alias long sf_count_t;
enum SF_COUNT_MAX =    sf_count_t.max;

struct SF_INFO
{    sf_count_t    frames ;        /* Used to be called samples.  Changed to avoid confusion. */
    int            samplerate ;
    int            channels ;
    int            format ;
    int            sections ;
    int            seekable ;
}

struct SF_FORMAT_INFO
{    int            format ;
    const char    *name ;
    const char    *extension ;
}

/*
** Enums and typedefs for adding dither on read and write.
** See the html documentation for sf_command(), SFC_SET_DITHER_ON_WRITE
** and SFC_SET_DITHER_ON_READ.
*/

enum
{    SFD_DEFAULT_LEVEL  = 0,
    SFD_CUSTOM_LEVEL    = 0x40000000,

    SFD_NO_DITHER       = 500,
    SFD_WHITE           = 501,
    SFD_TRIANGULAR_PDF  = 502
}

struct SF_DITHER_INFO
{
    int            type ;
    double        level ;
    const char    *name ;
}

/* Struct used to retrieve information about a file embedded within a
** larger file. See SFC_GET_EMBED_FILE_INFO.
*/

struct SF_EMBED_FILE_INFO
{
    sf_count_t    offset ;
    sf_count_t    length ;
}

/*
**    Structs used to retrieve music sample information from a file.
*/

enum
{
    /*
    **    The loop mode field in SF_INSTRUMENT will be one of the following.
    */
    SF_LOOP_NONE = 800,
    SF_LOOP_FORWARD,
    SF_LOOP_BACKWARD,
    SF_LOOP_ALTERNATING
}

struct SF_INSTRUMENT
{
    int gain ;
    byte basenote, detune ;
    byte velocity_lo, velocity_hi ;
    byte key_lo, key_hi ;
    int loop_count ;

    struct Loop
    {
        int mode;
        uint start;
        uint end;
        uint count;
    }
    Loop[16] loops; /* make variable in a sensible way */
}



/* Struct used to retrieve loop information from a file.*/
struct SF_LOOP_INFO
{
    short time_sig_num; /* any positive integer    > 0  */
    short time_sig_den; /* any positive power of 2 > 0  */
    int loop_mode;      /* see SF_LOOP enum             */

    int num_beats;      /* this is NOT the amount of quarter notes !!!*/
                        /* a full bar of 4/4 is 4 beats */
                        /* a full bar of 7/8 is 7 beats */

    float bpm;          /* suggestion, as it can be calculated using other fields:*/
                        /* file's lenght, file's sampleRate and our time_sig_den*/
                        /* -> bpms are always the amount of _quarter notes_ per minute */

    int root_key;       /* MIDI note, or -1 for None */
    int[6] future;
}


/*    Struct used to retrieve broadcast (EBU) information from a file.
**    Strongly (!) based on EBU "bext" chunk format used in Broadcast WAVE.
*/
/* SF_BROADCAST_INFO is the above struct with coding_history field of 256 bytes. */
struct SF_BROADCAST_INFO
{
    char[256] description;
    char[32] originator;
    char[32] originator_reference;
    char[10] origination_date;
    char[8] origination_time;
    uint time_reference_low;
    uint time_reference_high;
    short _version;
    char[64] umid;
    char[190] reserved;
    uint coding_history_size;
    char[256] coding_history;
}

/*    Virtual I/O functionality. */
alias extern(C) sf_count_t function(void* user_data) sf_vio_get_filelen;
alias extern(C) sf_count_t function(sf_count_t offset, int whence, void *user_data) sf_vio_seek;
alias extern(C) sf_count_t function(void *ptr, sf_count_t count, void *user_data) sf_vio_read;
alias extern(C) sf_count_t function(const void *ptr, sf_count_t count, void *user_data) sf_vio_write;
alias extern(C) sf_count_t function(void *user_data) sf_vio_tell;

struct SF_VIRTUAL_IO
{
    sf_vio_get_filelen  get_filelen;
    sf_vio_seek         seek;
    sf_vio_read         read;
    sf_vio_write        write;
    sf_vio_tell         tell;
}
