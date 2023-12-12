.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _fftw_sharc:

fftw
====

.. sidebar:: fftw

   :Latest version: 3.3.5
   :URL: http://www.fftw.org/

FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of arbitrary input size, and of both real and complex data (as well as of even/odd data, i.e. the discrete cosine/sine transforms or DCT/DST).

Usage
-----
To make this library available, run the following: ::

        module load libs/fftw/3.3.5/gcc-4.9.4

Installation notes
------------------
This section is primarily for administrators of the system. 

Version 3.3.5
^^^^^^^^^^^^^

This was compiled with GCC 4.9.4 (for compatibility with CUDA, which doesn't support GCC >= 5.0.0).  The following were enabled at compile-time:

- Threading (inc. OpenMP)
- Shared-library support
- SIMD (specifically, AVX2)

First, download, configure, build, test and install using :download:`this script </decommissioned/sharc/software/install_scripts/libs/fftw/3.3.5/gcc-4.9.4/install.sh>`.

During the testing stage you should see lots of numerical output plus: ::

  --------------------------------------------------------------
           FFTW transforms passed basic tests!
  --------------------------------------------------------------

  --------------------------------------------------------------
           FFTW threaded transforms passed basic tests!
  --------------------------------------------------------------

Next, :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/fftw/3.3.5/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/fftw/3.3.5/gcc-4.9.4`` 

