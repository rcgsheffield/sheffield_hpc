.. _imkl_stanage:

Intel MKL
=========

.. sidebar:: Intel MKL

   :URL: https://software.intel.com/en-us/mkl
   :Documentation: https://software.intel.com/en-us/mkl/documentation/view-all

Intel's Math Kernel Library (MKL) provides
highly optimized, threaded and vectorized functions to
maximize performance on each processor family.
It utilises de-facto standard C and Fortran APIs
for compatibility with :ref:`BLAS <blas_stanage>`,
LAPACK and
FFTW functions from other math libraries.

Usage
-----

Intel MKL can be activated using one of the following: ::

   module load imkl/2020.1.217-iimpi-2020a # subset of intel-2020a EasyBuild toolchain
   module load imkl/2020.4.304-iimpi-2020b # subset of intel-2020b EasyBuild toolchain
   module load imkl/2021.2.0-iimpi-2021a   # subset of intel-2021a EasyBuild toolchain
   module load imkl/2021.4.0 # part of intel-2021b EasyBuild toolchain
   module load imkl/2022.1.0 # part of intel-2022a EasyBuild toolchain
   module load imkl/2022.2.1 # part of intel-2022b EasyBuild toolchain
  

   
which also implicitly loads a version of the :ref:`iimpi <stanage_eb_toolchains>` toolchain,
itself being a subset of the ``intel`` toolchain.

.. _imkl_fftw_stanage:

IMKL-FFTW
----------

IMKL-FFTW is a library that combines the :ref:`FFTW <fftw_stanage>` library with IMKL to provide optimized FFT routines that are specifically optimized for Intel processors.

Intel MKL-FFTW can be activated using one of the following: ::
   
   module load imkl-FFTW/2021.4.0-iimpi-2021b
   module load imkl-FFTW/2022.1.0-iimpi-2022a
   module load imkl-FFTW/2022.2.1-iimpi-2022b

