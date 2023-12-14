.. |softwarename| replace:: CASTEP
.. |currentver| replace:: 23.1

.. _castep_stanage: 

CASTEP
======

.. sidebar::  |softwarename|

   :Versions: |currentver|
   :Dependencies: Intel compilers, Intel MKL libraries and Open MPI
   :URL: http://www.castep.org/
   :Documentation: http://www.castep.org/CASTEP/Documentation

CASTEP is a leading code for calculating the properties of materials from first principles. Using density functional theory, it can simulate a wide range of properties of materials proprieties including energetics, structure at the atomic level, vibrational properties, electronic response properties etc. In particular it has a wide range of spectroscopic features that link directly to experiment, such as infra-red and Raman spectroscopies, NMR, and core level spectra.

Licensing
---------
Castep is free for academic use.

Interactive Usage
-----------------
After connecting to Stanage,  start an interactive session with the ``srun --pty bash –i`` command.

Castep can be made available by running:

.. code-block:: bash

   module load CASTEP/23.1-intel-2022a

Castep has multiple executables that carry out various calculations and procedures. To list them all you will need to list its been directory. In the case of version 23.1 this can be by typing  

.. code-block:: bash

   ls /opt/apps/testapps/el7/software/staging/CASTEP/23.1-intel-2022a/bin

Please note majority of the exucatables require ``srun`` to run, so can only be run as a batch job. This is demonstrated in the next section.    

Batch Submission - Parallel
---------------------------
The parallel version of CASTEP is called ``castep.mpi``. Below is an example of a parallel ``castep.mpi batch`` job. It follows the example documented on the `officcial castep tutorial <https://castep.org/Tutorials/BandStructureAndDOS>`_ .

.. code-block:: bash

    #!/bin/bash
    #SBATCH --mem=5G
    #SBATCH --time=00:30:00
    #SBATCH --cpus-per-task=4
    #Email notifications to me@somedomain.com
    #SBATCH --mail-user=me@somedomain.com
    #Email notifications if the job fails
    #SBATCH --mail-type=FAIL
    #SBATCH --job-name=matlab_par_test
    
    module load CASTEP/23.1-intel-2022a
    
    srun --export=ALL castep.mpi graphite
    srun --export=ALL orbitals2bands graphite

Installation Notes
------------------
These are primarily for system administrators.

Version 23.1
^^^^^^^^^^^^^
The non-GPU installation was done using the custom easyconfig ``CASTEP-23.1-intel.eb``. This will also be submitted to the official easybuild config github.


Testing
-------

Version 23.1
^^^^^^^^^^^^^
The none GPU installation was tested using the example batch scripts and the instructions listed on `officcial castep tutorial <https://castep.org/Tutorials/BandStructureAndDOS>`_ .