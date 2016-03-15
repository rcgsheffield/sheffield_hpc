.. _libunistring:

libunistring
============

.. sidebar:: libunistring

   :Latest version: 0.9.5
   :URL: http://www.gnu.org/software/libunistring/#TOCdownloading/

Text files are nowadays usually encoded in Unicode, and may consist of very different scripts – from Latin letters to Chinese Hanzi –, with many kinds of special characters – accents, right-to-left writing marks, hyphens, Roman numbers, and much more. But the POSIX platform APIs for text do not contain adequate functions for dealing with particular properties of many Unicode characters. In fact, the POSIX APIs for text have several assumptions at their base which don't hold for Unicode text.

This library provides functions for manipulating Unicode strings and for manipulating C strings according to the Unicode standard.

Usage
-----
To make this library available, run the following module command ::

        module load libs/gcc/4.8.2/libunistring/0.9.5

This correctly populates the environment variables LD_LIBRARY_PATH, LIBRARY_PATH and CPLUS_INCLUDE_PATH

Installation notes
------------------
This section is primarily for administrators of the system. libunistring 0.9.5 was compiled with gcc 4.8.2 ::

  module load compilers/gcc/4.8.2
  tar -xvzf ./libunistring-0.9.5.tar.gz
  cd ./libunistring-0.9.5
  ./configure --prefix=/usr/local/packages6/libs/gcc/4.8.2/libunistring/0.9.5

  #build
  make
  #Testing
  make check
  #Install
  make install

Testing
-------
Run `make check` after `make` and before `make install`. This runs the test suite.

Results were ::

  ============================================================================
  Testsuite summary for
  ============================================================================
  # TOTAL: 492
  # PASS:  482
  # SKIP:  10
  # XFAIL: 0
  # FAIL:  0
  # XPASS: 0
  # ERROR: 0
  ============================================================================

Module file
------------
The module file is on the system at ``/usr/local/modulefiles/libs/gcc/4.8.2/libunistring/0.9.5`` ::

  #%Module1.0#####################################################################
  ##
  ## libunistring 0.9.5 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##


  proc ModulesHelp { } {
          puts stderr "Makes the libunistring library available"
  }

  set LIBUNISTRING_DIR /usr/local/packages6/libs/gcc/4.8.2/libunistring/0.9.5

  module-whatis   "Makes the libunistring library available"

  prepend-path LD_LIBRARY_PATH $LIBUNISTRING_DIR/lib/
  prepend-path LIBRARY_PATH $LIBUNISTRING_DIR/lib
  prepend-path CPLUS_INCLUDE_PATH $LIBUNISTRING_DIR/include
