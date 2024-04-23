.. _gsl_stanage:

.. |softwarename| replace:: GSL 
.. |currentver| replace:: 2.7

GSL
===

.. sidebar:: |softwarename|
   
   :Version: |currentver|
   :URL: https://www.gnu.org/software/gsl/
   :Documentation: https://www.gnu.org/software/gsl/doc/html/index.html

The GNU Scientific Library (GSL) is a collection of routines for numerical computing. 
The routines have been written from scratch in C.  
See `here <https://www.gnu.org/software/gsl/doc/html/intro.html>`__ for the types of routines that the GSL provides.

.. note::
   
   Currently, we only have builds which are compatible with our CPU nodes.

Usage
-----

The GSL library can be loaded by running one of: 

.. code-block::

	module load GSL/2.5-GCC-7.3.0-2.30
	module load GSL/2.6-GCC-9.3.0
	module load GSL/2.6-GCC-10.2.0
	module load GSL/2.7-GCC-10.3.0
	module load GSL/2.7-GCC-11.2.0
	module load GSL/2.7-GCC-11.3.0
	module load GSL/2.7-GCC-12.2.0

which will also load a particular :ref:`GCC <gcc_stanage>`,
*or*: 

.. code-block::

	module load GSL/2.6-iccifort-2020.1.217

if you also want to activate or have already activated :ref:`icc/icpc/ifort <icc_ifort_stanage>` 2020.1.217.

Example
-------

A example program that uses the GSL (taken from the GSL `documentation <https://www.gnu.org/software/gsl/doc/html/usage.html>`_):

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

   gcc -Wall -lgsl -lgslcblas -o test test.c  # OR
   icc -Wall -lgsl -lgslcblas -o test test.c 

Then run using:

.. code-block:: sh

    ./test

which should print the following (correct to double-precision accuracy): ::

    J0(5) = -1.775967713143383198e-01

NB generally, you may not need to compile using ``-lgslcblas`` depending on which GSL routines you are using.

========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELGSL`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted using the above example.
