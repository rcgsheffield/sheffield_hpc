.. _openmpi_bessemer:

OpenMPI
=======

.. sidebar:: OpenMPI

   :Latest Version: 4.0.5
   :Dependencies: gcc
   :URL: https://www.open-mpi.org/

The OpenMPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. OpenMPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. OpenMPI offers advantages for system and software vendors, application developers and computer science researchers.

Versions
--------

You can load a specific version using one of the following: ::

   module load OpenMPI/3.1.1-GCC-7.3.0-2.30     # part of the foss-2018b toolchain
   module load OpenMPI/3.1.3-GCC-8.2.0-2.31.1   # part of the foss-2019a toolchain
   module load OpenMPI/3.1.3-gcccuda-2019a      # part of the fosscuda-2019a toolchain
   module load OpenMPI/3.1.4-GCC-8.3.0          # part of the foss-2019b toolchain
   module load OpenMPI/3.1.4-gcccuda-2019b      # part of the fosscuda-2019b toolchain
   module load OpenMPI/4.0.3-GCC-9.3.0          # part of the foss-2020a toolchain
   module load OpenMPI/4.0.5-GCC-10.2.0         # part of the foss-2020b toolchain 

See `here <https://www.open-mpi.org/software/ompi/major-changes.php>`__ for a brief guide to the new features in OpenMPI 4.x and `here <https://raw.githubusercontent.com/open-mpi/ompi/v4.0.x/NEWS>`__ for a detailed view of the changes between OpenMPI versions.

Example
-------


Consider the following source code (hello.c):

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

Compile your source code by using the following command: ::

    mpicc hello.c -o hello

Non-interactive job submission
##############################

Write a shell script (minimal example) We name the script as ‘test.sh’: ::


    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4

    module load OpenMPI/3.1.3-GCC-8.2.0-2.31.1

    srun --export=ALL hello

Maximum 40 cores can be requested.

Submit your script by using the command: ::

    sbatch test.sh

Your output would be something like: ::

    Hello world from processor bessemer-node003.shef.ac.uk, rank 4 out of 4 processors
    Hello world from processor bessemer-node003.shef.ac.uk, rank 3 out of 4 processors
    Hello world from processor bessemer-node003.shef.ac.uk, rank 1 out of 4 processors
    Hello world from processor bessemer-node003.shef.ac.uk, rank 2 out of 4 processors



