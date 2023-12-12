.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

GROMACS
=======

.. sidebar:: GROMACS

   :Version: 2016.4, 2018.1
   :Dependencies: GCC 4.9.4, CUDA 8.0.44 (GPU support), and OpenMPI 2.0.1 (MPI support).
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

.. code-block:: console

    $ module load apps/gromacs/2016.4/gcc-4.9.4
    $ module load apps/gromacs/2018.1/gcc-4.9.4
    $ module load apps/gromacs/2016.4/gcc-4.9.4-cuda-8.0
    $ module load apps/gromacs/2018.1/gcc-4.9.4-cuda-8.0
    $ module load apps/gromacs/2018.1/gcc-4.9.4-openmpi-2.0.1

Where the module files:

* ``apps/gromacs/201*/gcc-4.9.4-cuda-8.0`` is for the installation compiled to run on GPUs.
* ``apps/gromacs/201*/gcc-4.9.4-openmpi-2.0.1`` is for the installation compiled to run using OPENMPI parallelism.


The GROMACS executable is ``gmx`` or ``gmx_mpi`` if using an OpenMPI module. Typing ``gmx help commands`` will display a list of commands for ``gmx`` and their function.

-------

Interactive usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SGE/common-commands/qrshx_start_interactive_session.rst

For interactive usage during testing etc... we recommend using a non-GPU, non-MPI module e.g. ``apps/gromacs/2018.1/gcc-4.9.4``. You can load this and run ``gmx`` commands as follows:

.. code-block:: console

    $ module load apps/gromacs/2018.1/gcc-4.9.4
    $ gmx help commands

-------

Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following are example batch submission scripts, ``my_job.sh``, to run ``gmx`` or ``gmx_mpi`` which are 
submitted to the queue by typing ``qsub my_job.sh``.

.. warning::

    To get optimal parallelisation of GROMACS sub-commands, users should consult the 
    `GROMACS documentation <https://manual.gromacs.org/documentation/>`_
    to determine which of the commands have parallelisation enabled. For example, ``mdrun`` is parallelisable where ``grompp`` and many others are not.

    Please also ensure you consult the right version of the documentation as more modern versions of GROMACS are likely to have numerous differences.

GROMACS can run using 2 different parallel environments, ``smp`` and ``mpi``, in addition to being able to use GPU acceleration. Examples of these 
types of batch submission can be seen below.

Using SMP
^^^^^^^^^

This script requests one CPU core using the OpenMP parallel environment ``smp`` and with 2 GB of real memory per CPU core. The requested runtime is 6 hours.
The GROMACS input line beginning with ``gmx grompp`` is to make a run input file; ``gmx mdrun`` is to perform a simulation, do a normal mode analysis or an energy minimization. 

The ``export`` command sets the correct number of GROMACS threads based on the requested number of cores from the scheduler (important if requesting more than a single core).

.. code-block:: console

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=06:00:00
    #$ -l rmem=2G
    #$ -pe smp 1

    module load apps/gromacs/2016.4/gcc-4.9.4
    export OMP_NUM_THREADS=$NSLOTS
    gmx grompp -f grompp.mdp -c conf.gro -p topol.top -o topol.tpr
    gmx mdrun -s topol.tpr

Using MPI
^^^^^^^^^

This script requests two CPU cores using the MPI parallel environment ``mpi``, with 2 GB of real memory per CPU core. The requested runtime is 6 hours.
The GROMACS input line beginning with ``gmx_mpi grompp`` is to make a run input file; ``mpirun -np $NSLOTS gmx_mpi mdrun`` is to perform a simulation, do a normal mode analysis or an energy minimization 
with the correct number of MPI threads. 

.. note::

    Note ``gmx_mpi`` is used when using OpenMPI functionality.

.. code-block:: console

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=06:00:00
    #$ -l rmem=2G
    #$ -pe mpi 2

    module load apps/gromacs/2018.1/gcc-4.9.4-openmpi-2.0.1

    gmx_mpi grompp -f grompp.mdp -c conf.gro -p topol.top -o topol.tpr
    mpirun -np $NSLOTS gmx_mpi mdrun -s topol.tpr


Using GPUs
^^^^^^^^^^

This script requests one CPU core using the OpenMP parallel environment ``smp``, with 2 GB of real memory per CPU core, and one GPU per one CPU core. The requested runtime is 6 hours.
The GROMACS input line beginning with ``gmx grompp`` is to make a run input file; ``gmx mdrun`` is to perform a simulation, do a normal mode analysis or an energy minimization.

The ``export`` command sets the correct number of GROMACS threads based on the requested number of cores from the scheduler (important if requesting more than a single core).


.. code-block:: console

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=06:00:00
    #$ -l rmem=2G
    #$ -pe smp 1
    #$ -l gpu=1

    module load apps/gromacs/2016.4/gcc-4.9.4-cuda-8.0
    export OMP_NUM_THREADS=$NSLOTS
    gmx grompp -f grompp.mdp -c conf.gro -p topol.top -o topol.tpr
    gmx mdrun -s topol.tpr

-------

Installation notes
------------------

Four GROMACS 2016.4 & 2018.1 installations are available on ShARC; two with and two without GPU support. Both installations use single-node OpenMP parallelism, are single-precision 
builds and use the GROMACS installation of the FFTW3 library. One installation supports OPENMPI parallelism (note: request -pe mpi no_of_cores in your batch script rather than -pe smp no_of_cores).

GROMACS 2016.4 without GPU support was installed using the
:download:`install_gromacs.sh </decommissioned/sharc/software/install_scripts/apps/gromacs/2016.4/gcc-4.9.4/install_gromacs.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/gromacs/2016.4/gcc-4.9.4 </decommissioned/sharc/software/modulefiles/apps/gromacs/2016.4/gcc-4.9.4>`.

GROMACS 2018.1 without GPU support was installed using the
:download:`install_gromacs.sh </decommissioned/sharc/software/install_scripts/apps/gromacs/2018.1/gcc-4.9.4/install_gromacs.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/gromacs/2018.1/gcc-4.9.4 </decommissioned/sharc/software/modulefiles/apps/gromacs/2018.1/gcc-4.9.4>`.

GROMACS 2016.4 with GPU support was installed using the
:download:`install_gromacs_gpu.sh </decommissioned/sharc/software/install_scripts/apps/gromacs/2016.4/gcc-4.9.4-cuda-8.0/install_gromacs_gpu.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/gromacs/2016.4/gcc-4.9.4-cuda-8.0 </decommissioned/sharc/software/modulefiles/apps/gromacs/2016.4/gcc-4.9.4-cuda-8.0>`.

GROMACS 2018.1 with GPU support was installed using the
:download:`install_gromacs_gpu.sh </decommissioned/sharc/software/install_scripts/apps/gromacs/2018.1/gcc-4.9.4-cuda-8.0/install_gromacs_gpu.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/gromacs/2018.1/gcc-4.9.4-cuda-8.0 </decommissioned/sharc/software/modulefiles/apps/gromacs/2018.1/gcc-4.9.4-cuda-8.0>`.

GROMACS 2018.1 with OPENMPI support was installed using the
:download:`install_gromacs_mpi.sh </decommissioned/sharc/software/install_scripts/apps/gromacs/2018.1/gcc-4.9.4-openmpi-2.0.1/install_gromacs_mpi.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/gromacs/2018.1/gcc-4.9.4-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/apps/gromacs/2018.1/gcc-4.9.4-openmpi-2.0.1>`.
The GROMACS 2016.4 & 2018.1 installations were tested by using ``make check`` to run regression tests as part of the installation process.

