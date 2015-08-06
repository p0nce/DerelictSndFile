DerelictSndFile
===============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [libsndfile](http://www.mega-nerd.com/libsndfile/) for the D Programming Language.
libsndfile is a library that read and write a variety of audio files.

Please see the pages [Building and Linking Derelict](http://derelictorg.github.io/compiling.html) and [Using Derelict](http://derelictorg.github.io/using.html), or information on how to build DerelictSndFile and load the libsndfile library at run time. In the meantime, here's some sample code.

```D
import derelict.sndfile.sndfile;

void main() {
    // Load the libsndfile library.
    DerelictSndFile.load();

    // Now libsndfile functions can be called.
    ...
}
```
