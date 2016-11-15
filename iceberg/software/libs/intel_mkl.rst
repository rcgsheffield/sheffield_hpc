.. _iceberg_intel_mkl:

Intel Math Kernel Library
=========================

Intel's Math Kernel Library (MKL) provides highly optimized, threaded and
vectorized functions to maximize performance on each processor family. It
Utilises de-facto standard C and Fortran APIs for compatibility with BLAS,
LAPACK and FFTW functions from other math libraries.

Interactive usage
-----------------

The MKL was installed along with the :ref:`Intel compilers
<iceberg_intel_compilers>` as part of Intel Parallel Studio.  The MKL can be
used with or without other Parallel Studio packages (such as the Intel
compilers).  

To activate just the MKL, use one of : ::

    module load libs/binlibs/intel-mkl/2017.0

    module load libs/binlibs/intel-mkl/11.2.3

Note that 2017.0 is newer than 11.2.3.

Sample C and Fortran programs demonstrating matrix multiplication 
are available for **version 2017.0** in the directory ``$MKL_SAMPLES``: ::

        $ ls $MKL_SAMPLES/
        mkl_c_samples  mkl_fortran_samples

To compile one of these you need to copy the samples to a directory you can write to, 
ensure the MKL and the *Intel compilers* are both loaded,
change into the directory containing the relevant sample program (C or Fortran) then
run ``make`` to compile: ::

        $ qrsh 
        $ cp -r $MKL_SAMPLES/ ~/mkl_samples
        $ module load libs/binlibs/intel-mkl/2017.0
        $ module load libs/binlibs/intel-mkl/2017.0
        $ cd ~/mkl_samples/mkl_fortran_samples/matrix_multiplication
        $ make

        ifort -c src/dgemm_example.f -o release/dgemm_example.o
        ifort release/dgemm_example.o -mkl -static-intel -o release/dgemm_example
        ifort -c src/dgemm_with_timing.f -o release/dgemm_with_timing.o
        ifort release/dgemm_with_timing.o -mkl -static-intel -o release/dgemm_with_timing
        ifort -c src/matrix_multiplication.f -o release/matrix_multiplication.o
        ifort release/matrix_multiplication.o -mkl -static-intel -o release/matrix_multiplication
        ifort -c src/dgemm_threading_effect_example.f -o release/dgemm_threading_effect_example.o
        ifort release/dgemm_threading_effect_example.o -mkl -static-intel -o release/dgemm_threading_effect_example

You should then find several compiled programs in the ``release`` directory: ::

        $ ./release/matrix_multiplication
         This example measures performance of computing the real
         matrix product C=alpha*A*B+beta*C using
         a triple nested loop, where A, B, and C are matrices
         and alpha and beta are double precision scalars
         
         Initializing data for matrix multiplication C=A*B for 
         matrix A( 2000 x  200) and matrix B(  200 x 1000)
         
         Intializing matrix data
         
         Making the first run of matrix product using 
         triple nested loop to get stable run time
         measurements
         
         Measuring performance of matrix product using 
         triple nested loop
         
         == Matrix multiplication using triple nested loop ==
         == completed at    184.42246 milliseconds ==
         
         Example completed.

For documentation and a tutorial, start an :ref:`interactive session <sge-queue>` 
using ``qsh``, load MKL, then run: ::

        $ firefox $MKL_SAMPLES/mkl_fortran_samples/matrix_multiplication/tutorial/en/index.htm

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel MKL 2017.0**

Installed as part of :ref:`Parallel Studio Composer Edition 2017
<iceberg_intel_parallel_studio>`.

:download:`This modulefile
</iceberg/software/modulefiles/libs/binlibs/intel-mkl/2017.0>` was installed as
``/usr/local/modulefiles/libs/binlibs/intel-mkl/2017.0``.

**Intel MKL 11.2.3**

Installed as part of :ref:`Intel Parallel Studio Composer Edition 2015 Update 3
<iceberg_intel_compilers>`.

:download:`This modulefile
</iceberg/software/modulefiles/libs/binlibs/intel-mkl/11.2.3>` was installed as
``/usr/local/modulefiles/libs/binlibs/intel-mkl/11.2.3``
