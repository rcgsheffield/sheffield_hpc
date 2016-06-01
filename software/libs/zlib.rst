.. _zlib:

zlib
====

.. sidebar:: zlib

   :Version: 1.2.8
   :URL: http://zlib.net/
   :Location: /usr/local/packages6/libs/gcc/4.4.7/zlib/1.2.8

A Massively Spiffy Yet Delicately Unobtrusive Compression Library.

Usage
-----
To make this library available, run the following module command ::

        module load libs/gcc/4.4.7/zlib/1.2.8

Installation notes
------------------
This section is primarily for administrators of the system.

It was built with gcc 4.4.7 ::

  #!/bin/bash

  install_dir=/usr/local/packages6/libs/gcc/4.4.7/zlib/1.2.8

  wget http://zlib.net/zlib-1.2.8.tar.gz
  tar -xvzf ./zlib-1.2.8.tar.gz
  cd zlib-1.2.8

  mkdir -p $install_dir

  ./configure --prefix=$install_dir
  make
  make install


testing
-------
The library was tested with `make check`. The results were ::

  make check

  hello world
  zlib version 1.2.8 = 0x1280, compile flags = 0xa9
  uncompress(): hello, hello!
  gzread(): hello, hello!
  gzgets() after gzseek:  hello!
  inflate(): hello, hello!
  large_inflate(): OK
  after inflateSync(): hello, hello!
  inflate with dictionary: hello, hello!
  		*** zlib test OK ***
  hello world
  zlib version 1.2.8 = 0x1280, compile flags = 0xa9
  uncompress(): hello, hello!
  gzread(): hello, hello!
  gzgets() after gzseek:  hello!
  inflate(): hello, hello!
  large_inflate(): OK
  after inflateSync(): hello, hello!
  inflate with dictionary: hello, hello!
  		*** zlib shared test OK ***
  hello world
  zlib version 1.2.8 = 0x1280, compile flags = 0xa9
  uncompress(): hello, hello!
  gzread(): hello, hello!
  gzgets() after gzseek:  hello!
  inflate(): hello, hello!
  large_inflate(): OK
  after inflateSync(): hello, hello!
  inflate with dictionary: hello, hello!
  		*** zlib 64-bit test OK ***

Module File
-----------
Module location is `/usr/local/modulefiles/libs/gcc/4.4.7/zlib/1.2.8`. Module contents ::

  #%Module1.0#####################################################################
  ##
  ## zlib 1.2.8 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes the zlib 1.2.8 library available"
  }

  module-whatis   "Makes the zlib 1.2.8 library available"

  set ZLIB_DIR /usr/local/packages6/libs/gcc/4.4.7/zlib/1.2.8

  prepend-path LD_LIBRARY_PATH $ZLIB_DIR/lib
  prepend-path CPATH $ZLIB_DIR/include
  prepend-path MANPATH $ZLIB_DIR/share/man
