.. _cgns:

cgns
====

.. sidebar:: cgns

   :Version: 3.2.1
   :Support Level: Bronze
   :Dependancies: libs/hdf5/gcc/openmpi/1.8.14
   :URL: http://cgns.github.io/WhatIsCGNS.html
   :Location: /usr/local/packages6/libs/gcc/4.4.7/cgnslib

The CFD General Notation System (CGNS) provides a general, portable, and extensible standard for the storage and retrieval of computational fluid dynamics (CFD) analysis data.

Usage
-----
To make this library available, run the following module command

.. code-block:: none

        module load libs/gcc/4.4.7/cgns/3.2.1

This will also load the module files for the prerequisite libraries, Open MPI 1.8.3 and HDF5 1.8.14 with parallel support.

Installing
----------
This section is primarily for administrators of the system.

* This is a prerequisite for Code Saturne version 4.0.
* It was built with gcc 4.4.7, openmpi 1.8.3 and hdf 1.8.14

.. code-block:: none

	module load libs/hdf5/gcc/openmpi/1.8.14
	tar -xvzf cgnslib_3.2.1.tar.gz
	mkdir /usr/local/packages6/libs/gcc/4.4.7/cgnslib
	cd /usr/local/packages6/libs/gcc/4.4.7/cgnslib
	mkdir 3.2.1
	cd 3.2.1
	cmake ~/cgnslib_3.2.1/
	ccmake .

Configured the following using ccmake ::

	CGNS_ENABLE_PARALLEL            ON                                         
	 MPIEXEC                         /usr/local/mpi/gcc/openmpi/1.8.3/bin/mpiexec 
	 MPI_COMPILER                    /usr/local/mpi/gcc/openmpi/1.8.3/bin/mpic++  
	 MPI_EXTRA_LIBRARY               /usr/local/mpi/gcc/openmpi/1.8.3/lib/libmpi.s
	 MPI_INCLUDE_PATH                /usr/local/mpi/gcc/openmpi/1.8.3/include     
	 MPI_LIBRARY                     /usr/local/mpi/gcc/openmpi/1.8.3/lib/libmpi_c
	 ZLIB_LIBRARY                    /usr/lib64/libz.so   

	FORTRAN_NAMING                   LOWERCASE_                                   
	 HDF5_INCLUDE_PATH               /usr/local/packages6/hdf5/gcc-4.4.7/openmpi-1.8.3/hdf5-1.8.14/include/
	 HDF5_LIBRARY                    /usr/local/packages6/hdf5/gcc-4.4.7/openmpi-1.8.3/hdf5-1.8.14/lib/libhdf5.so                        
	 HDF5_NEED_MPI                    ON                                          
	 HDF5_NEED_SZIP                   OFF                                          
	 HDF5_NEED_ZLIB                   ON                                          
	 CGNS_BUILD_CGNSTOOLS             OFF                                          
	 CGNS_BUILD_SHARED                ON                                           
	 CGNS_ENABLE_64BIT                ON                                           
	 CGNS_ENABLE_FORTRAN              ON                                           
	 CGNS_ENABLE_HDF5                 ON                                           
	 CGNS_ENABLE_SCOPING              OFF                                          
	 CGNS_ENABLE_TESTS                ON                                           
	 CGNS_USE_SHARED                  ON                                           
	 CMAKE_BUILD_TYPE                 Release                                      
	 CMAKE_INSTALL_PREFIX             /usr/local/packages6/libs/gcc/4.4.7/cgnslib/3.2.1

Once the configuration was complete, I did ::
 
	make
	make install

Module File
-----------
Module File Location: ``/usr/local/modulefiles/libs/gcc/4.4.7/cgns/3.2.1``

.. code-block:: none

	#%Module1.0#####################################################################
	##
	## cgns 3.2.1 module file
	##

	## Module file logging
	source /usr/local/etc/module_logging.tcl
	##

	proc ModulesHelp { } {
		puts stderr "Makes the cgns 3.2.1 library available"
	}

	module-whatis   "Makes the cgns 3.2.1 library available"
	module load libs/hdf5/gcc/openmpi/1.8.14

	set CGNS_DIR /usr/local/packages6/libs/gcc/4.4.7/cgnslib/3.2.1

	prepend-path LD_LIBRARY_PATH $CGNS_DIR/lib
	prepend-path CPATH $CGNS_DIR/include
