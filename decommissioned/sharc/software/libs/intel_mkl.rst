.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc-intel-mkl:

Intel Math Kernel Library
=========================

Intel's Math Kernel Library (MKL) provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. It Utilises de-facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.

Parallel Studio Composer Edition version
----------------------------------------

MKL can be used with and without :ref:`other Parallel Studio packages <sharc-intel-parallel-studio>`.
To access it run **one** of the following: ::

    module load libs/intel-mkl/2019.3/binary
    module load libs/intel-mkl/2017.0/binary
    module load libs/intel-mkl/2016.1/binary
    module load libs/intel-mkl/2015.7/binary

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
        $ module load dev/intel-compilers/17.0.0 
        $ module load libs/intel-mkl/2017.0/binary
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

For documentation and a tutorial, start an :ref:`interactive session <submit_batch_sharc>` 
using ``qrshx``, load MKL, then run: ::

        $ firefox $MKL_SAMPLES/mkl_fortran_samples/matrix_multiplication/tutorial/en/index.htm

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing <sharc-intel-parallel-studio>`.

Installation Notes
------------------

The following notes are primarily for system administrators.

Intel MKL 2019.3
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2019 <sharc-intel-parallel-studio>`.

:download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2019.3/binary>` was installed as ``/usr/local/modulefiles/libs/intel-mkl/2019.3/binary``.

Intel MKL 2017.0
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2017 <sharc-intel-parallel-studio>`.

:download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2017.0/binary>` was installed as ``/usr/local/modulefiles/libs/intel-mkl/2017.0/binary``.

Intel MKL 2016.1
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2016 <sharc-intel-parallel-studio>`.

:download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2016.1/binary>` was installed as ``/usr/local/modulefiles/libs/intel-mkl/2016.1/binary``.

Intel MKL 2015.7
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2015.7 <sharc-intel-parallel-studio>`.

:download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2015.7/binary>` was installed as ``/usr/local/modulefiles/libs/intel-mkl/2015.7/binary``.

