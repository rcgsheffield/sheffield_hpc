Octave
======

.. sidebar:: Ocatve

   :Versions:  4.0.0
   :URL: https://www.gnu.org/software/octave/

GNU Octave is a high-level interpreted language, primarily intended for numerical computations. It provides capabilities for the numerical solution of linear and nonlinear problems, and for performing other numerical experiments. It also provides extensive graphics capabilities for data visualization and manipulation. Octave is normally used through its interactive command line interface, but it can also be used to write non-interactive programs. The Octave language is quite similar to MATLAB so that most programs are easily portable.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with either the `qsh` or `qrsh` commands.

The latest version of Octave (currently 4.0.0) is made available with the command

.. code-block:: none

        module load apps/gcc/5.2/octave

Alternatively, you can load a specific version with ::

       module load apps/gcc/5.2/octave/4.0

This adds Octave to your PATH and also loads all of the supporting libraries and compilers required by the system.

Start Octave by executing the command ::

       octave

If you are using a `qsh` session, the graphical user interface version will begin. If you are using a `qrsh` session, you will only be able to use the text-only terminal version.

Batch Usage
-----------
Here is an example batch submission script that will run an Octave program called `foo.m` ::

  #!/bin/bash
  # Request 5 gigabytes of real memory (mem)
  # and 5 gigabytes of virtual memory (mem)
  #$ -l mem=5G -l rmem=5G
  # Request 64 hours of run time
  #$ -l h_rt=64:00:00

  module load apps/gcc/5.2/octave/4.0

  octave foo.m

Using Packages (Toolboxes)
--------------------------
Octave toolboxes are referred to as packages. To see which ones are installed, use the command `ver` from within Octave.

Unlike MATLAB, Octave does not load all of its packages at startup. It is necessary to load the package before its commands are available to your session. For example, as with MATLAB, the `pdist` command is part of the statistics package. Unlike MATLAB, `pdist` is not immediately available to you ::

  octave:1> pdist([1 2 3; 2 3 4; 1 1 1])
  warning: the 'pdist' function belongs to the statistics package from Octave
  Forge which you have installed but not loaded. To load the package, run
  `pkg load statistics' from the Octave prompt.

  Please read `http://www.octave.org/missing.html' to learn how you can
  contribute missing functionality.
  warning: called from
      __unimplemented__ at line 524 column 5
  error: 'pdist' undefined near line 1 column 1

As the error message suggests, you need to load the `statistics` package ::

  octave:1> pkg load statistics
  octave:2> pdist([1 2 3; 2 3 4; 1 1 1])
  ans =

     1.7321   2.2361   3.7417

Installation notes
------------------
These are primarily for administrators of the system.

Octave was installed using gcc 5.2 and the following libraries:

* Java 1.8u60
* :ref:`fltk` 1.3.3
* :ref:`fftw` 3.3.4

* Octave was installed using a SGE batch job. The install script is on `github <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/apps/gcc/5.2/octave/install_octave.sh>`_
* The make log is on the system at `/usr/local/packages6/apps/gcc/5.2/octave/4.0/make_octave4.0.0.log`
* The configure log is on the system at `/usr/local/packages6/apps/gcc/5.2/octave/4.0/configure_octave4.0.0.log`

For full functionality, Octave requires a large number of additional libraries to be installed. We have currently not installed all of these but will do so should they be required.

For information, here is the relevant part of the Configure log that describes how Octave was configured ::

    Source directory:            .
    Installation prefix:         /usr/local/packages6/apps/gcc/5.2/octave/4.0
    C compiler:                  gcc  -pthread -fopenmp  -Wall -W -Wshadow -Wforma
  t -Wpointer-arith -Wmissing-prototypes -Wstrict-prototypes -Wwrite-strings -Wcas
  t-align -Wcast-qual  -I/usr/local/packages6/compilers/gcc/5.2.0/include
    C++ compiler:                g++  -pthread -fopenmp  -Wall -W -Wshadow -Wold-s
  tyle-cast -Wformat -Wpointer-arith -Wwrite-strings -Wcast-align -Wcast-qual -g -
  O2
    Fortran compiler:            gfortran -O
    Fortran libraries:            -L/usr/local/packages6/compilers/gcc/5.2.0/lib -
  L/usr/local/packages6/compilers/gcc/5.2.0/lib64 -L/usr/local/packages6/compilers
  /gcc/5.2.0/lib/gcc/x86_64-unknown-linux-gnu/5.2.0 -L/usr/local/packages6/compile
  rs/gcc/5.2.0/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/../../../../lib64 -L/lib/../
  lib64 -L/usr/lib/../lib64 -L/usr/local/packages6/libs/gcc/5.2/fftw/3.3.4/lib -L/
  usr/local/packages6/libs/gcc/5.2/fltk/1.3.3/lib -L/usr/local/packages6/compilers
  /gcc/5.2.0/lib/gcc/x86_64-unknown-linux-gnu/5.2.0/../../.. -lgfortran -lm -lquad
  math
    Lex libraries:
    LIBS:                        -lutil -lm

    AMD CPPFLAGS:
    AMD LDFLAGS:
    AMD libraries:
    ARPACK CPPFLAGS:
    ARPACK LDFLAGS:
    ARPACK libraries:
    BLAS libraries:              -lblas
    CAMD CPPFLAGS:
    CAMD LDFLAGS:
    CAMD libraries:
    CARBON libraries:
    CCOLAMD CPPFLAGS:
    CCOLAMD LDFLAGS:
    CCOLAMD libraries:
    CHOLMOD CPPFLAGS:
    CHOLMOD LDFLAGS:
    CHOLMOD libraries:
    COLAMD CPPFLAGS:
    COLAMD LDFLAGS:
    COLAMD libraries:
    CURL CPPFLAGS:
    CURL LDFLAGS:
    CURL libraries:              -lcurl
    CXSPARSE CPPFLAGS:
    CXSPARSE LDFLAGS:
    CXSPARSE libraries:
    DL libraries:
    FFTW3 CPPFLAGS:
    FFTW3 LDFLAGS:
    FFTW3 libraries:             -lfftw3_threads -lfftw3
    FFTW3F CPPFLAGS:
    FFTW3F LDFLAGS:
    FFTW3F libraries:            -lfftw3f_threads -lfftw3f
    FLTK CPPFLAGS:               -I/usr/local/packages6/libs/gcc/5.2/fltk/1.3.3/in
  clude -I/usr/include/freetype2 -I/usr/local/packages6/compilers/gcc/5.2.0/includ
  e -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT
    FLTK LDFLAGS:                -L/usr/local/packages6/libs/gcc/5.2/fltk/1.3.3/li
  b -Wl,-rpath,/usr/local/packages6/libs/gcc/5.2/fltk/1.3.3/lib -L/usr/local/packa
  ges6/compilers/gcc/5.2.0/lib -L/usr/local/packages6/compilers/gcc/5.2.0/lib64 -l
  fltk_gl -lGLU -lGL -lfltk -lXcursor -lXfixes -lXext -lXft -lfontconfig -lXineram
  a -lpthread -ldl -lm -lX11
    FLTK libraries:
    fontconfig CPPFLAGS:
    fontconfig libraries:        -lfontconfig
    FreeType2 CPPFLAGS:          -I/usr/include/freetype2
    FreeType2 libraries:         -lfreetype
    GLPK CPPFLAGS:
    GLPK LDFLAGS:
    GLPK libraries:
    HDF5 CPPFLAGS:
    HDF5 LDFLAGS:
    HDF5 libraries:              -lhdf5
    Java home:                   /usr/local/packages6/apps/binapps/java/jre1.8.0_6
  0/
    Java JVM path:               /usr/local/packages6/apps/binapps/java/jre1.8.0_6
  0/lib/amd64/server
    Java CPPFLAGS:               -I/usr/local/packages6/apps/binapps/java/jre1.8.0
  _60//include -I/usr/local/packages6/apps/binapps/java/jre1.8.0_60//include/linux
    Java libraries:
    LAPACK libraries:            -llapack
    LLVM CPPFLAGS:
    LLVM LDFLAGS:
    LLVM libraries:
    Magick++ CPPFLAGS:
    Magick++ LDFLAGS:
    Magick++ libraries:
    OPENGL libraries:            -lfontconfig   -lGL -lGLU
    OSMesa CPPFLAGS:
    OSMesa LDFLAGS:
    OSMesa libraries:
    PCRE CPPFLAGS:
    PCRE libraries:              -lpcre
    PortAudio CPPFLAGS:
    PortAudio LDFLAGS:
    PortAudio libraries:
    PTHREAD flags:               -pthread
    PTHREAD libraries:
    QHULL CPPFLAGS:
    QHULL LDFLAGS:
    QHULL libraries:
    QRUPDATE CPPFLAGS:
    QRUPDATE LDFLAGS:
    QRUPDATE libraries:
    Qt CPPFLAGS:                 -I/usr/include/QtCore -I/usr/include/QtGui -I/usr
  /include/QtNetwork -I/usr/include/QtOpenGL
    Qt LDFLAGS:
    Qt libraries:                -lQtNetwork -lQtOpenGL -lQtGui -lQtCore
    READLINE libraries:          -lreadline
    Sndfile CPPFLAGS:
    Sndfile LDFLAGS:
    Sndfile libraries:
    TERM libraries:              -lncurses
    UMFPACK CPPFLAGS:
    UMFPACK LDFLAGS:
    UMFPACK libraries:
    X11 include flags:
    X11 libraries:               -lX11
    Z CPPFLAGS:
    Z LDFLAGS:
    Z libraries:                 -lz

    Default pager:               less
    gnuplot:                     gnuplot

    Build Octave GUI:                   yes
    JIT compiler for loops:             no
    Build Java interface:               no
    Do internal array bounds checking:  no
    Build static libraries:             no
    Build shared libraries:             yes
    Dynamic Linking:                    yes (dlopen)
    Include support for GNU readline:   yes
    64-bit array dims and indexing:     no
    OpenMP SMP multithreading:          yes
    Build cross tools:                  no

  configure: WARNING:

  I didn't find gperf, but it's only a problem if you need to
  reconstruct oct-gperf.h

  configure: WARNING:

  I didn't find icotool, but it's only a problem if you need to
  reconstruct octave-logo.ico, which is the case if you're building from
  VCS sources.

  configure: WARNING: Qhull library not found.  This will result in loss of functi
  onality of some geometry functions.
  configure: WARNING: GLPK library not found.  The glpk function for solving linea
  r programs will be disabled.
  configure: WARNING: gl2ps library not found.  OpenGL printing is disabled.
  configure: WARNING: OSMesa library not found.  Offscreen rendering with OpenGL w
  ill be disabled.
  configure: WARNING: qrupdate not found.  The QR & Cholesky updating functions wi
  ll be slow.
  configure: WARNING: AMD library not found.  This will result in some lack of fun
  ctionality for sparse matrices.
  configure: WARNING: CAMD library not found.  This will result in some lack of fu
  nctionality for sparse matrices.
  configure: WARNING: COLAMD library not found.  This will result in some lack of
  functionality for sparse matrices.
  configure: WARNING: CCOLAMD library not found.  This will result in some lack of
   functionality for sparse matrices.
  configure: WARNING: CHOLMOD library not found.  This will result in some lack of
   functionality for sparse matrices.
  configure: WARNING: CXSparse library not found.  This will result in some lack o
  f functionality for sparse matrices.
  configure: WARNING: UMFPACK not found.  This will result in some lack of functio
  nality for sparse matrices.
  configure: WARNING: ARPACK not found.  The eigs function will be disabled.
  configure: WARNING: Include file <jni.h> not found.  Octave will not be able to
  call Java methods.
  configure: WARNING: Qscintilla library not found -- disabling built-in GUI editor
  configure:

* Some commonly-used packages were additionally installed from `Octave Forge <http://octave.sourceforge.net/>`_ using the following commands from within Octave ::

    pkg install -global -forge io
    pkg install -global -forge statistics
    pkg install -global -forge mapping
    pkg install -global -forge image
    pkg install -global -forge struct
    pkg install -global -forge optim

Module File
-----------

The module file is `octave_4.0 <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/5.2/octave/4.0>`_
