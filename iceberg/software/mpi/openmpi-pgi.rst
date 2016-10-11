OpenMPI (PGI version)
=====================

.. sidebar:: OpenMPI (PGI version)

   :Latest Version: 1.8.8
   :Support Level: FULL
   :Dependancies: PGI
   :URL: http://www.open-mpi.org/

The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. Open MPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. Open MPI offers advantages for system and software vendors, application developers and computer science researchers.

These versions of OpenMPI make use of the PGI compiler suite.

Module files
------------
The latest version is made available using ::

   module load mpi/pgi/openmpi

Alternatively, you can load a specific version using one of ::

   module load mpi/pgi/openmpi/1.8.8
   module load mpi/pgi/openmpi/1.6.4

Installation notes
------------------
These are primarily for administrators of the system.

**Version 1.8.8**

Compiled using PGI 15.7.

* `install_openMPI.sh  <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/install_scripts/mpi/pgi/openmpi/install_pgi_openMPI_1.8.8.sh>`_ Downloads, compiles and installs OpenMPI 1.8.8 using v15.7 of the PGI Compiler.
* `Modulefile <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/modulefiles/mpi/pgi/openmpi/1.8.8>`_ located on the system at ``/usr/local/modulefiles/mpi/pgi/openmpi/1.8.8``

Installation notes for older versions are not available.
