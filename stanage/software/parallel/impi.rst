.. _impi_stanage:

Intel MPI
=========

.. sidebar:: Intel MPI

   :URL: https://software.intel.com/en-us/mpi-library

"Intel MPI Library is a multifabric message-passing library
that implements the open-source MPICH specification.
Use the library to create, maintain, and test advanced, complex applications that
perform better on HPC clusters based on Intel® processors."

Versions
--------

You can load a specific version using one of the following: ::

    module load impi/2019.7.217-iccifort-2020.1.217     # subset of the intel 2020a toolchain
    module load impi/2019.9.304-iccifort-2020.4.304     # subset of the intel 2020b toolchain
    module load impi/2021.2.0-intel-compilers-2021.2.0  # subset of the intel 2021a toolchain
    module load impi/2021.4.0-intel-compilers-2021.4.0  # subset of the intel 2021b toolchain
    module load impi/2021.6.0-intel-compilers-2022.1.0  # subset of the intel 2022a toolchain
    module load impi/2021.7.1-intel-compilers-2022.2.1  # subset of the intel 2022b toolchain


which implicitly load versions of icc, ifort (and GCC).


Examples
--------

Two examples are given below, the first assessing the MPI performance and the second demonstrating the use
of the Intel MPI compilers.

Example: MPI Performance testing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A simple test of these modules can be performed by running the built in performance benchmark tests
supplied by Intel. An example of this using 2 cores on one node is given below:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2

    module load impi/2021.7.1-intel-compilers-2022.2.1

    MACHINEFILE="machinefile.$JOB_ID"

    # Show which node you have been allocated CPU cores on
    echo -e "\nShow node core allocation:\n"

    echo "SLURM_JOB_NODELIST=${SLURM_JOB_NODELIST}"
    echo "SLURM_NNODES=${SLURM_NNODES}"
    echo "SLURM_NTASKS_PER_NODE=${SLURM_NTASKS_PER_NODE-1}"
    echo "SLURM_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK-1}"

    echo -e "\nBegin running application:\n"
    srun --export=ALL IMB-MPI1

This will generate output of the form:

.. code-block:: bash

    Show node core allocation:

    SLURM_JOB_NODELIST=node050
    SLURM_NNODES=1
    SLURM_NTASKS_PER_NODE=2
    SLURM_CPUS_PER_TASK=1


    Begin running application:

    #----------------------------------------------------------------
    #    Intel(R) MPI Benchmarks 2021.4, MPI-1 part
    #----------------------------------------------------------------
    # Date                  : Thu Mar 16 16:00:38 2023
    # Machine               : x86_64
    # System                : Linux
    # Release               : 3.10.0-1160.59.1.el7.x86_64
    # Version               : #1 SMP Wed Feb 23 16:47:03 UTC 2022
    # MPI Version           : 3.1
    # MPI Thread Environment:


This is followed by a series of test benchmark results for each of the many tests.


Example: Using the Intel MPI compilers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Another simple test of these modules can be performed by compiling and running the example executable
provided by Intel. An example of this using 2 cores is given below:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2

    module load impi/2021.7.1-intel-compilers-2022.2.1

    # Show which nodes you have been allocated CPU cores on
    echo -e "\nShow node core allocation:\n"

    echo "SLURM_JOB_NODELIST=${SLURM_JOB_NODELIST}"
    echo "SLURM_NNODES=${SLURM_NNODES}"
    echo "SLURM_NTASKS_PER_NODE=${SLURM_NTASKS_PER_NODE-1}"
    echo "SLURM_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK-1}"

    cd /mnt/parscratch/users/$USER
    cp -R $I_MPI_ROOT/test ./ && chmod 700 -R test && cd test/
    # Compiling the C example
    mpicc test.c
    # Alternatively you can compile the fortran example instead
    #mpif90 test.f90

    echo -e "\nBegin running application:\n"
    srun --export=ALL /mnt/parscratch/users/$USER/test/a.out

This will generate output of the form:

.. code-block:: bash

    Show node core allocation:

    SLURM_JOB_NODELIST=node051
    SLURM_NNODES=1
    SLURM_NTASKS_PER_NODE=2
    SLURM_CPUS_PER_TASK=1

    Begin running application:

    Hello world: rank 0 of 2 running on node051.pri.stanage.alces.network
    Hello world: rank 1 of 2 running on node051.pri.stanage.alces.network

Installation notes
------------------

This section is primarily for administrators of the system. Intel MPI has been installed using the default Easybuild config files but with the following tweaks made via EasyBuild hooks:

* Module files are patched so that
    * they instruct Slurm at runtime (via ``SLURM_MPI_TYPE=pmi2``) that the PMI2 API is to be used for launching remote processes using ``srun``,
      as Intel MPI currently works better with PMI2 than the newer PMIx APIs.
    * for versions greater than 19.0.0 ``I_MPI_PMI_LIBRARY`` is set to the absolute path to ``libpmi2.so`` (required by ``srun``).
* The ``mpirun`` executable is patched so that ``I_MPI_PMI_LIBRARY`` is explicitly *unset* at execution time, as ``I_MPI_PMI_LIBRARY`` can only be used with ``srun``.
