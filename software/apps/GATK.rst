GATK
====

.. sidebar:: GATK

   :Version: 3.4-46
   :URL: https://www.broadinstitute.org/gatk/

The Genome Analysis Toolkit or GATK is a software package for analysis of high-throughput sequencing data, developed by the Data Science and Data Engineering group at the Broad Institute. The toolkit offers a wide variety of tools, with a primary focus on variant discovery and genotyping as well as strong emphasis on data quality assurance. Its robust architecture, powerful processing engine and high-performance computing features make it capable of taking on projects of any size.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive sesssion with the `qsh` or `qrsh` command.

The latest version of GATK (currently 3.4-46) is made available with the command

.. code-block:: none

        module load apps/binapps/GATK

Alternatively, you can load a specific version with ::

        module load apps/binapps/GATK/3.4-46
        module load apps/binapps/GATK/2.6-5

Version 3.4-46 of GATK also changes the environment to use Java 1.7 since this is required by GATK 3.4-46.
An environment variable called `GATKHOME` is created by the module command that contains the path to the requested version of GATK.

Thus, you can run the program with the command ::

  java -jar $GATKHOME/GenomeAnalysisTK.jar -h

Which will give a large amount of help, beginning with the version information ::

  ---------------------------------------------------------------------------------
  The Genome Analysis Toolkit (GATK) v3.4-46-gbc02625, Compiled 2015/07/09 17:38:12
  Copyright (c) 2010 The Broad Institute
  For support and documentation go to http://www.broadinstitute.org/gatk
  ---------------------------------------------------------------------------------

Documentation
-------------
The GATK manual is available online https://www.broadinstitute.org/gatk/guide/

Installation notes
------------------
The entire install is just a .jar file. Put it in the install directory and you're done.

Modulefile
----------
**Version 3.4-46**

* The module file is on the system at `/usr/local/modulefiles/apps/binapps/GATK/3.4-46`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## GATK 3.4-46 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  #This version of GATK needs Java 1.7
  module load apps/java/1.7

  proc ModulesHelp { } {
          puts stderr "Makes GATK 3.4-46 available"
  }


  set version 3.4-46
  set GATK_DIR /usr/local/packages6/apps/binapps/GATK/$version

  module-whatis   "Makes GATK 3.4-46 available"

  prepend-path GATKHOME $GATK_DIR

**Version 3.6-5**

* The module file is on the system at `/usr/local/modulefiles/apps/binapps/GATK/2.6-5`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## GATK 2.6-5 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes GATK 3.4-46 available"
  }


  set version 2.6.5
  set GATK_DIR /usr/local/packages6/apps/binapps/GATK/$version

  module-whatis   "Makes GATK 2.6-5 available"

  prepend-path GATKHOME $GATK_DIR
