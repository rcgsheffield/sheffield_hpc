.. _cfitsio_bessemer:

cfitsio
=======

.. sidebar:: cfitsio

   :Versions: 3.45, 3.47, 3.48
   :URL: https://heasarc.gsfc.nasa.gov/fitsio/fitsio.html

CFITSIO is a library of C and Fortran subroutines for reading and writing data
files in FITS (Flexible Image Transport System) data format. CFITSIO provides
simple high-level routines for reading and writing FITS files that insulate
the programmer from the internal complexities of the FITS format.

Usage
-----
To make this library available, run one of the following module commands ::

        module load CFITSIO/3.45-GCCcore-7.3.0
        module load CFITSIO/3.45-intel-2018b
        module load CFITSIO/3.47-GCCcore-8.3.0
        module load CFITSIO/3.48-GCCcore-9.3.0

The modulefile creates a variable ``$CPATH`` which is the path
to the include directory.

Installation notes
------------------
This section is primarily for administrators of the system. CFITSIO has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTCFITSIO/easybuild`` with a given module loaded.
