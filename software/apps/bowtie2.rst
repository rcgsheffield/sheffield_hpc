.. index::
    single: Bowtie

.. _bowtie2:

Bowtie2
=======

.. sidebar:: bowtie2

   :Versions:  2.2.26
   :URL: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml

Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome, its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive sesssion with the `qsh` or `qrsh` command.

The latest version of bowtie2 (currently 2.2.26) is made available with the command

.. code-block:: none

    module load apps/gcc/5.2/bowtie2

Alternatively, you can load a specific version with ::

    module load apps/gcc/5.2/bowtie2/2.2.6

This command makes the bowtie2 executables available to your session by adding the install directory to your PATH variable. This allows you to simply do something like the following ::

    bowtie2 --version

which gives results that looks something like ::

  /usr/local/packages6/apps/gcc/5.2/bowtie2/2.2.6/bowtie2-align-s version 2.2.6
  64-bit
  Built on node063
  Fri Oct 23 08:40:38 BST 2015
  Compiler: gcc version 5.2.0 (GCC)
  Options: -O3 -m64 -msse2  -funroll-loops -g3 -DPOPCNT_CAPABILITY
  Sizeof {int, long, long long, void*, size_t, off_t}: {4, 8, 8, 8, 8, 8}

Installation notes
------------------
bowtie2 2.2.6 was installed using gcc 5.2 ::

  #Build
  module load compilers/gcc/5.2
  unzip bowtie2-2.2.6-source.zip
  cd bowtie2-2.2.6
  make

  #Install
  cd ..
  mkdir -p /usr/local/packages6/apps/gcc/5.2/bowtie2
  mv ./bowtie2-2.2.6 /usr/local/packages6/apps/gcc/5.2/bowtie2/2.2.6

Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bowtie2/2.2.6`

The contents of the module file is ::

  #%Module1.0#####################################################################
  ##
  ## bowtie2 2.2.6 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  module load compilers/gcc/5.2


  proc ModulesHelp { } {
          puts stderr "Makes bowtie 2.2.6 available"
  }

  set version 2.2.6
  set BOWTIE2_DIR /usr/local/packages6/apps/gcc/5.2/bowtie2/$version

  module-whatis   "Makes bowtie2 v2.2.6 available"

  prepend-path PATH $BOWTIE2_DIR
