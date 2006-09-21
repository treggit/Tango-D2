/**
 * D header file for POSIX.
 *
 * Copyright: Public Domain
 * License:   Public Domain
 * Authors:   Sean Kelly
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */
module tango.stdc.posix.dirent;

private import tango.stdc.config;
public import tango.stdc.posix.sys.types; // for ino_t

extern (C):

//
// Required
//
/*
DIR

struct dirent
{
    char[] d_name;
}

int     closedir(DIR*);
DIR*    opendir(char*);
dirent* readdir(DIR*);
void    rewinddir(DIR*);
*/

version( linux )
{
    struct dirent
    {
      static if( false /*__USE_FILE_OFFSET64*/ )
      {
        ino64_t     d_ino;
        off64_t     d_off;
      }
      else
      {
        ino_t       d_ino;
        off_t       d_off;
      }
        ushort      d_reclen;
        ubyte       d_type;
        char[256]   d_name;
    }

    struct DIR
    {
	    // Managed by OS
    }
}

int     closedir(DIR*);
DIR*    opendir(char*);
dirent* readdir(DIR*);
void    rewinddir(DIR*);

//
// Thread-Safe Functions (TSF)
//
/*
int readdir_r(DIR*, dirent*, dirent**);
*/

//
// XOpen (XSI)
//
/*
void   seekdir(DIR*, c_long);
c_long telldir(DIR*);
*/

version( linux )
{
    void   seekdir(DIR*, c_long);
    c_long telldir(DIR*);
}
