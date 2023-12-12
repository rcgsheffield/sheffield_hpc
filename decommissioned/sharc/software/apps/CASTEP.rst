.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

CASTEP
======

.. sidebar:: CASTEP

   :Versions: 16.11 and 18.1
   :Dependencies: Intel compilers, Intel MKL libraries and Open MPI
   :URL: http://www.castep.org/
   :Documentation: http://www.castep.org/CASTEP/Documentation

Licensing
---------
Only licensed users of CASTEP are entitled to use it and 
license details are available on `CASTEP's website <http://www.castep.org/CASTEP/GettingCASTEP>`_. 
Access to CASTEP on the system is controlled using a Unix group. 
That is, only members of the ``castep`` group can access and run the program. 
To be added to this group, you will need to contact ``research-it@sheffield.ac.uk`` 
and provide evidence of your eligibility to use CASTEP.

Interactive Usage
-----------------
The serial version of CASTEP should be used for interactive usage. 
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the ``qrsh`` or ``qrshx`` command. 
Make the serial version of CASTEP available using one of the following commands:

.. code-block:: bash

   module load apps/castep/16.11/intel-15.0.7
   module load apps/castep/18.1/intel-17.0.0

The CASTEP executable is called ``castep.serial`` so if you execute:

.. code-block:: bash

    castep.serial

You should get the following: ::

        Usage:
        castep <seedname>                : Run files <seedname>.cell [and <seedname>.param]
          "    [-d|--dryrun] <seedanme>  : Perform a dryrun calculation on files <seedname>.cell
          "    [-s|--search] <text>      : print list of keywords with <text> match in description
          "    [-v|--version]            : print version information
          "    [-h|--help] <keyword>     : describe specific keyword in <>.cell or <>.param
          "         "      all           : print list of all keywords
          "         "      basic         : print list of basic-level keywords
          "         "      inter         : print list of intermediate-level keywords
          "         "      expert        : print list of expert-level keywords
          "         "      dummy         : print list of dummy keywords

If, instead, you get: ::

        -bash: castep.serial: command not found

It is probably because you are not a member of the ``castep`` group. 
See Licensing_ for details on how to be added to this group.

Interactive usage is fine for small CASTEP jobs such as the Silicon example given in 
the CASTEP `Basics and Bonding <http://www.castep.org/Tutorials/BasicsAndBonding>`_ tutorial. 

To run this example, you can do:

.. code-block:: bash

   # Get the files, decompress them and enter the directory containing them
   wget http://www.castep.org/files/Si2.tgz
   tar -xvzf ./Si2.tgz
   cd Si2

   # Run the CASTEP job in serial
   castep.serial Si2

   # Read the output using the less command
   less Si2.castep

CASTEP has a built in help system. To get more information on using castep use:

.. code-block:: bash

   castep.serial -help

Alternatively you can search for help on a particular topic:

.. code-block:: bash

   castep.serial -help search keyword

or list all of the input parameters:

.. code-block:: bash

   castep.serial -help search all

Batch Submission - Parallel
---------------------------
The parallel version of CASTEP is called ``castep.mpi``. 
To make the parallel environment available, use one of the following commands:

.. code-block:: bash

   module load apps/castep/16.11/intel-15.0.7-openmpi-2.0.1
   module load apps/castep/18.1/intel-17.0.0-openmpi-2.0.1

As an example of a parallel submission, we will calculate the bandstructure of graphite following 
the CASTEP `Band Structure and DOS <http://www.castep.org/Tutorials/BandStructureAndDOS>`_ tutorial.

After connecting to ShARC (see :ref:`ssh`),  
start an interactive session with the ``qrsh`` or ``qrshx`` command. 
Download and decompress the example input files with the commands:

.. code-block:: bash

   wget http://www.castep.org/files/bandstructure.tgz
   tar -xvzf ./bandstructure.tgz

Enter the directory containing the input files for graphite:

.. code-block:: bash

   cd bandstructure/graphite/

Create a file called ``submit.sge`` that contains the following:

.. code-block:: bash

   #!/bin/bash
   #$ -pe mpi 4    # Run the calculation on 4 CPU cores
   #$ -l rmem=4G   # Request 4 GB of real memory per core
   module load apps/castep/16.11/intel-15.0.7-openmpi-2.0.1
 
   mpirun castep.mpi graphite

Submit it to the system with the command:

.. code-block:: bash

   qsub submit.sge

After the calculation has completed, get an overview of the calculation by looking at the file ``graphite.castep``:

.. code-block:: bash

   more graphite.castep

Installation Notes
------------------
These are primarily for system administrators.

Version 16.11
^^^^^^^^^^^^^

Serial (no MPI) and parallel (MPI) builds were compiled. 
Both builds were compiled with Intel compiler 15.0.7 (including the Intel MKL 2015.7 for BLAS and FFT routines).  
The parallel build was compiled using OpenMPI 2.0.1.

Both builds were installed using :download:`this script </decommissioned/sharc/software/install_scripts/apps/castep/16.11/intel-15.0.7/install.sh>`.  
**Note** that this compiles both builds in ``/data/$USER`` as the build directory must be availble to all cluster nodes 
to allow for subsequent Testing_ of the parallel build.  
~2.2 GB of free space is required.

* :download:`The serial build modulefile </decommissioned/sharc/software/modulefiles/apps/castep/16.11/intel-15.0.7>` was installed as 
  ``/usr/local/modulefiles/apps/castep/16.11/intel-15.0.7``
* :download:`The parallel build modulefile </decommissioned/sharc/software/modulefiles/apps/castep/16.11/intel-15.0.7-openmpi-2.0.1>` was installed as 
  ``/usr/local/modulefiles/apps/castep/16.11/intel-15.0.7-openmpi-2.0.1``

Version 18.1
^^^^^^^^^^^^^

Serial (no MPI) and parallel (MPI) builds were compiled. 
Both builds were compiled with Intel compiler 17.0.0 (including the Intel MKL 2017.0 for BLAS and FFT routines).  
The parallel build was compiled using OpenMPI 2.0.1.

Both builds were installed using :download:`this script </decommissioned/sharc/software/install_scripts/apps/castep/18.1/intel-17.0.0-openmpi-2.0.1/install_castep_18.1.sh>`.  

* :download:`The serial build modulefile </decommissioned/sharc/software/modulefiles/apps/castep/18.1/intel-17.0.0>` was installed as 
  ``/usr/local/modulefiles/apps/castep/18.1/intel-17.0.0``
* :download:`The parallel build modulefile </decommissioned/sharc/software/modulefiles/apps/castep/18.1/intel-17.0.0-openmpi-2.0.1>` was installed as 
  ``/usr/local/modulefiles/apps/castep/18.1/intel-17.0.0-openmpi-2.0.1``

Testing
-------

Version 16.11, serial build
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following script was submitted via ``qsub`` from the ``Test`` subdirectory of the build directory:

.. code-block:: bash

   #!/bin/bash
   #$ -l rmem=10G
   module load apps/castep/16.11/intel-15.0.7

   cd /scratch/$USER/castep/16.11/intel-15.0.7/serial/Test
   ../bin/testcode.py -q  --total-processors=1 -e castep.serial -c simple -v -v -v

All 416 tests passed.  Results can be found in :download:`castep_16_11_serial_sharc_build_tests.log </decommissioned/sharc/software/install_scripts/apps/castep/16.11/intel-15.0.7/castep_16_11_serial_sharc_build_tests.log>`.  

Version 16.11, parallel build
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following script was submitted via ``qsub`` from the ``Test`` subdirectory of the build directory:

.. code-block:: bash

   #!/bin/bash
   #$ -pe mpi 4
   #$ -l rmem=10G
   module load apps/castep/16.11/intel-15.0.7-openmpi-2.0.1

   ../bin/testcode.py -q  --total-processors=4 --processors=4 -e castep.parallel -c simple -v -v -v

All 416 tests passed.  Results can be found in :download:`castep_16_11_mpi4_sharc_build_tests.log </decommissioned/sharc/software/install_scripts/apps/castep/16.11/intel-15.0.7/castep_16_11_mpi4_sharc_build_tests.log>`.  

Version 18.1, serial build
^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following command was issued in the ``CASTEP-18.1`` build directory during an interactive session with 16 GB of memory (``qrsh -l rmem=16G``):

.. code-block:: bash

   make check

All 455 tests passed.

Version 18.1, parallel build
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following script was submitted via ``qsub`` from the ``Test`` subdirectory of the build directory:

.. code-block:: bash

   #!/bin/bash
   #$ -pe mpi 4
   #$ -l rmem=4G
   #$ -l h_rt=48:00:00

   module load apps/castep/18.1/intel-17.0.0-openmpi-2.0.1

   ../bin/testcode.py -q  --total-processors=4 --processors=4 -e castep.mpi -c simple -v -v -v

All 455 tests passed. 


