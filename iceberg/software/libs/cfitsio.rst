.. _cfitsio:

cfitsio
=======

.. sidebar:: cfitsio

   :Latest version: 3.380
   :URL: http://heasarc.gsfc.nasa.gov/fitsio/fitsio.html

CFITSIO is a library of C and Fortran subroutines for reading and writing data
files in FITS (Flexible Image Transport System) data format. CFITSIO provides
simple high-level routines for reading and writing FITS files that insulate
the programmer from the internal complexities of the FITS format. 

Usage
-----
To make this library available, run the following module command ::

        module load libs/gcc/5.2/cfitsio

The modulefile creates a variable ``$CFITSIO_INCLUDE_PATH`` which is the path
to the include directory.

Installation notes
------------------
This section is primarily for administrators of the system. CFITSIO 3.380 was compiled with gcc 5.2.
The compilation used this `script <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/libs/gcc/>`_ and it is loaded with this `modulefile
<https://github.com/mikecroucher/iceberg_software/blob/master/software/modulefiles/libs/gcc/5.2/cfitsio/3.380>`_ .
