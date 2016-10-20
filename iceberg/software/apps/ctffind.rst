ctffind
=======

.. sidebar:: ctffind

   :Versions:  3.140609
   :URL: http://grigoriefflab.janelia.org/ctf

CTFFIND3 and CTFTILT are two programs for finding CTFs of electron micrographs.  The program CTFFIND3 is an updated version of the program CTFFIND2, which was developed in 1998 by Nikolaus Grigorieff at the MRC Laboratory of Molecular Biology in Cambridge, UK with financial support from the MRC. This software is licensed under the terms of the Janelia Research Campus Software Copyright 1.1.

Making ctffind available
------------------------
The following module command makes the latest version of gemini available to your session ::

      module load apps/gcc/4.4.7/ctffind

Alternatively, you can make a specific version available ::

      module load apps/gcc/4.4.7/ctffind/3.140609

Installation notes
------------------
These are primarily for system administrators.

* ctffind was installed using the gcc 4.4.7 compiler
* `install_ctffind.sh <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/apps/gcc/4.4.7/ctffind/3.140609/install_ctffind.sh>`_


Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/ctffind/3.140609`

The contents of the module file is ::

  #%Module1.0#####################################################################
  ##
  ## ctfind module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
        global bedtools-version

        puts stderr "   Adds `ctffind-$ctffindversion' to your PATH environment variable"
  }

  set     ctffindversion 3.140609

  prepend-path PATH /usr/local/packages6/apps/gcc/4.4.7/ctffind/3.140609/
