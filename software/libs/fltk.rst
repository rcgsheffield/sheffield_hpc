.. index::
    single: FLTK

.. _fltk:

FLTK
====

.. sidebar:: FLTK

   :Version: 1.3.3
   :URL: http://www.fltk.org/index.php
   :Location: /usr/local/packages6/libs/gcc/5.2/fltk/1.3.3

FLTK (pronounced "fulltick") is a cross-platform C++ GUI toolkit for UNIX®/Linux® (X11), Microsoft® Windows®, and MacOS® X. FLTK provides modern GUI functionality without the bloat and supports 3D graphics via OpenGL® and its built-in GLUT emulation.

Usage
-----
.. code-block:: none

        module load libs/gcc/5.2/fltk/1.3.3

Installation notes
------------------
This section is primarily for administrators of the system.

* This is a pre-requisite for GNU Octave version 4.0
* It was built with gcc 5.2

.. code-block:: none

  module load compilers/gcc/5.2
  mkdir -p /usr/local/packages6/libs/gcc/5.2/fltk/1.3.3
  tar -xvzf ./fltk-1.3.3-source.tar.gz
  cd fltk-1.3.3-source
  ./configure --prefix=/usr/local/packages6/libs/gcc/5.2/fltk/1.3.3 --enabled-shared
  make
  make install

Module File
-----------
Modulefile at ``/usr/local/modulefiles/libs/gcc/5.2/fltk/1.3.3``

.. code-block:: none

  #%Module1.0#####################################################################
  ##
  ## fltk 1.3.3 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  module load compilers/gcc/5.2

  proc ModulesHelp { } {
          puts stderr "Makes the FLTK 1.3.3 library available"
  }

  set FLTK_DIR /usr/local/packages6/libs/gcc/5.2/fltk/1.3.3

  module-whatis   "Makes the FLTK 1.3.3 library available"

  prepend-path LD_LIBRARY_PATH $FLTK_DIR/lib
  prepend-path CPLUS_INCLUDE_PATH $FLTK_DIR/include
  prepend-path LIBRARY_PATH $FLTK_DIR/lib
  prepend-path PATH $FLTK_DIR/bin
