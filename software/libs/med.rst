.. index::
    single: MED


.. _MED:

MED
===

.. sidebar:: MED

   :Version: 3.0.8
   :Support Level: Bronze
   :URL: http://www.salome-platform.org/downloads/current-version
   :Location: /usr/local/packages6/libs/gcc/4.4.7/med/3.0.8

The purpose of the MED module is to provide a standard for storing and recovering computer data associated to numerical meshes and fields, and to facilitate the exchange between codes and solvers. 

Usage
-----
To make this library available, run the following module command

.. code-block:: none

        module load libs/gcc/4.4.7/med/3.0.8

Installation notes
------------------
This section is primarily for administrators of the system.

* This is a pre-requisite for Code Saturne version 4.0.
* It was built with gcc 4.4.7, openmpi 1.8.3 and hdf5 1.8.14

.. code-block:: none

        module load mpi/gcc/openmpi/1.8.3
	tar -xvzf med-3.0.8.tar.gz
	cd med-3.0.8
	mkdir -p /usr/local/packages6/libs/gcc/4.4.7/med/3.0.8
	./configure --prefix=/usr/local/packages6/libs/gcc/4.4.7/med/3.0.8 --disable-fortran --with-hdf5=/usr/local/packages6/hdf5/gcc-4.4.7/openmpi-1.8.3/hdf5-1.8.14/ --disable-python
        make
	make install

Fortran was disabled because otherwise the build failed with compilation errors. It's not needed for Code Saturne 4.0.

Python was disabled because it didn't have MPI support.

testing
-------
The following was submiited as an SGE job from the med-3.0.8 build directory

.. code-block:: none

	#!/bin/bash

	#$ -pe openmpi-ib 8
	#$ -l mem=6G

	module load mpi/gcc/openmpi/1.8.3
	make check

All tests passed

Module File
-----------
.. code-block:: none

	#%Module1.0#####################################################################
	##
	## MED 3.0.8 module file
	##

	## Module file logging
	source /usr/local/etc/module_logging.tcl
	##

	proc ModulesHelp { } {
		puts stderr "Makes the MED 3.0.8 library available"
	}

	module-whatis   "Makes the MED 3.0.8 library available"

	set MED_DIR /usr/local/packages6/libs/gcc/4.4.7/med/3.0.8

	prepend-path LD_LIBRARY_PATH $MED_DIR/lib64
	prepend-path CPATH $MED_DIR/include
