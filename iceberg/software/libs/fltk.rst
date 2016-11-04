.. _fltk:

FLTK
====

.. sidebar:: FLTK

   :Version: 1.3.3
   :URL: http://www.fltk.org/index.php

FLTK (pronounced "fulltick") is a cross-platform C++ GUI toolkit for UNIX/Linux (X11), Windows, and OS X. FLTK provides modern GUI functionality without the bloat and supports 3D graphics via OpenGL and its built-in GLUT emulation.

Usage
-----

Run one of the following: ::

        module load libs/gcc/5.2/fltk/1.3.3
        module load libs/gcc/4.9.2/fltk/1.3.3

If you are using :ref:`cuda` then you will want to use the version that was built with (and has a runtime dependency on) GCC 4.9.2 as GCC 5.0 and later are not supported by CUDA at this time. 

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 1.3.3 (GCC 4.9.2)**

* Compiled with (and has a runtime dependency on) GCC 4.9.2 (for compatibility with CUDA, which doesn't support GCC >= 5.0.0).  
* Shared-library support and `X Font Library <https://www.freedesktop.org/wiki/Software/Xft/>`_ (Xft) support were enabled at build-time.  
* A pre-requisite for Relion 2-beta.

First, download, configure, build, test and install using :download:`this script </iceberg/software/install_scripts/libs/gcc/4.9.2/fltk/1.3.3/install.sh>`.

Next, :download:`this modulefile </iceberg/software/modulefiles/libs/gcc/4.9.2/fltk/1.3.3>` as ``/usr/local/modulefiles/libs/gcc/4.9.2/fltk/1.3.3`` 

**Version 1.3.3 (GCC 5.2)**

* This is a pre-requisite for GNU Octave version 4.0
* Compiled with (and has a runtime dependency on) GCC 5.2
* Installed using: ::

  module load compilers/gcc/5.2
  mkdir -p /usr/local/packages6/libs/gcc/5.2/fltk/1.3.3
  #tar -xvzf ./fltk-1.3.3-source.tar.gz
  cd fltk-1.3.3

  #Fixes error relating to undefined _ZN18Fl_XFont_On_Demand5valueEv
  #Source https://groups.google.com/forum/#!topic/fltkgeneral/GT6i2KGCb3A
  sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H

  ./configure --prefix=/usr/local/packages6/libs/gcc/5.2/fltk/1.3.3 --enable-shared --enable-xft
  make
  make install

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
