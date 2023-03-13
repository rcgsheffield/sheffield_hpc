.. _cfitsio_stanage:

cfitsio
========

.. sidebar:: cfitsio

   :Versions: 3.45, 3.48, 3.49
   :URL: http://heasarc.gsfc.nasa.gov/fitsio/fitsio.html

CFITSIO is a library of C and Fortran subroutines for reading and writing data
files in FITS (Flexible Image Transport System) data format. CFITSIO provides
simple high-level routines for reading and writing FITS files that insulate
the programmer from the internal complexities of the FITS format.

Usage
-----
To make this library available, run one of the following module commands ::

        module load CFITSIO/3.45-GCCcore-7.3.0
        module load CFITSIO/3.48-GCCcore-9.3.0
        module load CFITSIO/3.49-GCCcore-10.2.0
        module load CFITSIO/3.49-GCCcore-10.3.0
        module load CFITSIO/3.49-GCCcore-11.2.0
        
The modulefile creates a variable ``$CPATH`` which is the path
to the include directory.

Installation notes
------------------
This section is primarily for administrators of the system. CFITSIO has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELCFITSIO`` with a given module loaded.

Testing
-------
Create a ``test.c`` file containing the following (`source <https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html>`_):

.. code-block ::

        #include <string.h>
        #include <stdio.h>
        #include "fitsio.h"
        int main(int argc, char *argv[])
        {
                fitsfile *fptr;
                char card[FLEN_CARD];
                int status = 0,  nkeys, ii;  /* MUST initialize status */
                fits_open_file(&fptr, argv[1], READONLY, &status);
                fits_get_hdrspace(fptr, &nkeys, NULL, &status);
                for (ii = 1; ii <= nkeys; ii++)  {
                  fits_read_record(fptr, ii, card, &status); /* read keyword */
                  printf("%s\n", card);
                }
                printf("END\n\n");  /* terminate listing with END */
                fits_close_file(fptr, &status);
                if (status)          /* print any error messages */
                    fits_report_error(stderr, status);
                return(status);
        }


Fits file downloaded from `here <https://fits.gsfc.nasa.gov/samples/IUElwp25637mxlo.fits>`_.

.. code-block ::

        $ module load CFITSIO/3.49-GCCcore-10.2.0
        $ module load GCC/GCCcore-10.2.0
        $ gcc test.c -o test -lm /opt/apps/testapps/el7/software/staging/CFITSIO/3.49-GCCcore-10.2.0/lib/libcfitsio.so
        $ ./test IUElwp25637mxlo.fits | head


The output should look like::

        SIMPLE  =                    T / Standard FITS Format
        BITPIX  =                    8 / 8 bits ASCII
        NAXIS   =                    0 / No image data
        EXTEND  =                    T / Extensions are present
        TELESCOP= 'IUE     '           / International Ultraviolet Explorer
        DATE    = '29/12/95'           / Date file was written
        ORIGIN  = 'GSFC    '           / Institution generating the file
        COMMENT *
        COMMENT * CORE DATA ITEMS - COMMON SET
        COMMENT *
