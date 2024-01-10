.. _impi_bessemer:

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
    
   module load impi/2019.9.304-iccifort-2020.4.304  # subset of intel 2020b EasyBuild toolchain
   module load impi/2019.7.217-iccifort-2020.1.217  # subset of intel 2020a EasyBuild toolchain
   module load impi/2018.5.288-iccifort-2019.5.281  # subset of intel 2019b EasyBuild toolchain
   module load impi/2018.4.274-iccifort-2019.1.144-GCC-8.2.0-2.31.1  # subset of intel 2019a EasyBuild toolchain
   module load impi/2018.3.222-iccifort-2018.3.222-GCC-7.3.0-2.30 # subset of intel 2018b EasyBuild toolchain

which implicitly load versions of icc, ifort (and GCC).

.. warning::

    Multi-node jobs are (for the most part) not permitted by Slurm on Bessemer; the system has been configured this way as Bessemer,
    unlike Stanage, doesn't have a very high-bandwidth, low-latency network connecting all worker nodes.


Examples
--------

Two examples are given below, the first assessing the MPI performance and the second demonstrating the use 
of the Intel MPI compilers.

Example: MPI Performance testing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A simple test of these modules can be performed by running the built in performance benchmark tests 
supplied by Intel. An example of this using 2 cores is given below: 

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2

    module load impi/2018.5.288-iccifort-2019.5.281

    MACHINEFILE="machinefile.$JOB_ID"

    # Show which nodes you have been allocated CPU cores on
    echo -e "\nShow node core allocation:\n"

    NODELIST=nodelist.$SLURM_JOB_ID
    srun -l bash -c 'hostname' | sort | awk '{print $2}' > $NODELIST
    cat $NODELIST


    echo -e "\nBegin running application:\n"
    srun --export=ALL IMB-MPI1

This will generate output of the form:

.. code-block:: bash

    Show node core allocation:

    bessemer-node006.shef.ac.uk
    bessemer-node006.shef.ac.uk

    Begin running application:

    #------------------------------------------------------------
    #    Intel (R) MPI Benchmarks 2018, MPI-1 part
    #------------------------------------------------------------
    # Date                  : Mon Sep 27 09:48:58 2021
    # Machine               : x86_64
    # System                : Linux
    # Release               : 3.10.0-1160.36.2.el7.x86_64
    # Version               : #1 SMP Wed Jul 21 11:57:15 UTC 2021
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

    module load impi/2018.5.288-iccifort-2019.5.281

    # Show which nodes you have been allocated CPU cores on
    echo -e "\nShow node core allocation:\n"

    NODELIST=nodelist.$SLURM_JOB_ID
    srun -l bash -c 'hostname' | sort | awk '{print $2}' > $NODELIST
    cat $NODELIST

    cd /fastdata/$USER
    cp -R $I_MPI_ROOT/test ./ && chmod 700 -R test && cd test/
    # Compiling the fortran example
    mpif90 test.f90
    # Alternatively you can compile the C example instead
    #mpicc test.c

    echo -e "\nBegin running application:\n"
    srun --export=ALL /fastdata/$USER/test/a.out

This will generate output of the form:

.. code-block:: bash

    Show node core allocation:

    bessemer-node006.shef.ac.uk
    bessemer-node006.shef.ac.uk

    Begin running application:

    Hello world: rank            0  of            2  running on bessemer-node006.shef.ac.uk                                                   $
    Hello world: rank            1  of            2  running on bessemer-node006.shef.ac.uk
