.. _netcdf_fortran:

NetCDF (fortran)
================

.. sidebar:: NetCDF

   :Latest version: 4.4.3
   :Dependancies: mpi/gcc/openmpi/1.10.1 libs/gcc/4.4.7/openmpi/1.10.1/hdf5/1.8.16
   :URL: http://www.unidata.ucar.edu/software/netcdf/
   :Documentation: http://www.unidata.ucar.edu/software/netcdf/docs/


NetCDF is a set of software libraries and self-describing, machine-independent data formats that support the creation, access, and sharing of array-oriented scientific data. NetCDF was developed and is maintained at Unidata. Unidata provides data and software tools for use in geoscience education and research. Unidata is part of the University Corporation for Atmospheric Research (UCAR) Community Programs (UCP). Unidata is funded primarily by the National Science Foundation.

Usage
-----
This version of NetCDF was compiled using version 4.4.7 of the gcc compiler, openmpi 1.10.1 and HDF5 1.8.16.
To make it available, run the following module command after starting a ``qsh`` or ``qrsh`` session ::

    module load libs/gcc/4.4.7/openmpi/1.10.1/netcdf-fortran/4.4.3

This module also loads the relevant modules for OpenMPI, PGI Compiler and HDF5. To see which modules have been loaded, use the command ``module list``

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 4.4.3**

* `install_gcc_netcdf-fortran_4.4.3.sh  <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/libs/gcc/4.4.7/netcdf-fortran/install_gcc_netcdf-fortran_4.4.3.sh>`_ Install script
* `Modulefile <https://github.com/mikecroucher/iceberg_software/blob/master/software/modulefiles/libs/gcc/4.4.7/openmpi/1.10.1/netcdf-fortran/4.4.3>`_.
