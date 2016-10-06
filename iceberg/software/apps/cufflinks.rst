Cufflinks
=========

.. sidebar:: Cufflinks

   :Version:  2.2.1
   :URL: http://cole-trapnell-lab.github.io/cufflinks

Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.
It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or `qrsh` command.

The latest version of Cufflinks (currently 2.2.1) is made available with the command

.. code-block:: none

        module load apps/binapps/cufflinks

Alternatively, you can load a specific version with ::

        module load apps/binapps/cufflinks/2.2.1

This command makes the cufflinks binary directory available to your session by adding it to the PATH environment variable.

Documentation
-------------
The Cufflinks manual is available online at http://cole-trapnell-lab.github.io/cufflinks/manual/

Installation notes
------------------
A binary install was used ::

    tar -xvzf cufflinks-2.2.1.Linux_x86_64.tar.gz
    mkdir -p /usr/local/packages6/apps/binapps/cufflinks
    mv cufflinks-2.2.1.Linux_x86_64 /usr/local/packages6/apps/binapps/cufflinks/2.2.1

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/binapps/cufflinks/2.2.1`

Its contents are ::

  ## cufflinks 2.2.1 modulefile
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes cufflinks 2.2.1 available"
  }

  set version 2.2.1
  set CUFF_DIR /usr/local/packages6/apps/binapps/cufflinks/$version

  module-whatis   "Makes cufflinks 2.2.1 available"

  prepend-path PATH $CUFF_DIR
