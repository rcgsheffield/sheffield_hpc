.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _cfitsio_sharc:

cfitsio
=======

.. sidebar:: cfitsio

   :Versions: 3.49, 3.38
   :URL: http://heasarc.gsfc.nasa.gov/fitsio/fitsio.html

CFITSIO is a library of C and Fortran subroutines for reading and writing data
files in FITS (Flexible Image Transport System) data format. CFITSIO provides
simple high-level routines for reading and writing FITS files that insulate
the programmer from the internal complexities of the FITS format. 

Usage
-----
To make this library available, run one of the following module commands ::

        module load libs/cfitsio/3.38/gcc-8.2
        module load libs/cfitsio/3.49/gcc-8.2

The modulefile creates a variable ``$CFITSIO_INCLUDE_PATH`` which is the path
to the include directory.

Installation notes
------------------
This section is primarily for administrators of the system. CFITSIO 3.49,3.38 was compiled with GCC 8.2.
The compilation used this :download:`script </decommissioned/sharc/software/install_scripts/libs/cfitsio/install_cfitsio.sh>` 
and it is loaded with this :download:`modulefile </decommissioned/sharc/software/modulefiles/libs/cfitsio/3.49/gcc-8.2>`.

The module was tested with the process described here: https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/c_user/node13.html.

