.. _fftw:

fftw
====

.. sidebar:: fftw

   :Latest version: 3.3.4
   :URL: http://www.fftw.org/
   :Location: /usr/local/packages6/libs/gcc/5.2/fftw/3.3.4

FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of arbitrary input size, and of both real and complex data (as well as of even/odd data, i.e. the discrete cosine/sine transforms or DCT/DST).

Usage
-----
To make this library available, run the following module command ::

        module load libs/gcc/5.2/fftw/3.3.4

Installation notes
------------------
This section is primarily for administrators of the system. FFTW 3.3.4 was compiled with gcc 5.2 ::

    module load compilers/gcc/5.2
    mkdir -p /usr/local/packages6/libs/gcc/5.2/fftw/3.3.4
    tar -xvzf fftw-3.3.4.tar.gz
    cd fftw-3.3.4
    ./configure --prefix=/usr/local/packages6/libs/gcc/5.2/fftw/3.3.4 --enable-threads --enable-openmp --enable-shared
    make
    make check

Result was lots of numerical output and ::

  --------------------------------------------------------------
           FFTW transforms passed basic tests!
  --------------------------------------------------------------

  --------------------------------------------------------------
           FFTW threaded transforms passed basic tests!
  --------------------------------------------------------------

Installed with ::

    make install

Module file
------------
Modulefile is on the system at ``/usr/local/modulefiles/libs/gcc/5.2/fftw/3.3.4`` ::

  #%Module1.0#####################################################################
  ##
  ## fftw 3.3.4 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl

  proc ModulesHelp { } {
          puts stderr "Makes the FFTW 3.3.4 library available"
  }
  module-whatis   "Makes the FFTW 3.3.4 library available"

  set FFTW_DIR /usr/local/packages6/libs/gcc/5.2/fftw/3.3.4

  prepend-path CPATH $FFTW_DIR/include
  prepend-path LD_LIBRARY_PATH $FFTW_DIR/lib
  prepend-path LIBRARY_PATH $FFTW_DIR/lib
  prepend-path MANPATH $FFTW_DIR/share/man
  prepend-path PATH $FFTW_DIR/bin
