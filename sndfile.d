module gfm.libsndfile.sndfile;

public 
{
    import gfm.libsndfile.sndfiletypes;
    import gfm.libsndfile.sndfilefuncs;
}

private 
{
    import derelict.util.loader;
}

class DerelictSndFileLoader : SharedLibLoader
{
public:
    this()
    {
        super(
              "libsndfile-1.dll",
              "",
              ""
              );
    }

protected:
    override void loadSymbols()
    {      
        bindFunc(cast(void**)&sf_open, "sf_open");
        bindFunc(cast(void**)&sf_open_fd, "sf_open_fd");
        bindFunc(cast(void**)&sf_open_virtual, "sf_open_virtual");
        bindFunc(cast(void**)&sf_error, "sf_error");
        bindFunc(cast(void**)&sf_strerror, "sf_strerror");
        bindFunc(cast(void**)&sf_error_number, "sf_error_number");
        bindFunc(cast(void**)&sf_perror, "sf_perror");
        bindFunc(cast(void**)&sf_error_str, "sf_error_str");
        bindFunc(cast(void**)&sf_command, "sf_command");
        bindFunc(cast(void**)&sf_format_check, "sf_format_check");
        bindFunc(cast(void**)&sf_seek, "sf_seek");
        bindFunc(cast(void**)&sf_set_string, "sf_set_string");
        bindFunc(cast(void**)&sf_get_string, "sf_get_string");
        bindFunc(cast(void**)&sf_version_string, "sf_version_string");
        bindFunc(cast(void**)&sf_read_raw, "sf_read_raw");
        bindFunc(cast(void**)&sf_write_raw, "sf_write_raw");
        bindFunc(cast(void**)&sf_readf_short, "sf_readf_short");
        bindFunc(cast(void**)&sf_writef_short, "sf_writef_short");
        bindFunc(cast(void**)&sf_readf_int, "sf_readf_int");
        bindFunc(cast(void**)&sf_writef_int, "sf_writef_int");
        bindFunc(cast(void**)&sf_readf_float, "sf_readf_float");
        bindFunc(cast(void**)&sf_writef_float, "sf_writef_float");
        bindFunc(cast(void**)&sf_readf_double, "sf_readf_double");
        bindFunc(cast(void**)&sf_writef_double, "sf_writef_double");
        bindFunc(cast(void**)&sf_read_short, "sf_read_short");
        bindFunc(cast(void**)&sf_write_short, "sf_write_short");
        bindFunc(cast(void**)&sf_read_int, "sf_read_int");
        bindFunc(cast(void**)&sf_write_int, "sf_write_int");
        bindFunc(cast(void**)&sf_read_float, "sf_read_float");
        bindFunc(cast(void**)&sf_write_float, "sf_write_float");
        bindFunc(cast(void**)&sf_read_double, "sf_read_double");
        bindFunc(cast(void**)&sf_write_double, "sf_write_double");
        bindFunc(cast(void**)&sf_close, "sf_close");
    }
}

DerelictSndFileLoader DerelictSndFile;

static this()
{
    DerelictSndFile = new DerelictSndFileLoader();
}

static ~this()
{
    if(SharedLibLoader.isAutoUnloadEnabled())
        DerelictSndFile.unload();
}
