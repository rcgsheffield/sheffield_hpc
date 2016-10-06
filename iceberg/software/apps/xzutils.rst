.. _xzutils:

xz utils
========

.. sidebar:: xz utils

   :Latest version: 5.2.2
   :URL: http://tukaani.org/xz/

XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils.

The core of the XZ Utils compression code is based on LZMA SDK, but it has been modified quite a lot to be suitable for XZ Utils. The primary compression algorithm is currently LZMA2, which is used inside the .xz container format. With typical files, XZ Utils create 30 % smaller output than gzip and 15 % smaller output than bzip2.

XZ Utils consist of several components:

* liblzma is a compression library with an API similar to that of zlib.
* xz is a command line tool with syntax similar to that of gzip.
* xzdec is a decompression-only tool smaller than the full-featured xz tool.
* A set of shell scripts (xzgrep, xzdiff, etc.) have been adapted from gzip to ease viewing, grepping, and comparing compressed files.
* Emulation of command line tools of LZMA Utils eases transition from LZMA Utils to XZ Utils.

While liblzma has a zlib-like API, liblzma doesn't include any file I/O functions. A separate I/O library is planned, which would abstract handling of .gz, .bz2, and .xz files with an easy to use API.

Usage
-----
There is an old version of xz utils available on the system by default.  We can see its version with ::

    xz --version

which gives ::

    xz (XZ Utils) 4.999.9beta
    liblzma 4.999.9beta

Version 4.999.9beta of xzutils was released in 2009.

To make version 5.2.2 (released in 2015) available, run the following module command ::

    module load apps/gcc/4.4.7/xzutils/5.2.2

Documentation
-------------
Standard man pages are available. The documentation version you get depends on wether or not you've loaded the module. ::

    man xz

Installation notes
------------------
This section is primarily for administrators of the system.
xz utils 5.2.2 was compiled with gcc 4.4.7 ::

   tar -xvzf ./xz-5.2.2.tar.gz
   cd xz-5.2.2
   mkdir -p /usr/local/packages6/apps/gcc/4.4.7/xzutils/5.2.2
   ./configure --prefix=/usr/local/packages6/apps/gcc/4.4.7/xzutils/5.2.2
   make
   make install

Testing was performed with ::

    make check

Final piece of output was ::

  ==================
  All 9 tests passed
  ==================

Module file
------------
Modulefile is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/xzutils/5.2.2` ::

    #%Module1.0#####################################################################
    ##
    ## xzutils 5.2.2 module file
    ##

    ## Module file logging
    source /usr/local/etc/module_logging.tcl
    ##

    proc ModulesHelp { } {
            puts stderr "Makes xzutils 5.2.2 available"
    }

    set XZUTILS_DIR /usr/local/packages6/apps/gcc/4.4.7/xzutils/5.2.2

    module-whatis   "Makes xzutils 5.2.2 available"

    prepend-path PATH $XZUTILS_DIR/bin
    prepend-path LD_LIBRARY_PATH $XZUTILS_DIR/lib
    prepend-path CPLUS_INCLUDE_PATH $XZUTILS_DIR/include
    prepend-path CPATH $XZUTILS_DIR/include
    prepend-path LIBRARY_PATH $XZUTILS_DIR/lib
    prepend-path MANPATH $XZUTILS_DIR/share/man/
