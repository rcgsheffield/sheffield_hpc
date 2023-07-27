.. _DL_POLY_4_bessemer:
.. |softwarename| replace:: DL_POLY_4
.. |currentver| replace:: 5.0.0
.. |ebtoolchain| replace:: intel-2020b

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: https://www.scd.stfc.ac.uk/Pages/DL_POLY.aspx

|softwarename| is a general purpose classical molecular dynamics (MD) simulation software developed at 
Daresbury Laboratory by I.T. Todorov, W. Smith, A.M. Elena and others.

========

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load DL_POLY_4_PLUMED_INTEG/5.0.0-intel-2020b

After this the |softwarename| command can be run from the terminal prompt 

========

Batch Usage
-----------

Users are encouraged to write their own batch submission scripts. The following is an example batch 
submission script, ``my_job.sh``, to run ``DLPOLY.Z`` and which is submitted to the queue by typing ``sbatch my_job.sh``. 

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=DL_POLY_4_test
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=8
    #SBATCH --mem=2000
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    module load DL_POLY_4_PLUMED_INTEG/5.0.0-intel-2020b
    # Get Example 2 from the DL_POLY website.
    # ftp://ftp.dl.ac.uk/ccp5/DL_POLY/DL_POLY_4.0/TUTORIAL/Tutorial_Notes.pdf
    wget ftp://ftp.dl.ac.uk/ccp5/DL_POLY/DL_POLY_4.0/TUTORIAL/Exercise2.tar.gz
    tar -xvf Exercise2.tar.gz
    cd Exercise2
    mpirun -np $SLURM_NTASKS DLPOLY.Z


========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^


|softwarename| version 5.0.0 was installed using Easybuild 4.4.0 and was optionally interfaced 
with the PLUMED 2.6.2 library. build details can be found in 
``/usr/local/packages/live/eb/DL_POLY_4_PLUMED_INTEG/5.0.0-intel-2020b/easybuild``

Installation was tested as with the above batch script with example 2 directly taken from 
ftp://ftp.dl.ac.uk/ccp5/DL_POLY/DL_POLY_4.0/TUTORIAL/) with the following decomposeParDict:
https://openfoamwiki.net/index.php/DecomposePar
