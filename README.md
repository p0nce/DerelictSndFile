DerelictSndFile
===============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [libsndfile](http://www.mega-nerd.com/libsndfile/) for the D Programming Language.
libsndfile is a great library that read and write a variety of audio files.

For information on how to build DerelictSndFile and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the libsndfile library via DerelictSndFile, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
import derelict.sndfile.sndfile;

void main() {
    // Load the libsndfile library.
    DerelictSndFile.load();
    
    // Now libsndfile functions can be called.
    ...
}
```
