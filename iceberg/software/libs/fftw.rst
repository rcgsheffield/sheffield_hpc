.. _fftw:

fftw
====

.. sidebar:: fftw

   :Latest version: 3.3.5
   :URL: http://www.fftw.org/

FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of arbitrary input size, and of both real and complex data (as well as of even/odd data, i.e. the discrete cosine/sine transforms or DCT/DST).

Usage
-----
To make this library available, run one of the following module commands: ::

        module load libs/gcc/4.9.2/fftw/3.3.5
        module load libs/gcc/5.2/fftw/3.3.4

If you are using :ref:`cuda` then you will want to use version 3.3.5 as the build of version 3.3.4 is dependent on GCC 5.2, a version of GCC not supported by CUDA at this time.

Installation notes
------------------
This section is primarily for administrators of the system. 

**version 3.3.5**

This was compiled with GCC 4.9.2 (for compatibility with CUDA, which doesn't support GCC >= 5.0.0).  
Threading (inc. OpenMP) and shared-library support were enabled and build-time.

First, download, configure, build, test and install using :download:`this script </iceberg/software/install_scripts/libs/gcc/4.9.2/fftw/3.3.5/install.sh>`.

During the testing stage you should see lots of numerical output plus: ::

  --------------------------------------------------------------
           FFTW transforms passed basic tests!
  --------------------------------------------------------------

  --------------------------------------------------------------
           FFTW threaded transforms passed basic tests!
  --------------------------------------------------------------

Next, :download:`this modulefile </iceberg/software/modulefiles/libs/gcc/4.9.2/fftw/3.3.5>` as ``/usr/local/modulefiles/libs/gcc/4.9.2/fftw/3.3.5`` 

**version 3.3.4**

This was compiled with GCC 5.2: ::

    module load compilers/gcc/5.2
    mkdir -p /usr/local/packages6/libs/gcc/5.2/fftw/3.3.4
    tar -xvzf fftw-3.3.4.tar.gz
    cd fftw-3.3.4
    ./configure --prefix=/usr/local/packages6/libs/gcc/5.2/fftw/3.3.4 --enable-threads --enable-openmp --enable-shared
    make
    make check

The result was lots of numerical output and: ::

  --------------------------------------------------------------
           FFTW transforms passed basic tests!
  --------------------------------------------------------------

  --------------------------------------------------------------
           FFTW threaded transforms passed basic tests!
  --------------------------------------------------------------

Installed with: ::

    make install

The modulefile is on the system at ``/usr/local/modulefiles/libs/gcc/5.2/fftw/3.3.4`` ::

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

  prepend-path CPLUS_INCLUDE_PATH $FFTW_DIR/include
  prepend-path LD_LIBRARY_PATH $FFTW_DIR/lib
  prepend-path LIBRARY_PATH $FFTW_DIR/lib
  prepend-path MANPATH $FFTW_DIR/share/man
  prepend-path PATH $FFTW_DIR/bin
