.. _sharc_intel_mkl:

Intel Math Kernel Library
=========================

Intel's Math Kernel Library (MKL) provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. It Utilises de-facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.

Parallel Studio Composer Edition version
----------------------------------------

MKL can be used with and without :ref:`other Parallel Studio packages sharc_intel_parallel_studio`.

To access it ::

    module load libs/intel-mkl/2017.0/binary

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing sharc_intel_parallel_studio`.

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel MKL 2017.0**

Installed as part of :ref:`Parallel Studio Composer Edition 2017`.

`This modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-mkl/2017.0>`__ was installed as ``/usr/local/modulefiles/libs/intel-mkl/2017.0/binary``.
