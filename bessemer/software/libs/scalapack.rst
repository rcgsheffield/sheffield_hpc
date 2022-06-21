.. _scalapack_bessemer:

ScaLAPACK
=========

.. sidebar:: ScaLAPACK
   
   :URL: http://www.netlib.org/scalapack/
   :Documentation: http://www.netlib.org/scalapack/#_documentation

ScaLAPACK is a library of high-performance linear algebra routines
for parallel distributed memory machines.
ScaLAPACK solves:

* Dense and banded linear systems
* Least squares problems
* Eigenvalue problems
* Singular value problems

Usage
-----

ScaLAPACK can be activated in several ways.

To load ScaLAPACK plus

* a version of :ref:`OpenBLAS <openblas_bessemer>`,
* and the :ref:`gompi or gompic toolchain <bessemer_eb_toolchains>`

run *one* of the following: ::

   module load ScaLAPACK/2.0.2-gompi-2019b
   module load ScaLAPACK/2.0.2-gompi-2019a-OpenBLAS-0.3.5
   module load ScaLAPACK/2.0.2-gompi-2018b-OpenBLAS-0.3.1
   module load ScaLAPACK/2.0.2-gompic-2019b
   module load ScaLAPACK/2.0.2-gompic-2019a-OpenBLAS-0.3.5

Note that all load OpenBLAS, despite the change in the module naming convention for more recent toolchains.
