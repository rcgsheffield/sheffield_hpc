.. index::
    single: Plink

Plink
=====

.. sidebar:: Plink

   :Versions:  1.9 beta 3
   :Support Level: Bronze
   :Dependancies: None
   :URL: https://www.cog-genomics.org/plink2

PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the ```qsh`` or ``qrsh`` command.

The latest version of Plink is made available with the command

.. code-block:: none

        module load apps/binapps/plink

Alternatively, you can load a specific version with ::

       module load apps/binapps/plink/1.9

You can now execute the ``plink`` command on the command line.

Installation notes
------------------
These are primarily for administrators of the system.

The binary version of Plink was installed ::

  mkdir plink_build
  cd plink_build
  unzip plink_linux_x86_64.zip
  rm plink_linux_x86_64.zip
  mkdir -p /usr/local/packages6/apps/binapps/plink/1.9
  mv * /usr/local/packages6/apps/binapps/plink/1.9

The module file is at ``/usr/local/modulefiles/apps/binapps/plink/1.9`` ::

  #%Module10.2####################################################################
  #

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          global ver

          puts stderr " Makes Plink $ver available to the system."
  }

  # Plink version (not in the user's environment)
  set     ver     1.9

  module-whatis   "sets the necessary Plink $ver paths"

  prepend-path PATH /usr/local/packages6/apps/binapps/plink/$ver
