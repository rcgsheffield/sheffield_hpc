.. _bessemer_eb_toolchains:

Development toolchains
======================

Much of the software available on Bessemer
was installed using `EasyBuild <https://easybuild.readthedocs.io/>`__,
which is a tool for building and installing software on HPC systems.

EasyBuild groups core sets of dependencies as what it calls *toolchains*.
The three supported toolchains on Bessemer are:

- ``foss``
   - C, C++ and Fortran compilers: :ref:`GCC <gcc_bessemer>`
   - MPI implementation: :ref:`OpenMPI <openmpi_bessemer>`
   - BLAS and LAPACK implementation: :ref:`OpenBLAS <openblas_bessemer>`
   - Parallel, distributed LAPACK implementation: :ref:`ScaLAPACK <scalapack_bessemer>`
   - Fourier transforms: :ref:`FFTW <fftw_bessemer>`

- ``fosscuda``
   - As per ``foss``
   - Plus CUDA

- ``intel``
   - C, C++ and Fortran compilers (:ref:`icc/icpc/ifort <icc_ifort_bessemer>`)
   - MPI implementation (:ref:`Intel MPI <impi_bessemer>`)
   - BLAS, LAPACK and fourier transforms: :ref:`Intel MKL <imkl_bessemer>`

Dependency versions for toolchains
----------------------------------

See the `EasyBuild documentation for dependency versions for foss and intel <https://easybuild.readthedocs.io/en/latest/Common-toolchains.html#overview-of-common-toolchains>`__

``fosscuda-2019a`` has the same dependencies as ``foss-2019a`` plus 
CUDA 10.1.
``fosscuda-2019b`` has the same dependencies as ``foss-2019b`` plus 
CUDA 10.1 update 1.

Sub-toolchains
--------------

In addition to the above toolchains there are sub-toolchains 
corresponding to subsets of the main toolchain dependencies:

* ``gompi``: ``GCC`` + ``openmpi``
* ``gompic``: ``GCC`` + ``OpenMPI`` + ``CUDA``
* ``gcccuda``: ``GCC`` + ``CUDA``
* ``iccifort``: ``icc`` + ``ifort``
* ``iimpi``: ``icc`` + ``ifort`` + ``impi``


