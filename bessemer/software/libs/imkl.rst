.. _imkl_bessemer:

Intel MKL
=========

.. sidebar:: Intel MKL

   :URL: https://software.intel.com/en-us/mkl
   :Documentation: https://software.intel.com/en-us/mkl/documentation/view-all

Intel's Math Kernel Library (MKL) provides
highly optimized, threaded and vectorized functions to
maximize performance on each processor family.
It utilises de-facto standard C and Fortran APIs
for compatibility with :ref:`BLAS <blas_bessemer>`,
LAPACK and
FFTW functions from other math libraries.

Usage
-----

The Intel MKL can be activated using one of the following: ::

   module load imkl/2020.4.304-iimpi-2020b  # subset of intel-2020b EasyBuild toolchain
   module load imkl/2020.1.217-iimpi-2020a  # subset of intel-2020a EasyBuild toolchain
   module load imkl/2019.5.281-iimpi-2019b  # subset of intel-2019b EasyBuild toolchain
   module load imkl/2019.1.144-iimpi-2019a  # subset of intel-2019a EasyBuild toolchain
   module load imkl/2018.3.222-iimpi-2018b  # subset of intel-2018b EasyBuild toolchain

which also implicitly loads a version of the :ref:`iimpi <bessemer_eb_toolchains>` toolchain,
itself being a subset of the ``intel`` toolchain.
