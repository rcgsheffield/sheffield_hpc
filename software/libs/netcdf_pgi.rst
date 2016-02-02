.. index::
    single: NetCDF (PGI)

.. _netcdf_pgi:

NetCDF (PGI build)
==================

.. sidebar:: NetCDF

   :Latest version:
   :Dependancies: PGI Compiler 15.7, PGI OpenMPI 1.8.8, PGI HDF5 1.8.15-patch1
   :URL: http://www.unidata.ucar.edu/software/netcdf/
   :Documentation: http://www.unidata.ucar.edu/software/netcdf/docs/


NetCDF is a set of software libraries and self-describing, machine-independent data formats that support the creation, access, and sharing of array-oriented scientific data. NetCDF was developed and is maintained at Unidata. Unidata provides data and software tools for use in geoscience education and research. Unidata is part of the University Corporation for Atmospheric Research (UCAR) Community Programs (UCP). Unidata is funded primarily by the National Science Foundation.

Usage
-----
This version of NetCDF was compiled using version 15.7 of the PGI Compiler, OpenMPI 1.8.8 and HDF5 1.8.15-patch1. To make it available, run the following module command after starting a ``qsh`` or ``qrsh`` session ::

    module load libs/pgi/netcdf/4.3.3.1

This module also loads the relevant modules for OpenMPI, PGI Compiler and HDF5. To see which modules have been loaded, use the command ``module list``

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 4.3.3.1**

Compiled using PGI 15.7, OpenMPI 1.8.8 and HDF5 1.8.15-patch1

* `install_pgi_netcdf_4.3.3.1.sh  <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/libs/pgi/netcdf/install_pgi_netcdf_4.3.3.1.sh>`_ Install script
* Install logs are on the system at ``/usr/local/packages6/libs/pgi/netcdf/4.3.3.1/install_logs``
* `Modulefile <https://github.com/mikecroucher/iceberg_software/blob/master/software/modulefiles/libs/pgi/netcdf/4.3.3.1>`_ located on the system at ``ls /usr/local/modulefiles/libs/pgi/netcdf/4.3.3.1``
