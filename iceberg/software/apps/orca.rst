orca
====

.. sidebar:: orca

   :Versions:  3.0.3
   :URL: https://orcaforum.cec.mpg.de/

ORCA is a flexible, efficient and easy-to-use general purpose tool for quantum chemistry with specific emphasis on spectroscopic properties of open-shell molecules. It features a wide variety of standard quantum chemical methods ranging from semiempirical methods to DFT to single- and multireference correlated ab initio methods. It can also treat environmental and relativistic effects.

Making orca available
-----------------------
The following module command makes the latest version of orca available to your session ::

      module load apps/binapps/orca

Alternatively, you can make a specific version available ::

      module load apps/binapps/orca/3.0.3

Example single core job
-----------------------
Create a file called **orca_serial.inp** that contains the following orca commands ::

  #
  # My first ORCA calculation :-)
  #
  # Taken from the Orca manual
  # https://orcaforum.cec.mpg.de/OrcaManual.pdf
  ! HF SVP
  * xyz 0 1
    C 0 0 0
    O 0 0 1.13
  *

Create a Sun Grid Engine submission file called **submit_serial.sh** that looks like this ::

  #!/bin/bash
  # Request 4 Gig of virtual memory per process
  #$ -l mem=4G
  # Request 4 Gig of real memory per process
  #$ -l rmem=4G

  module load apps/binapps/orca/3.0.3
  $ORCAHOME/orca example1.inp

Submit the job to the queue with the command ::

    qsub submit_serial.sh

Example parallel job
--------------------
An example Sun Grid Engine submission script is ::

  #!/bin/bash
  #Request 4 Processes
  #Ensure that this matches the number requested in your Orca input file
  #$ -pe openmpi-ib 4
  # Request 4 Gig of virtual memory per process
  #$ -l mem=4G
  # Request 4 Gig of real memory per process
  #$ -l rmem=4G

  module load mpi/gcc/openmpi/1.8.8
  module load apps/binapps/orca/3.0.3

  ORCAPATH=/usr/local/packages6/apps/binapps/orca/3.0.3/
  $ORCAPATH/orca example2_parallel.inp

Register as a user
------------------
You are encouraged to register as a user of Orca at `https://orcaforum.cec.mpg.de/ <https://orcaforum.cec.mpg.de/>`_ in order to take advantage of updates, announcements and also of the users forum.

Documentation
-------------
A comprehensive .pdf `manual <https://orcaforum.cec.mpg.de/OrcaManual.pdf>`_ is available online.

Installation notes
------------------
These are primarily for system administrators. Orca was a binary install ::

  tar -xjf ./orca_3_0_3_linux_x86-64.tbz
  cd orca_3_0_3_linux_x86-64
  mkdir -p /usr/local/packages6/apps/binapps/orca/3.0.3
  mv * /usr/local/packages6/apps/binapps/orca/3.0.3/

Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/binapps/orca/3.0.3`

The contents of the module file are ::

  #%Module1.0#####################################################################
  ##
  ## Orca module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
        global bedtools-version

        puts stderr "   Adds `orca-$orcaversion' to your PATH environment variable"
  }

  set orcaversion 3.0.3
  prepend-path ORCAHOME /usr/local/packages6/apps/binapps/orca/3.0.3/
  prepend-path PATH /usr/local/packages6/apps/binapps/orca/3.0.3/
