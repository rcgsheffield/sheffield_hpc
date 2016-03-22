Velvet
======

.. sidebar:: Velvet

   :Version:  1.2.10
   :URL: https://www.ebi.ac.uk/~zerbino/velvet/

Sequence assembler for very short reads.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the `qrshx` or `qrsh` command.

To add the velvet binaries to the system PATH, execute the following command ::

        module load apps/gcc/4.4.7/velvet/1.2.10

This makes two programs available:-

* `velvetg` - de Bruijn graph construction, error removal and repeat resolution
* `velveth` - simple hashing program

Installation notes
------------------
Velvet was compiled with gcc 4.4.7 ::

  tar -xvzf ./velvet_1.2.10.tgz
  cd velvet_1.2.10
  make

  mkdir -p /usr/local/packages6/apps/gcc/4.4.7/velvet/1.2.10
  mv * /usr/local/packages6/apps/gcc/4.4.7/velvet/1.2.10

Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/velvet/1.2.10`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## velvet 1.2.10 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes velvet 1.2.10 available"
  }

  set VELVET_DIR /usr/local/packages6/apps/gcc/4.4.7/velvet/1.2.10

  module-whatis   "Makes velevt 1.2.10 available"

  prepend-path PATH $VELVET_DIR
