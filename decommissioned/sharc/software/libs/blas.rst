.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _blas_sharc:

BLAS
====
The BLAS (Basic Linear Algebra Subprograms) are routines that provide standard building blocks for performing basic vector and matrix operations. The Level 1 BLAS perform scalar, vector and vector-vector operations, the Level 2 BLAS perform matrix-vector operations, and the Level 3 BLAS perform matrix-matrix operations. Because the BLAS are efficient, portable, and widely available, they are commonly used in the development of high quality linear algebra software, LAPACK for example.

Usage
-----
ShARC runs on the CentOS 7.x flavour of Linux which provides a standard build of BLAS via RPM files.  We have made this version of BLAS available via the following module command ::

    $ module load libs/blas/3.4.2-5/binary

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 3.4.2-5 binary**

BLAS was extracted from the RPMs for **blas** and **blas-devel**

# :download:`Install script </decommissioned/sharc/software/install_scripts/libs/blas/3.4.2-5/binary/install.sh>`
# :download:`Module File </decommissioned/sharc/software/modulefiles/libs/blas/3.4.2-5/binary>` as ``/usr/local/modulefiles/modulefiles/libs/blas/3.4.2-5/binary``

