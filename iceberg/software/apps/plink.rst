Plink
=====

.. sidebar:: Plink

   :Versions:  1.90 beta 3.42
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

Alternatively, you can load a specific version.  To access the latest version (build date 20 Sep 2016) ::

       module load apps/binapps/plink/1.90b3.42

An older build of Plink 1.9 (15 Jul 2015) is also available :: 

       module load apps/binapps/plink/1.90b3v

After making a version of Plink available you can then run it using ``plink`` on the command line.

Installation notes
------------------
These are primarily for administrators of the system.

Both versions of Plink were installed like so ::

  $ver=1.90b3.42  # or 1.90b3v

  mkdir plink_build
  cd plink_build
  unzip plink_linux_x86_64.zip
  rm plink_linux_x86_64.zip
  mkdir -p /usr/local/packages6/apps/binapps/plink/$ver
  mv * /usr/local/packages6/apps/binapps/plink/$ver

The modulefiles are at ``/usr/local/modulefiles/apps/binapps/plink/$ver`` ::

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
  set     ver     1.90b3.42  # or 1.90b3v

  module-whatis   "sets the necessary Plink $ver paths"

  prepend-path PATH /usr/local/packages6/apps/binapps/plink/$ver
