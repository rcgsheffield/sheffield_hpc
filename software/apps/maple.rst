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

The latest version of Maple (currently 2015) is made available with the command

.. code-block:: none

        module load apps/binapps/maple

Alternatively, you can load a specific version with ::

       module load apps/binapps/maple/2015

You can then run the graphical version of Maple by entering ``xmaple`` or the command line version by entering ``maple``.

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
