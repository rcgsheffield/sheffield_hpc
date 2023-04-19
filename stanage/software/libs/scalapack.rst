.. _scalapack_stanage:

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

* a version of :ref:`OpenBLAS <openblas_stanage>`,
* and the :ref:`gompi or gompic toolchain <stanage_eb_toolchains>`

ScaLAPACK can be activated using one of: ::

   module load ScaLAPACK/2.0.2-gompi-2019b
   module load ScaLAPACK/2.1.0-gompi-2020a
   module load ScaLAPACK/2.1.0-gompi-2020b
   module load ScaLAPACK/2.2.0-gompi-2022a-fb
   module load ScaLAPACK/2.2.0-gompi-2022b-fb

   
Note that all load OpenBLAS, despite the change in the module naming convention for more recent toolchains.

