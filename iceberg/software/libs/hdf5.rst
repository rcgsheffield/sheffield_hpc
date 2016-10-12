.. _hdf5:

HDF5
====

.. sidebar:: HDF5

   :Version: 1.8.16, 1.8.15-patch1, 1.8.14 and 1.8.13
   :Dependencies: gcc or pgi compiler, openmpi (optional)
   :URL: http://www.hdfgroup.org/HDF5/
   :Documentation: http://www.hdfgroup.org/HDF5/doc/


HDF5 is a data model, library, and file format for storing and managing data.
It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data.
HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5.
The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format.

Two primary versions of this library are provided, MPI parallel enabled versions and serial versions.

Usage - Serial
---------------
The serial versions were built with gcc version 4.8.2. As such, if you are
going to build anything against these versions of HDF5, we recommend that you
use gcc 4.8.2 which can be enabled with the following module command ::

    module load compilers/gcc/4.8.2

To enable the serial version of HDF5, use one of the following module commands
depending on which version of the library you require::

     module load libs/hdf5/gcc/1.8.14
     module load libs/hdf5/gcc/1.8.13

Usage -- Parallel
-----------------

There are multiple versions of parallel HDF5 installed with different openmpi
and compiler versions.

Two versions of HDF were built using gcc version 4.4.7 and OpenMPI version
1.8.3.  Version 4.4.7 of gcc is the default compiler on the system so no module
command is required for this ::

    module load libs/hdf5/gcc/openmpi/1.8.14
    module load libs/hdf5/gcc/openmpi/1.8.13


One version was built with the PGI compiler version 15.7 and openmpi version
1.8.8 ::

    module load libs/hdf5/pgi/1.8.15-patch1

The above module also loads the relevant modules for OpenMPI and PGI Compiler.
To see which modules have been loaded, use the command ``module list``

Finally, another version was built with GCC 4.4.7 and openmpi 1.10.1, this
version is also linked against ZLIB and SZIP.::

    module load libs/gcc/4.4.7/openmpi/1.10.1/hdf5/1.8.16


Installation notes
------------------
This section is primarily for administrators of the system.

**Version 1.8.16 built using GCC Compiler, with seperate ZLIB and SZIP**

* `install_hdf5.sh   <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/libs/gcc/4.4.7/hdf5/install_hdf5.sh>`_ Install script
* `1.8.16   <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/libs/gcc/hdf5/1.8.16>`_

**Version 1.8.15-patch1 built using PGI Compiler**

Here are the build details for the module `libs/hdf5/pgi/1.8.15-patch1`

Compiled using PGI 15.7 and OpenMPI 1.8.8

* `install_pgi_hdf5_1.8.15-patch1.sh   <https://github.com/rcgsheffield/blob/master/software/install_scripts/libs/pgi/hdf5/install_pgi_hdf5_1.8.15-patch1.sh>`_ Install script
* `Modulefile <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/libs/pgi/hdf5/1.8.15-patch1>`_ located on the system at ``/usr/local/modulefiles/libs/hdf5/pgi/1.8.15-patch1``

**gcc versions**

This package is built from the source code distribution from the HDF Group website.

Two primary versions of this library are provided, a MPI parallel enabled version and a serial version.
The serial version has the following configuration flags enabled::

    --enable-fortran --enable-fortran2003 --enable-cxx --enable-shared

The parallel version has the following flags::

    --enable-fortran --enable-fortran2003 --enable-shared --enable-parallel

The parallel library does not support C++, hence it being disabled for the parallel build.
