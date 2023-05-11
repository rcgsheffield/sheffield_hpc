.. _lammps_stanage:

.. |softwarename| replace:: LAMMPS

|softwarename|
==============

.. sidebar:: |softwarename|

   :Versions:  03Mar2020
   :URL: https://www.lammps.org/
   :Documentation: https://docs.lammps.org/Manual.html
   :Dependencies: EasyBuild toolchains foss and intel (see :ref:`stanage_eb_toolchains`).

|softwarename| is a classical molecular dynamics code with a focus on materials modelling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.

|softwarename| has potentials for solid-state materials (metals, semiconductors) and soft matter (biomolecules, polymers) and coarse-grained or mesoscopic systems. It can be used to model atoms or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

|softwarename| runs on single processors or in parallel using message-passing techniques and a spatial-decomposition of the simulation domain. Many of its models have versions that provide accelerated performance on CPUs, GPUs, and Intel Xeon Phis. The code is designed to be easy to modify or extend with new functionality.

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

You can load a specific version with the following command:

.. code-block:: bash

   module load LAMMPS/3Mar2020-foss-2020a-Python-3.8.2-kokkos
   module load LAMMPS/3Mar2020-intel-2020a-Python-3.8.2-kokkos


Serial (one core) Batch usage
-----------------------------

First we will copy an example to run:

.. code-block:: bash

   cp $EBROOTLAMMPS/examples/indent/in.indent .

Your batch script ``batch.sh`` should contain the following commands:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --job-name=lmp-indent
   #SBATCH --mail-user=a.person@sheffield.ac.uk
   #SBATCH --mail-type=FAIL
   #SBATCH --time=00:01:00
   #SBATCH --mem=1G
   #SBATCH --cpus-per-task=1
   #SBATCH --output=output-%j.log
   #SBATCH --error=error-%j.log

   module load LAMMPS/3Mar2020-intel-2020a-Python-3.8.2-kokkos
   srun --export=ALL lmp -in in.indent

Submit your job to the SLURM scheduler:

.. code-block:: bash

   sbatch batch.sh

The output will be written to the ``output-<JOB_ID>.log`` file when the job finishes. Looking at the head and tail the output should be similar to:

.. code-block:: console
   :emphasize-lines: 1
      
      $ head output-22775.log && tail output-22775.log
      LAMMPS (3 Mar 2020)
      OMP_NUM_THREADS environment is not set. Defaulting to 1 thread. (src/comm.cpp:94)
        using 1 OpenMP thread(s) per MPI task
      Lattice spacing in x,y,z = 1.1327 1.96189 1.1327
      Created orthogonal box = (0 0 -0.283174) to (22.6539 19.6189 0.283174)
        1 by 1 by 1 MPI processor grid
      Created 420 atoms
        create_atoms CPU = 0.000239827 secs
      60 atoms in group lower
      360 atoms in group mobile
      Nghost:    109 ave 109 max 109 min
      Histogram: 1 0 0 0 0 0 0 0 0 0
      Neighs:    3580 ave 3580 max 3580 min
      Histogram: 1 0 0 0 0 0 0 0 0 0

      Total # of neighbors = 3580
      Ave neighs/atom = 8.52381
      Neighbor list builds = 629
      Dangerous builds = 0
      Total wall time: 0:00:01



Parallel (multi core using MPI) Batch usage
-------------------------------------------

Your batch script ``mpi_batch.sh`` should contain the following commands:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --job-name=mpi-lmp-indent
   #SBATCH --mail-user=a.person@sheffield.ac.uk
   #SBATCH --mail-type=FAIL
   #SBATCH --time=00:01:00
   #SBATCH --mem=1G
   #SBATCH --ntasks-per-node=4
   #SBATCH --output=mpi-output-%j.log
   #SBATCH --error=mpi-error-%j.log

   module load LAMMPS/3Mar2020-intel-2020a-Python-3.8.2-kokkos
   export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
   srun --export=ALL lmp -in in.indent

.. note:: 

      We haven't used the ``#SBATCH --nodes=1`` option as we aim to distribute tasks flexibly across the cluster, 
      instead of restricting them to a single node. As it's often easier to find (in this case) 4 free cores scattered across multiple nodes. 
      The decision between consolidating tasks on one node, spreading them across few nodes, or distributing them anywhere,
      relies on model size, scalability, and the trade-off between computation and queue waiting times.

Submit your job to the SLURM scheduler:

.. code-block:: bash

   sbatch mpi_batch.sh

The output will be written to the ``mpi-output-<JOB_ID>.log`` file when the job finishes. Looking at the head and tail the output should be similar to:

.. code-block:: console
   :emphasize-lines: 1
      
      $ head output-mpi-22794.log && tail output-mpi-22794.log
      LAMMPS (3 Mar 2020)
        using 4 OpenMP thread(s) per MPI task
      Lattice spacing in x,y,z = 1.1327 1.96189 1.1327
      Created orthogonal box = (0 0 -0.283174) to (22.6539 19.6189 0.283174)
        1 by 1 by 1 MPI processor grid
      Created 420 atoms
        create_atoms CPU = 0.000365397 secs
      60 atoms in group lower
      360 atoms in group mobile
      Setting atom values ...
      Nghost:    109 ave 109 max 109 min
      Histogram: 1 0 0 0 0 0 0 0 0 0
      Neighs:    3580 ave 3580 max 3580 min
      Histogram: 1 0 0 0 0 0 0 0 0 0

      Total # of neighbors = 3580
      Ave neighs/atom = 8.52381
      Neighbor list builds = 629
      Dangerous builds = 0
      Total wall time: 0:00:01


Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.
Build logs and test reports can be found in ``$EBDEVELLAMMPS`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^

Testing has been conducted with the above examples.
