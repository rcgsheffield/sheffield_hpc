.. _bzip2:

bzip2
=====

bzip2 is a freely available, patent free (see below), high-quality data compressor. It typically compresses files to within 10% to 15% of the best available techniques (the PPM family of statistical compressors), whilst being around twice as fast at compression and six times faster at decompression.

.. sidebar:: bzip2

   :Version: 1.0.6
   :URL: http://www.bzip.org/
   :Location: /usr/local/packages6/libs/gcc/4.4.7/bzip2/1.0.6

Usage
-----
The default version of bzip2 on the system is version 1.0.5.
If you need a newer version run the following module command ::

        module load libs/gcc/4.4.7/bzip2/1.0.6

Check the version number that's available using ::

        bzip2 --version

Documentation
-------------
Standard man pages are available ::

       man bzip2

Installation notes
------------------
This section is primarily for administrators of the system.

It was built with gcc 4.4.7 ::

    wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
    mkdir -p /usr/local/packages6/libs/gcc/4.4.7/bzip2/1.0.6
    tar -xvzf ./bzip2-1.0.6.tar.gz
    cd bzip2-1.0.6

    make -f Makefile-libbz2_so
    make
    make install PREFIX=/usr/local/packages6/libs/gcc/4.4.7/bzip2/1.0.6
    mv *.so* /usr/local/packages6/libs/gcc/4.4.7/bzip2/1.0.6/lib/

testing
-------
The library is automatically tested when you do a `make`. The results were ::

  Doing 6 tests (3 compress, 3 uncompress) ...
  If there's a problem, things might stop at this point.

  ./bzip2 -1  < sample1.ref > sample1.rb2
  ./bzip2 -2  < sample2.ref > sample2.rb2
  ./bzip2 -3  < sample3.ref > sample3.rb2
  ./bzip2 -d  < sample1.bz2 > sample1.tst
  ./bzip2 -d  < sample2.bz2 > sample2.tst
  ./bzip2 -ds < sample3.bz2 > sample3.tst
  cmp sample1.bz2 sample1.rb2
  cmp sample2.bz2 sample2.rb2
  cmp sample3.bz2 sample3.rb2
  cmp sample1.tst sample1.ref
  cmp sample2.tst sample2.ref
  cmp sample3.tst sample3.ref

  If you got this far and the 'cmp's didn't complain, it looks
  like you're in business.

Module File
-----------
Module location is `/usr/local/modulefiles/libs/gcc/4.4.7/bzip2/1.0.6`. Module contents ::

  #%Module1.0#####################################################################
  ##
  ## bzip2 1.0.6 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes the bzip 1.0.6 library available"
  }

  module-whatis   "Makes the bzip 1.0.6 library available"

  set BZIP_DIR /usr/local/packages6/libs/gcc/4.4.7/bzip2/1.0.6

  prepend-path LD_LIBRARY_PATH $BZIP_DIR/lib
  prepend-path CPATH $BZIP_DIR/include
  prepend-path MANPATH $BZIP_DIR/man
  prepend-path PATH $BZIP_DIR/bin
