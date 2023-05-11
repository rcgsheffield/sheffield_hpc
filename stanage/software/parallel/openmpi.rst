.. _openmpi_stanage:

OpenMPI
=======

.. sidebar:: OpenMPI

   :Latest Version: 4.1.4
   :Dependencies: gcc
   :URL: https://www.open-mpi.org/

The OpenMPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. OpenMPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. OpenMPI offers advantages for system and software vendors, application developers and computer science researchers.

Versions
--------

You can load a specific version using one of the following: ::

    module load OpenMPI/3.1.4-GCC-8.3.0   # part of the foss-2019b toolchain
    module load OpenMPI/4.0.3-GCC-9.3.0   # part of the foss-2020a toolchain
    module load OpenMPI/4.0.5-GCC-9.3.0   # part of the foss-2020a toolchain
    module load OpenMPI/4.0.5-GCC-10.2.0  # part of the foss-2020b toolchain
    module load OpenMPI/4.1.4-GCC-11.3.0  # part of the foss-2022a toolchain
    module load OpenMPI/4.1.4-GCC-12.2.0  # part of the foss-2022b toolchain

.. warning:: 

    The current installation of OpenMPI 4.1.1 has poor performance over Omnipath which is still under investigation.


See `here <https://www.open-mpi.org/software/ompi/major-changes.php>`__ for a brief guide to the new features in OpenMPI 4.x and `here <https://docs.open-mpi.org/en/v5.0.x/news/news-v4.1.x.html>`__ for a detailed view of the changes between OpenMPI versions.

Example
-------


Consider the following source code ``hello.c``:

.. code-block:: c

    #include <mpi.h>
    #include <stdio.h>

    int main(int argc, char** argv) {
        // Initialize the MPI environment
        MPI_Init(NULL, NULL);

        // Get the number of processes
        int world_size;
        MPI_Comm_size(MPI_COMM_WORLD, &world_size);

        // Get the rank of the process
        int world_rank;
        MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

        // Get the name of the processor
        char processor_name[MPI_MAX_PROCESSOR_NAME];
        int name_len;
        MPI_Get_processor_name(processor_name, &name_len);

        // Print off a hello world message
        printf("Hello world from processor %s, rank %d out of %d processors\n",
               processor_name, world_rank, world_size);

        // Finalize the MPI environment.
        MPI_Finalize();
    }

MPI_COMM_WORLD (which is constructed for us by MPI) encloses all of the processes in the job, so this call should return the amount of processes that were requested for the job.

Compile your source code by using on of the following commands: ::

    mpicc hello.c -o hello

.. note:: 

        In this example we used the MPI C compiler. We could also choose to compile with either of the MPI C++ compilers ``mpicxx`` or ``mpiCC``


Interactive job submission
##########################


You can run your job interactively (from a login node): ::

    srun hello

Your output would be something like: ::

    Hello world from processor node003.pri.stanage.alces.network, rank 0 out of 1 processors


This is an expected behaviour since by default interactive jobs get allocated one single-CPU-core task running on one node.
You can request an interactive job with multiple concurrent single-CPU-core tasks (4 in this example) by using this command (from a login node): ::

    srun --ntasks=4 hello

Your output would be something like: ::

    Hello world from processor node003.pri.stanage.alces.network, rank 3 out of 4 processors
    Hello world from processor node003.pri.stanage.alces.network, rank 1 out of 4 processors
    Hello world from processor node003.pri.stanage.alces.network, rank 0 out of 4 processors
    Hello world from processor node003.pri.stanage.alces.network, rank 2 out of 4 processors


Please note that requesting multiple cores in an interactive node depends on the availability. During peak times, it is unlikely that you can successfully request a large number of CPU cores interactively.  Therefore, it is usually sensible to run MPI workloads as batch jobs. 

   
.. _batch_openmpi_stanage: 

Non-interactive job submission
##############################

Write a shell script (minimal example). We name the script as ``test.sh``: ::


    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=8

    module load OpenMPI/4.1.4-GCC-12.2.0

    srun --export=ALL hello


Submit your script by using the command: ::

    sbatch test.sh

Your output would be something like: ::

    Hello world from processor node003.pri.stanage.alces.network, rank 6 out of 8 processors
    Hello world from processor node003.pri.stanage.alces.network, rank 5 out of 8 processors
    ...
    Hello world from processor node003.pri.stanage.alces.network, rank 1 out of 8 processors
    Hello world from processor node003.pri.stanage.alces.network, rank 4 out of 8 processors

Installation notes
------------------

This section is primarily for administrators of the system. OpenMPI has been installed using the default Easybuild config files but with the following tweaks made via EasyBuild hooks:

* Compile-time options set so that:
   * All versions compiled with Slurm and PMIx support enabled.
   * Versions older than 4.1.0 are compiled with support for the PSM2 library for 
     efficient inter-process communication inc via Omni-Path 
     (but OpenMPI only actually uses PSM2 at runtime for versions <= 4.0.0).

* Module files are patched so that at runtime:
   * When OpenMPI is loaded, 
     it instructs Slurm at runtime 
     (via an environment variable - ``SLURM_MPI_TYPE=pmix_v4``) that 
     PMIx version 4 is to be used for launching remote processes using ``srun``.
   * Versions greater than 4.0.0 are configured at runtime to use 
     LibFabric (OFI) for inter-process communications, which in turn is 
     configured at runtime via environment variables to use the PSM2 OFI provider 
     for efficient OmniPath support.  
     
     OFI is used instead of PSM2 as 
     the older PSM2 library on CentOS 7 is incompatible with newer versions of OpenMPI, 
     plus OFI is now the preferred way of doing comms over Omni-Path fabrics with MPI implementations.

     Key variables set in OpenMPI module files:
      * ``OMPI_MCA_pml=cm``
      * ``OMPI_MCA_mtl=ofi``
      * ``OMPI_MCA_mtl_ofi_provider_include=psm2``
      * ``PMIX_MCA_psec=native``

Build logs and test reports can be found in ``$EBROOTOPENMPI/easybuild`` with a given module loaded.



