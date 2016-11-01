.. _sharc-intel-mkl:

Intel Math Kernel Library
=========================

Intel's Math Kernel Library (MKL) provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. It Utilises de-facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.

Parallel Studio Composer Edition version
----------------------------------------

MKL can be used with and without :ref:`other Parallel Studio packages <sharc-intel-parallel-studio>`.
To access it: ::

    module load libs/intel-mkl/2017.0/binary

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing <sharc-intel-parallel-studio>`.

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel MKL 2017.0**

Installed as part of :ref:`Parallel Studio Composer Edition 2017 <sharc-intel-parallel-studio>`.

`This modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-mkl/2017.0>`__ was installed as ``/usr/local/modulefiles/libs/intel-mkl/2017.0/binary``.
