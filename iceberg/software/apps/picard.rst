Picard
======

.. sidebar:: Picard

   :Version: 1.129
   :URL: https://github.com/broadinstitute/picard/

A set of Java command line tools for manipulating high-throughput sequencing (HTS) data and formats. Picard is implemented using the HTSJDK Java libraryHTSJDK, supporting accessing of common file formats, such as SAM and VCF, used for high-throughput sequencing data.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` or :ref:`qrsh` command, preferably requesting at least 8 Gigabytes of memory ::

    qrsh -l mem=8G -l rmem=8G

The latest version of Picard (currently 1.129) is made available with the command ::

        module load apps/binapps/picard

Alternatively, you can load a specific version with ::

        module load apps/binapps/picard/1.129
        module load apps/binapps/picard/1.101

These module commands also changes the environment to use Java 1.6 since this is required by Picard 1.129. An environment variable called `PICARDHOME` is created by the module command that contains the path to the requested version of Picard.

Thus, you can run the program with the command ::

  java -jar $PICARDHOME/picard.jar

Installation notes
------------------
**Version 1.129**

A binary install was used. The binary came from the releases page of the project's github repo ::

  unzip picard-tools-1.129.zip
  mkdir -p /usr/local/packages6/apps/binapps/picard
  mv ./picard-tools-1.129 /usr/local/packages6/apps/binapps/picard/1.129

**Version 1.101**

A binary install was used. The binary came from the project's sourceforge site  `https://sourceforge.net/projects/picard/files/picard-tools/ <https://sourceforge.net/projects/picard/files/picard-tools/>`_ ::

  unzip picard-tools-1.101.zip
  mv ./picard-tools-1.101 /usr/local/packages6/apps/binapps/picard/1.101/


Modulefile
----------
**Version 1.129**

The module file is on the system at `/usr/local/modulefiles/apps/binapps/picard/1.129`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## Picard 1.129 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  #This version of Picard needs Java 1.6
  module load apps/java/1.6

  proc ModulesHelp { } {
          puts stderr "Makes Picard 1.129 available"
  }


  set version 1.129
  set PICARD_DIR /usr/local/packages6/apps/binapps/picard/$version

  module-whatis   "Makes Picard 1.129 available"

  prepend-path PICARDHOME $PICARD_DIR

**Version 1.101**

The module file is on the system at `/usr/local/modulefiles/apps/binapps/picard/1.101`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## Picard 1.101 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  #This version of Picard needs Java 1.6
  module load apps/java/1.6

  proc ModulesHelp { } {
          puts stderr "Makes Picard 1.101 available"
  }


  set version 1.101
  set PICARD_DIR /usr/local/packages6/apps/binapps/picard/$version

  module-whatis   "Makes Picard 1.101 available"

  prepend-path PICARDHOME $PICARD_DIR
