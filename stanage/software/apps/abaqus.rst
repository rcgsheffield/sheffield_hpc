Abaqus
======

.. sidebar:: Abaqus

   :Versions: 2021
   :Dependencies: User subroutines need the Intel FORTRAN compiler 2019
   :URL: http://www.3ds.com/products-services/simulia/products/abaqus/
   :Documentation: https://help.3ds.com/ (note: register for an account to access.)

Abaqus is a software suite for Finite Element Analysis (FEA) developed by Dassault Systèmes.

Interactive usage
-----------------

Abaqus can be activated using one of the following module files::

    module load ABAQUS/2021

and launched using::

    abaqus cae


.. note::

  Users must unset the SLURM environment variable SLURM_GTIDS. Failure to do so will cause Abaqus to get stuck due to the MPI that Abaqus ships with not supporting the SLURM scheduler. SLURM_GTIDS should be unset for both interactive/GUI and batch jobs:

  ``unset SLURM_GTIDS``

------------

Abaqus example problems
-----------------------

Abaqus contains a large number of example problems which can be used to become familiar with Abaqus on the system.
These example problems are described in the Abaqus documentation and can be obtained using the Abaqus ``fetch`` command.
For example, after loading the Abaqus module enter the following at the command line to extract the input file for test problem s4d::

    abaqus fetch job=s4d

This will extract the input file ``s4d.inp`` to run the computation defined by the commands and batch submission script below.

------------

Batch jobs
----------

The following is an example batch submission script, ``my_job.sh``, to run the executable ``abaqus`` with input file is ``s4d.inp``. The script requests 4 cores using the OpenMP parallel environment ``smp`` with a runtime of 30 mins and 2 GB of real memory per core. ::

    #!/bin/bash
    #SBATCH --job-name=abaqus_smp_test
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=8000
    #SBATCH --output=output_abaqus_smp_4
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ABAQUS/2018
    unset SLURM_GTIDS
    abaqus job=my_job input=s4d.inp mp_mode=threads cpus=$SLURM_NTASKS scratch=$TMPDIR memory="8gb" interactive

The job is submitted to the queue by typing::

    sbatch my_job.sh

**User subroutines:** The ``umatmst3`` model has a user defined subroutine ``umatmst3.f``. The model files are obtained using ::

    abaqus fetch job=umatmst3*

The script below is an example of a batch submission script for a single core job with a runtime of 30 mins, 8 GB of real memory and with user subroutine ``umatmst3.f`` and input file ``umatmst3.inp``. ::

    #!/bin/bash
    #SBATCH --job-name=abaqus_subroutine_test
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --mem=8000
    #SBATCH --output=output_abaqus_subroutine
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ABAQUS/2018
    module load iccifort/2019.5.281
    unset SLURM_GTIDS
    abaqus job=my_job input=umatmst3.inp user=umatmst3.f scratch=$TMPDIR memory="8gb" interactive

Note that the module ``iccifort/2019.5.281``, required for compiling the user subroutines, is not automatically loaded when the module for Abaqus is loaded.

------------

Licensed options
----------------

All available Abaqus licenses can be viewed using ``abaqus licensing r`` e.g. ::

   $ module load ABAQUS/2021
   $ abaqus licensing r

Run ``abaqus licensing`` for usage info for the Abaqus licensing sub-command. Run ``abaqus licensing ru`` to see current licence usage.

------------

Checkpointing your work
-----------------------

Abaqus has a built-in checkpoint and restart feature.

Add the following to the input file (refer to official Abaqus documentation for detail): ::

   *RESTART, WRITE, OVERLAY, FREQUENCY=10

**OVERLAY** saves only one state, i.e. overwrites the restart file every time new restart information is written

**FREQUENCY=N** writes restart information every N timesteps

And, to restart the job, create a new input file newJobName with only a single line:  ::

   *RESTART, READ

Then run Abaqus specifying both the new and old job names:  ::

   abaqus jobname=newJobName oldjob=oldJobName

------------------

Installation notes
------------------

Abaqus 2021 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Abaqus was installed using Easybuild 4.7.0, build details can be found in folder $EBROOTABAQUS/easybuild with the module loaded.
