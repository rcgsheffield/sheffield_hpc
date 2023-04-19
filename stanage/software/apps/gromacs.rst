GROMACS
=======

.. sidebar:: GROMACS

   :Version: 2021, 2019.3 
   :Dependencies: GCC 10.2 and OpenMPI 4.0.5 (MPI support).
   :URL: http://www.gromacs.org/
   :Documentation: http://manual.gromacs.org/documentation/
   :Tutorials: http://www.gromacs.org/Documentation/Tutorials


GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.
It is primarily designed for biochemical molecules like proteins, lipids and nucleic acids that have a lot of complicated bonded interactions, but since GROMACS 
is extremely fast at calculating the nonbonded interactions (that usually dominate simulations) many groups are also using it for research on non-biological systems, e.g. polymers.

-------

Usage
-----

GROMACS software can be loaded using one of the following module load commands:

.. code-block:: 

    $ module load GROMACS/2021-foss-2020b
    $ module load GROMACS/2019.3-foss-2019b


The GROMACS executable is ``gmx`` or ``gmx_mpi`` if using an OpenMPI module. Typing ``gmx help commands`` will display a list of commands for ``gmx`` and their function.

--------------------

Interactive usage
-----------------

For interactive usage during testing etc... we recommend using a non-GPU, non-MPI module e.g. ``GROMACS/2021-foss-2020b``. You can load this and run ``gmx`` commands as follows:

.. code-block:: console

    $ module load GROMACS/2021-foss-2020b
    $ gmx help commands

-------

Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following are example batch submission scripts, ``my_job.sh``, to run ``gmx`` or ``gmx_mpi`` which are 
submitted to the queue by typing ``sbatch my_job.sh``.

.. warning::

    To get optimal parallelisation of GROMACS sub-commands, users should consult the 
    `GROMACS documentation <https://manual.gromacs.org/documentation/>`_
    to determine which of the commands have parallelisation enabled. For example, ``mdrun`` is parallelisable where ``grompp`` and many others are not.

    Please also ensure you consult the right version of the documentation as more modern versions of GROMACS are likely to have numerous differences.

GROMACS can run using in ``smp`` parallel environment, in addition to being able to use GPU acceleration. Examples of these 
types of batch submission can be seen below.

Using GMX
^^^^^^^^^

The following is an example batch submission script, my_job.sh, to run the gromacs executable ``gmx`` with input files grompp.mdp, conf.gro and topol.top. The script requests 5 GB of real memory.

The GROMACS input line beginning with ``gmx grompp`` is to make a run input file; ``gmx mdrun`` is to perform a simulation, do a normal mode analysis or an energy minimization. 

The ``export`` command sets the correct number of GROMACS threads based on the requested number of cores from the scheduler (important if requesting more than a single core).

.. code-block:: console

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #SBATCH --mem=5G
    #SBATCH --time=00:30:00
    # Email notifications to me@somedomain.com
    #SBATCH --mail-user=me@somedomain.com
    # Email notifications if the job fails
    #SBATCH --mail-type=FAIL

    module load GROMACS/2021-foss-2020b
    
    # Set the OPENMP_NUM_THREADS environment variable to the number of available cores.
    # The line ensures that OpenMP uses all of the CPUs allocated to the task 
    # for parallel processing. This can improve the performance of parallelised 
    # code by fully utilising the available resources.
    export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

    gmx grompp -f grompp.mdp -c conf.gro -p topol.top -o topol.tpr
    gmx mdrun -s topol.tpr

Using GMX_MPI
^^^^^^^^^^^^^

This script requests four CPU cores and a runtime of 30 minutes.
The GROMACS input line beginning with ``gmx_mpi grompp`` is to make a run input file; ``srun -np $NSLOTS gmx_mpi mdrun`` is to perform a simulation, to do a normal mode analysis or an energy minimization 
with the correct number of MPI threads. 

.. note::

    Note ``gmx_mpi`` is used when using OpenMPI functionality and should not be used on interactive sessions.

.. code-block:: console   

    #!/bin/bash
    #SBATCH --mem=5G
    #SBATCH --time=00:30:00
    #SBATCH --cpus-per-task=4
    # Email notifications to me@somedomain.com
    #SBATCH --mail-user=me@somedomain.com
    # Email notifications if the job fails
    #SBATCH --mail-type=FAIL
    
    module load GROMACS/2021-foss-2020b

    gmx_mpi grompp -f grompp.mdp -c conf.gro -p topol.top -o topol.tpr
    srun -np $SLURM_NTASKS gmx_mpi mdrun -s topol.tpr


Using GPUs
^^^^^^^^^^

Currently none of the gromacs installations have the CUDA modules. If you need access to them please contact ``research-it@sheffield.ac.uk`` 

-------

Installation notes
------------------

GROMACS was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTGROMACS/easybuild`` with the module loaded.
GROMACS should just be installed using a batch session otherwise the installation will crash when it comes to build ``gmx_mpi``.

Testing was done using the example on `Lysozyme in Water <http://www.mdtutorials.com/gmx/lysozyme/index.html>`_
