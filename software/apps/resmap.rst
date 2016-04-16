ResMap
======

.. sidebar:: ResMap

   :Versions: 1.1.4
   :URL: http://resmap.readthedocs.org/en/latest/

ResMap (Resolution Map) is a software package for computing the local resolution of 3D density maps studied in structural biology, primarily electron cryo-microscopy.

Making ResMap available
-----------------------
The following module command makes the latest version of gemini available to your session ::

      module load apps/binapps/resmap

Alternatively, you can make a specific version available ::

      module load apps/binapps/resmap/1.1.4

Installation notes
------------------
These are primarily for system administrators.

* ResMap was installed as a precompiled binary from https://sourceforge.net/projects/resmap/files/ResMap-1.1.4-linux64/download


Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/binapps/1.1.4`

The contents of the module file is ::

  #%Module1.0#####################################################################
  ##
  ## ResMap module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
      global bedtools-version

      puts stderr "   Adds `ResMap-$resmapversion' to your PATH environment variable"
  }

  set resmapversion 1.1.4

  prepend-path PATH /usr/local/packages6/apps/binapps/resmap/$resmapversion/
