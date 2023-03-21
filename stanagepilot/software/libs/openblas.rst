.. _openblas_stanage:

OpenBLAS
========

.. sidebar:: OpenBLAS
   
   :URL: https://www.openblas.net/
   :Documentation: https://github.com/xianyi/OpenBLAS/wiki/User-Manual

OpenBLAS is one of the :ref:`BLAS <blas_stanage>` implementations installed on Stanage.
It also provides some optimised LAPACK routines.

Usage
-----

OpenBLAS can be activated using one of: ::

   module load OpenBLAS/0.3.7-GCC-8.3.0      # foss-2019b toolchain
   module load OpenBLAS/0.3.9-GCC-9.3.0      # foss-2020a toolchain
   module load OpenBLAS/0.3.12-GCC-10.2.0    # foss-2020b toolchain
   module load OpenBLAS/0.3.15-GCC-10.3.0    # foss-2021a toolchain
   module load OpenBLAS/0.3.18-GCC-11.2.0    # foss-2021b toolchain
   module load OpenBLAS/0.3.20-GCC-11.3.0    # foss-2022a toolchain
   module load OpenBLAS/0.3.21-GCC-12.2.0    # foss-2022b toolchain

   
which also loads a version of the :ref:`GCC <gcc_stanage>` compiler.
