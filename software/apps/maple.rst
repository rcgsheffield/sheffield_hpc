Maple
=====

.. sidebar:: Maple

   :Versions:  2015
   :Support Level: FULL
   :Dependancies: None
   :URL: http://www.maplesoft.com/products/maple/

Scientific Computing and Visualisation

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` command.

The latest version of Maple (currently 2015) is made available with the command ::

        module load apps/binapps/maple

Alternatively, you can load a specific version with ::

       module load apps/binapps/maple/2015

You can then run the graphical version of Maple by entering ``xmaple`` or the command line version by entering ``maple``.

Batch usage
-----------
It is not possible to run Maple worksheets in batch mode. Instead, you must convert your worksheet to a pure text file that contains a set of maple input commands. You can do this in Maple by opening your worksheet and clicking on **File->Export As->Maple Input**. The result will have the file extension .mpl

An example Sun Grid Engine submission script that makes use of a .mpl file called, for example, **mycode.mpl** is ::

    #!/bin/bash
    # Request 4 gigabytes of real memory (mem)
    # and 4 gigabytes of virtual memory (mem)
    #$ -l mem=4G -l rmem=4G

    module load apps/binapps/maple/2015

    maple < mycode.mpl

For general information on how to submit batch jobs refer to :ref:`sge-batch`

Installation notes
------------------
These are primarily for administrators of the system.

The module file is at ``/usr/local/modulefiles/apps/binapps/maple/2015`` ::

  #%Module10.2####################################################################
  #

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          global ver

          puts stderr " Makes Maple $ver available to the system."
  }

  # Maple version (not in the user's environment)
  set     ver     2015

  module-whatis   "sets the necessary Maple $ver paths"

  prepend-path PATH /usr/local/packages6/maple/bin/
