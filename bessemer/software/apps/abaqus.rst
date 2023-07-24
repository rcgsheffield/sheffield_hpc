Abaqus
======

.. sidebar:: Abaqus

   :Versions: 6.14.2 (see Addendum section), 2018, 2021
   :Dependencies: User subroutines need the Intel FORTRAN compiler 2019 (auto loaded via Abaqus modules).
   :URL: http://www.3ds.com/products-services/simulia/products/abaqus/
   :Documentation: https://help.3ds.com/ (note: register for an account to access.)

Abaqus is a software suite for Finite Element Analysis (FEA) developed by Dassault Systèmes.

Interactive usage
-----------------

After connecting to Bessemer (see :ref:`ssh`),  start an `interactive graphical session <https://docs.hpc.shef.ac.uk/en/latest/hpc/scheduler/submit.html#interactive-sessions>`_.

Abaqus can be activated using one of the following module files::

    module load ABAQUS/6.14.2/binary
    module load ABAQUS/2018
    module load ABAQUS/2021/binary

and launched using::

    abaqus cae -mesa


.. note::

  Users must unset the SLURM environment variable SLURM_GTIDS. Failure to do so will cause Abaqus to get stuck due to the MPI that Abaqus ships with not supporting the SLURM scheduler. SLURM_GTIDS should be unset for both interactive/GUI and batch jobs:

  ``unset SLURM_GTIDS``

  When using a general compute node for Abaqus 2018 or 2021 on Bessemer, please run ``abaqus cae -mesa`` (or ``abq2018 cae -mesa``) to launch the GUI without support for hardware-accelerated graphics rendering. The option ``-mesa`` disables hardware-accelerated graphics rendering within Abaqus's GUI.

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

    abaqus fetch job=umatst3*

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
    module load ifort/2019.1.144-GCC-8.2.0-2.31.1
    unset SLURM_GTIDS
    abaqus job=my_job input=umatmst3.inp user=umatmst3.f scratch=$TMPDIR memory="8gb" interactive

Note that the module ``ifort/2019.1.144-GCC-8.2.0-2.31.1``, required for compiling the user subroutines, may not be automatically loaded when the module for Abaqus is loaded.

------------

Licensed options
----------------

All available Abaqus licenses can be viewed using ``abaqus licensing r`` e.g. ::

   $ module load ABAQUS/2018
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

------------

Installation notes
------------------

Addendum: Abaqus 2021 (non-EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Abaqus 6.14.2 was installed using the standard Abaqus interactive GUI installer (StartGUI.sh).

The module file is
:download:`/usr/local/modulefiles/live/noeb/ABAQUS/2021/binary </bessemer/software/modulefiles/ABAQUS/2021/binary>`.

Addendum: Abaqus 6.14.2 (non-EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Abaqus 6.14.2 was installed using the standard Abaqus installer due to issues using EasyBuild.

It can be activated using the following module commands::

    module load ABAQUS/6.14.2/binary

and launched using::

    abaqus cae

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
    module use /usr/local/modulefiles/live/apps
    module load ABAQUS/6.14.2/binary
    unset SLURM_GTIDS
    abaqus job=my_job input=s4d.inp mp_mode=threads cpus=$SLURM_NTASKS scratch=$TMPDIR memory="8gb" interactive
