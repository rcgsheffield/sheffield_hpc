Integrative Genomics Viewer (IGV)
=================================

.. sidebar:: Integrative Genomics Viewer (IGV)

   :Version:  2.3.63
   :URL: https://www.broadinstitute.org/igv/

The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an graphical interactive session with the `qsh` command. In testing, we determined that you need to request at least 7 Gigabytes of memory to launch IGV ::

       qsh -l mem=7G

The latest version of IGV (currently 2.3.63) is made available with the command

.. code-block:: none

        module load apps/binapps/igv

Alternatively, you can load a specific version with ::

        module load apps/binapps/igv/2.3.63

This command makes the IGV binary directory available to your session by adding it to the PATH environment variable. Launch the applications with the command ::

        igv.sh

Documentation
-------------

The IGV user guide is available online at https://www.broadinstitute.org/igv/UserGuide

Installation notes
------------------
A binary install was used ::

  unzip IGV_2.3.63.zip
  mkdir -p /usr/local/packages6/apps/binapps/IGV
  mv ./IGV_2.3.63 /usr/local/packages6/apps/binapps/IGV/2.3.63
  rm /usr/local/packages6/apps/binapps/IGV/2.3.63/igv.bat

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/binapps/igv/2.3.63`

Its contents ::

  #%Module1.0#####################################################################
  ##
  ## IGV 2.3.63 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes IGV 2.3.63 available"
  }

  set version 2.3.63
  set IGV_DIR /usr/local/packages6/apps/binapps/IGV/$version

  module-whatis   "Makes IGV 2.3.63 available"

  prepend-path PATH $IGV_DIR
