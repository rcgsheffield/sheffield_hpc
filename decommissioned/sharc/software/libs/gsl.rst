.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _gsl_sharc:

GSL
===

.. sidebar:: GSL

   :Version: 2.4
   :URL: https://www.gnu.org/software/gsl/
   :Documentation: https://www.gnu.org/software/gsl/doc/html/index.html

The GNU Scientific Library (GSL) is a collection of routines for numerical computing.
The routines have been written from scratch in C.
See `here <https://www.gnu.org/software/gsl/doc/html/intro.html>`__ for the types of routines that the GSL provides.

Usage
-----

The GSL library can be loaded using either: ::

   module load libs/gsl/2.4/gcc-6.2
   module load libs/gsl/2.4/gcc-8.2

Example
-------

A example program that uses the GSL (taken from the GSL documentation):

.. code-block:: c

   #include <stdio.h>
   #include <stdlib.h>
   #include <gsl/gsl_sf_bessel.h>

   int main (void) {
     double x = 5.0;
     double y = gsl_sf_bessel_J0(x);

     printf("J0(%g) = %.18e\n", x, y);

     return EXIT_SUCCESS;
   }

Build this using:

.. code-block:: sh

   gcc -Wall -lgsl -lgslcblas -o test test.c

Then run using:

.. code-block:: sh

    ./test

which should print the following (correct to double-precision accuracy): ::

    J0(5) = -1.775967713143382642e-01

NB generally, you may not need to compile using ``-lgslcblas`` depending on which GSL routines you are using.

Installation notes
------------------



* 2.4 built with GCC 8.2/6.2 (same install script):
  :download:`install script </decommissioned/sharc/software/install_scripts/libs/gsl/2.4/gcc-6.2/install.sh>`;
  :download:`install log </decommissioned/sharc/software/install_scripts/libs/gsl/2.4/gcc-6.2/install.log>`;
  :download:`modulefile </decommissioned/sharc/software/modulefiles/libs/gsl/2.4/gcc-6.2>`.
  The installation was tested during the build process using ``make check``.

