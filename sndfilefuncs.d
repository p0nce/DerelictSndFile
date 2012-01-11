module gfm.libsndfile.sndfilefuncs;

import derelict.util.compat;
import gfm.libsndfile.sndfiletypes;


extern(C)
{
    alias SNDFILE*     function(const(char) *path, int mode, SF_INFO *sfinfo) da_sf_open;
    alias SNDFILE*     function(int fd, int mode, SF_INFO *sfinfo, int close_desc) da_sf_open_fd;
    alias SNDFILE*     function(SF_VIRTUAL_IO *sfvirtual, int mode, SF_INFO *sfinfo, void *user_data) da_sf_open_virtual;
    alias int          function(SNDFILE *sndfile) da_sf_error;
    alias const(char)* function(SNDFILE *sndfile) da_sf_strerror;
    alias const(char)* function(int errnum) da_sf_error_number;
    alias int          function(SNDFILE *sndfile) da_sf_perror;
    alias int          function(SNDFILE *sndfile, char* str, size_t len) da_sf_error_str;
    alias int          function(SNDFILE *sndfile, int command, void *data, int datasize) da_sf_command;
    alias int          function(const(SF_INFO) *info) da_sf_format_check;
    alias sf_count_t   function(SNDFILE *sndfile, sf_count_t frames, int whence) da_sf_seek;
    alias int          function(SNDFILE *sndfile, int str_type, const(char)* str) da_sf_set_string;
    alias const(char)* function(SNDFILE *sndfile, int str_type) da_sf_get_string;
    alias const(char)* function() da_sf_version_string;
    alias sf_count_t   function(SNDFILE *sndfile, void *ptr, sf_count_t bytes) da_sf_read_raw;
    alias sf_count_t   function(SNDFILE *sndfile, const void *ptr, sf_count_t bytes) da_sf_write_raw;
    alias sf_count_t   function(SNDFILE *sndfile, short *ptr, sf_count_t frames) da_sf_readf_short;
    alias sf_count_t   function(SNDFILE *sndfile, const(short) *ptr, sf_count_t frames) da_sf_writef_short;
    alias sf_count_t   function(SNDFILE *sndfile, int *ptr, sf_count_t frames) da_sf_readf_int;
    alias sf_count_t   function(SNDFILE *sndfile, const(int) *ptr, sf_count_t frames) da_sf_writef_int;
    alias sf_count_t   function(SNDFILE *sndfile, float *ptr, sf_count_t frames) da_sf_readf_float;
    alias sf_count_t   function(SNDFILE *sndfile, const(float) *ptr, sf_count_t frames) da_sf_writef_float;
    alias sf_count_t   function(SNDFILE *sndfile, double *ptr, sf_count_t frames) da_sf_readf_double;
    alias sf_count_t   function(SNDFILE *sndfile, const(double) *ptr, sf_count_t frames) da_sf_writef_double;
    alias sf_count_t   function(SNDFILE *sndfile, short *ptr, sf_count_t items) da_sf_read_short;
    alias sf_count_t   function(SNDFILE *sndfile, const(short) *ptr, sf_count_t items) da_sf_write_short;
    alias sf_count_t   function(SNDFILE *sndfile, int *ptr, sf_count_t items) da_sf_read_int;
    alias sf_count_t   function(SNDFILE *sndfile, const(int) *ptr, sf_count_t items) da_sf_write_int;
    alias sf_count_t   function(SNDFILE *sndfile, float *ptr, sf_count_t items) da_sf_read_float;
    alias sf_count_t   function(SNDFILE *sndfile, const(float) *ptr, sf_count_t items) da_sf_write_float;
    alias sf_count_t   function(SNDFILE *sndfile, double *ptr, sf_count_t items) da_sf_read_double;
    alias sf_count_t   function(SNDFILE *sndfile, const(double) *ptr, sf_count_t items) da_sf_write_double;
    alias int          function(SNDFILE *sndfile) da_sf_close;
    alias void         function(SNDFILE *sndfile) da_sf_write_sync;
}


/+ How to do?
version(Windows)
{
    import core.sys.windows.windows;
    SNDFILE* sf_wchar_open (LPCWSTR wpath, int mode, SF_INFO *sfinfo) ;
}
+/

mixin(gsharedString!() ~
    "
        da_sf_open sf_open;
        da_sf_open_fd sf_open_fd;
        da_sf_open_virtual sf_open_virtual;
        da_sf_error sf_error;
        da_sf_strerror sf_strerror;
        da_sf_error_number sf_error_number;
        da_sf_perror sf_perror;
        da_sf_error_str sf_error_str;
        da_sf_command sf_command;
        da_sf_format_check sf_format_check;
        da_sf_seek sf_seek;
        da_sf_set_string sf_set_string;
        da_sf_get_string sf_get_string;
        da_sf_version_string sf_version_string;
        da_sf_read_raw sf_read_raw;
        da_sf_write_raw sf_write_raw;
        da_sf_readf_short sf_readf_short ;
        da_sf_writef_short sf_writef_short;
        da_sf_readf_int sf_readf_int;
        da_sf_writef_int sf_writef_int;
        da_sf_readf_float sf_readf_float;
        da_sf_writef_float sf_writef_float;
        da_sf_readf_double sf_readf_double;
        da_sf_writef_double sf_writef_double;
        da_sf_read_short sf_read_short;
        da_sf_write_short sf_write_short;
        da_sf_read_int sf_read_int;
        da_sf_write_int sf_write_int;
        da_sf_read_float sf_read_float;
        da_sf_write_float sf_write_float;
        da_sf_read_double sf_read_double;
        da_sf_write_double sf_write_double;
        da_sf_close sf_close;
        da_sf_write_sync sf_write_sync ;
    ");
