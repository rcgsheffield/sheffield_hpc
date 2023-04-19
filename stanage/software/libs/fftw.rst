.. _fftw_stanage:

fftw
====

.. sidebar:: fftw

   :Latest version: 3.3.8
   :URL: https://www.fftw.org/

FFTW is a C subroutine library for
computing the discrete Fourier transform (DFT)
in one or more dimensions,
of arbitrary input size,
and of both real and complex data
(as well as of even/odd data,
i.e. the discrete cosine/sine transforms or DCT/DST).

Usage
-----
To make this library available, run one the following: ::

      module load FFTW/3.3.8-gompi-2019b
      module load FFTW/3.3.8-gompi-2020a
      module load FFTW/3.3.8-gompi-2020b
      module load FFTW/3.3.10-GCC-11.3.0
      module load FFTW/3.3.10-GCC-12.2.0
      module load FFTW.MPI/3.3.10-gompi-2022a
      module load FFTW.MPI/3.3.10-gompi-2022b


- `gompi` versions are a subset of the :ref:`foss toolchain <stanage_eb_toolchains>`
  and also load GCC and OpenMPI
- `gompic` versions are a subset of the :ref:`fosscuda toolchain <stanage_eb_toolchains>`
  and also load GCC, OpenMPI and CUDA.


Also see :ref:`imkl-fftw <imkl_fftw_stanage>` which is a library that combines FFTW library with Intel's Math Kernel Library (IMKL)
to provide optimized FFT routines that are specifically optimized for Intel processors.
