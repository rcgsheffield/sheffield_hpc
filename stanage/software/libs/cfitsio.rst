.. _cfitsio_stanage:

cfitsio
========

.. sidebar:: cfitsio

   :Versions: 3.48, 3.49
   :URL: http://heasarc.gsfc.nasa.gov/fitsio/fitsio.html

CFITSIO is a library of C and Fortran subroutines for reading and writing data
files in FITS (Flexible Image Transport System) data format. CFITSIO provides
simple high-level routines for reading and writing FITS files that insulate
the programmer from the internal complexities of the FITS format.

Usage
-----
To make this library available, run one of the following module commands ::

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

.. code-block::

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

.. code-block::

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

Multi-thread Testing
--------------------

Download and unpack `threadtest.tar.gz <https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html>`_

Navigate into unpacked directory ``threadtest/``. Next enter the following commands:

.. code-block::
        
        module load CFITSIO/3.49-GCCcore-11.2.0
        module load GCC/11.2.0
        gcc fits_threads.c -lcfitsio -o fits_threads
        gcc fits_threads2.c  -lcfitsio -o fits_threads2
        gcc threadhello.c -fopenmp -o threadhello
   
      
Next source each compiled file (expected output shown):

.. code-block:: console
        :emphasize-lines: 1,25,30
        
        $ ./fits_threads

        7  7  7  6  6  6  6  6  5  4
        5  7  11  18  27  36  48  59  74  123
        178  89  95  100  105  111  117  125  133  141
        147  155  166  175  185  193  192  196  199  200
        200  200  200  203  204  204  207  207  207  211
        211  209  210  211  211  213  214  213  214  215
        216  216  216  217  218  218  219  218  220  221
        221  220  219  220  221  220  221  221  223  225
        222  223  224  223  223  225  224  223  224  225
        225  226  225  221  224  225  226  228  231  232

        22  22  22  21  21  21  21  21  20  19
        20  22  26  33  42  51  63  74  89  138
        193  104  110  115  120  126  132  140  148  156
        162  170  181  190  200  208  207  211  214  215
        215  215  215  218  219  219  222  222  222  226
        226  224  225  226  226  228  229  228  229  230
        231  231  231  232  233  233  234  233  235  236
        236  235  234  235  236  235  236  236  238  240
        237  238  239  238  238  240  239  238  239  240
        240  241  240  236  239  240  241  243  246  247

        $ ./fits_threads2

        sum of image 0 = 34417584.000000
        sum of image 1 = 36397848.000000
        
        $ ./threadhello

        Hello from thread 6, nthreads 8
        Hello from thread 7, nthreads 8
        Hello from thread 5, nthreads 8
        Hello from thread 2, nthreads 8
        Hello from thread 3, nthreads 8
        Hello from thread 0, nthreads 8
        Hello from thread 1, nthreads 8
        Hello from thread 4, nthreads 8
