Code Saturne 4.0
================

.. sidebar:: Code Saturne

   :Version: 4.0
   :URL: http://code-saturne.org/cms/
   :Documentation: http://code-saturne.org/cms/documentation
   :Location: /usr/local/packages6/apps/gcc/4.4.7/code_saturne/4.0

Code_Saturne solves the Navier-Stokes equations for 2D, 2D-axisymmetric and 3D flows, steady or unsteady, laminar or turbulent, incompressible or weakly dilatable, isothermal or not, with scalars transport if required.

Usage
-----
To make code saturne available, run the following module command after starting a ``qsh`` session.

:code:`module load apps/code_saturne/4.0.0`

Troubleshooting
---------------
If you run Code Saturne jobs from ``/fastdata`` they will fail since the underlying filesystem used by ``/fastdata`` does not support posix locks. If you need more space than is available in your home directory, use ``/data`` instead. If you use ``/fastdata`` with Code Saturne you may get an error message similar to the one below ::

  File locking failed in ADIOI_Set_lock(fd 14,cmd F_SETLKW/7,type F_WRLCK/1,whence 0) with return value FFFFFFFF and errno 26.
  - If the file system is NFS, you need to use NFS version 3, ensure that the lockd daemon is running on all the machines, and mount the directory with the 'noac' option (no attribute caching).
  - If the file system is LUSTRE, ensure that the directory is mounted with the 'flock' option.
  ADIOI_Set_lock:: Function not implemented
  ADIOI_Set_lock:offset 0, length 8
  --------------------------------------------------------------------------
  MPI_ABORT was invoked on rank 0 in communicator MPI_COMM_WORLD
  with errorcode 1.
  NOTE: invoking MPI_ABORT causes Open MPI to kill all MPI processes.
  You may or may not see output from other processes, depending on
  exactly when Open MPI kills them.
  --------------------------------------------------------------------------
   solver script exited with status 1.
  Error running the calculation.
  Check Code_Saturne log (listing) and error* files for details.

Installation Notes
------------------
These notes are primarily for system administrators.

Installation notes for the version referenced by module ``module load apps/code_saturne/4.0.0``:

Pre-requisites:
This version of Code Saturne was built with the following:-

* gcc 4.4.7
* :ref:`CGNS` 3.2.1
* :ref:`med` 3.0.8
* OpenMPI 1.8.3
* :ref:`hdf5` 1.8.14 built using gcc

.. code-block:: none

    module load libs/gcc/4.4.7/cgns/3.2.1

    tar -xvzf code_saturne-4.0.0.tar.gz
    mkdir code_saturn_build
    cd code_saturn_build/
    ./../code_saturne-4.0.0/configure --prefix=/usr/local/packages6/apps/gcc/4.4.7/code_saturne/4.0 --with-mpi=/usr/local/mpi/gcc/openmpi/1.8.3/ --with-med=/usr/local/packages6/libs/gcc/4.4.7/med/3.0.8/ --with-cgns=/usr/local/packages6/libs/gcc/4.4.7/cgnslib/3.2.1 --with-hdf5=/usr/local/packages6/hdf5/gcc-4.4.7/openmpi-1.8.3/hdf5-1.8.14/

This gave the following configuration ::

	Configuration options:
	 use debugging code: no
	 MPI (Message Passing Interface) support: yes
	 OpenMP support: no

	The package has been configured. Type:
	 make
	 make install

	To generate and install the PLE package


	Configuration options:
	 use debugging code: no
	 use malloc hooks: no
	 use graphical user interface: yes
	 use long integers: yes
	 Zlib (gzipped file) support: yes
	 MPI (Message Passing Interface) support: yes
	   MPI I/O support: yes
	   MPI2 one-sided communication support: yes
	 OpenMP support: no
	 BLAS (Basic Linear Algebra Subprograms) support: no
	 Libxml2 (XML Reader) support: yes
	 ParMETIS (Parallel Graph Partitioning) support: no
	 METIS (Graph Partitioning) support: no
	 PT-SCOTCH (Parallel Graph Partitioning) support: no
	 SCOTCH (Graph Partitioning) support: no
	 CCM support: no
	 HDF (Hierarchical Data Format) support: yes
	 CGNS (CFD General Notation System) support: yes
	 MED (Model for Exchange of Data) support: yes
	   MED MPI I/O support: yes
	 MEDCoupling support: no
	 Catalyst (ParaView co-processing) support: no
	 EOS support: no
	 freesteam support: no
	 SALOME GUI support: yes
	 SALOME Kernel support: yes
	 Dynamic loader support (for YACS): dlopen

I then did ::

         make
         make install

Post Install Steps
------------------
To make Code Saturne aware of the SGE system:

* Created ``/usr/local/packages6/apps/gcc/4.4.7/code_saturne/4.0/etc/code_saturne.cfg``: See `code_saturne.cfg 4.0 <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/apps/assets/code_saturne/4.0/code_saturne.cfg>`_

* Modified ``/usr/local/packages6/apps/gcc/4.4.7/code_saturne/4.0/share/code_saturne/batch/batch.SGE``. See: `batch.SGE 4.0 <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/apps/assets/code_saturne/4.0/batch.SGE>`_

Testing
-------
This module has not been yet been properly tested and so should be considered experimental.

Several user's jobs up to 8 cores have been submitted and ran to completion.

Module File
-----------
Module File Location: :code:`/usr/local/modulefiles/apps/code_saturne/4.0.0`

.. code-block:: none

  #%Module1.0#####################################################################
  ##
  ## code_saturne 4.0 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
  	global code-saturneversion

  	puts stderr "   Adds `code_saturn-$codesaturneversion' to your PATH environment variable and necessary libraries"
  }

  set     codesaturneversion 4.0.
  module load mpi/gcc/openmpi/1.8.3

  module-whatis   "loads the necessary `code_saturne-$codesaturneversion' library paths"

  set cspath /usr/local/packages6/apps/gcc/4.4.7/code_saturne/4.0
  prepend-path MANPATH $cspath/share/man
  prepend-path PATH $cspath/bin
