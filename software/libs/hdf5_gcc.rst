.. _hdf5gcc:

HDF5 (gcc build)
================


.. sidebar:: HDF5 (gcc build)

   :Version: 1.8.14 and 1.8.13
   :Support Level: bronze
   :Dependancies: openmpi (1.8.3)
   :URL: http://www.hdfgroup.org/HDF5/
   :Documentation: http://www.hdfgroup.org/HDF5/doc/


HDF5 is a data model, library, and file format for storing and managing data.
It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data.
HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5.
The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format.

Two primary versions of this library are provided, MPI parallel enabled versions and serial versions.

Usage - Serial
---------------
The serial versions were built with gcc version 4.8.2. As such, if you are going to build anything against these versions of HDF5, we recommend that you use gcc 4.8.2 which can be enabled with the following module command ::

    module load compilers/gcc/4.8.2

To enable the serial version of HDF5, use one of the following module commands depending on which version of the library you require::

     module load libs/hdf5/gcc/1.8.14
     module load libs/hdf5/gcc/1.8.13

Usage -- Parallel
-----------------
The MPI Parallel version was built using gcc version 4.4.7 and OpenMPI version 1.8.3.  Version 4.4.7 of gcc is the default compiler on the system so no module command is required for this.

To make the MPI version of HDF5 available, use one of the following module commands ::

    module load libs/hdf5/gcc/openmpi/1.8.14
    module load libs/hdf5/gcc/openmpi/1.8.13

It is not necessary to load the OpenMPI module in either case since this is done automatically on execution of one of the above commands.

Optional HDF5 features
----------------------
Our HDF5 builds have zlib support built in but do not have support for the SZIP Encoder.

Installation notes
------------------
This section is primarily for administrators of the system.

This package is built from the source code distribution from the HDF Group website.

Two primary versions of this library are provided, a MPI parallel enabled version and a serial version.
The serial version has the following configuration flags enabled::

    --enable-fortran --enable-fortran2003 --enable-cxx --enable-shared

The parallel version has the following flags::

    --enable-fortran --enable-fortran2003 --enable-shared --enable-parallel

The parallel library does not support C++, hence it being disabled for the parallel build.
