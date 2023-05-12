.. _stanage_eb_toolchains:

Development toolchains
======================

Much of the software available on Stanage
was installed using `EasyBuild <https://easybuild.readthedocs.io/>`__,
which is a tool for building and installing software on HPC systems.

EasyBuild groups core sets of dependencies as what it calls *toolchains*.
The two supported toolchains on Stanage are:

- ``foss``
   - C, C++ and Fortran compilers: :ref:`GCC <gcc_stanage>`
   - MPI implementation: :ref:`OpenMPI <openmpi_stanage>`
   - BLAS and LAPACK implementation: :ref:`OpenBLAS <openblas_stanage>`
   - Parallel, distributed LAPACK implementation: :ref:`ScaLAPACK <scalapack_stanage>`
   - Fourier transforms: :ref:`FFTW <fftw_stanage>`

- ``intel``
   - C, C++ and Fortran compilers (:ref:`icc/icpc/ifort <icc_ifort_stanage>`)
   - MPI implementation (:ref:`Intel MPI <impi_stanage>`)
   - BLAS, LAPACK and fourier transforms: :ref:`Intel MKL <imkl_stanage>`

Dependency versions for toolchains
----------------------------------

See the `EasyBuild documentation for dependency versions for foss and intel <https://docs.easybuild.io/common-toolchains>`__

Sub-toolchains
--------------

In addition to the above toolchains there are sub-toolchains 
corresponding to subsets of the main toolchain dependencies:

* ``gompi``: ``GCC`` + ``openmpi``
* ``gompic``: ``GCC`` + ``OpenMPI`` + ``CUDA``
* ``gcccuda``: ``GCC`` + ``CUDA``
* ``iccifort``: ``icc`` + ``ifort``
* ``iimpi``: ``icc`` + ``ifort`` + ``impi``