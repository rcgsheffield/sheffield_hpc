relion
======

.. sidebar:: relion

   :Versions:  1.4
   :URL: http://relion.readthedocs.org/en/latest/

RELION is a software package that performs an empirical Bayesian approach to (cryo-EM) structure de-termination by single-particle analysis. Note that RELION is distributed under a GPL license. 

Making RELION available
-----------------------
The following module command makes the latest version of gemini available to your session ::

      module load apps/gcc/4.4.7/relion

Alternatively, you can make a specific version available ::

      module load apps/gcc/4.4.7/relion/1.4

Installation notes
------------------
These are primarily for system administrators.

Install instructions: http://www2.mrc-lmb.cam.ac.uk/relion/index.php/Download_%26_install

* RELION was installed using the gcc 4.4.7 compiler and Openmpi 1.8.8
* `install_relion.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/4.4.7/relion/1.4/install_relion.sh>`_
* Note - the environment variable RELION_QSUB_TEMPLATE points to an SGE qsub template, which needs customizing to work with our environment

Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/relion/1.4`

The contents of the module file is ::

  #%Module1.0#####################################################################
  ##
  ## relion module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
      global bedtools-version

      puts stderr "   Setups `relion-$relionversion' environment variables"
  }

  set     relionversion 1.4

  module load apps/gcc/4.4.7/ctffind/3.140609
  module load apps/binapps/resmap/1.1.4
  module load mpi/gcc/openmpi/1.8.8

  prepend-path PATH /usr/local/packages6/apps/gcc/4.4.7/relion/1.4/bin
  prepend-path LD_LIBRARY_PATH /usr/local/packages6/apps/gcc/4.4.7/relion/1.4/lib
  setenv RELION_QSUB_TEMPLATE /usr/local/packages6/apps/gcc/4.4.7/relion/1.4/bin/relion_qsub.csh
  setenv RELION_CTFFIND_EXECUTABLE ctffind3_mp.exe
  setenv RELION_RESMAP_EXECUTABLE /usr/local/packages6/apps/binapps/resmap/1.1.4
