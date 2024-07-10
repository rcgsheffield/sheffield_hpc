.. _openblas_stanage:

.. |softwarename| replace:: OpenBLAS
.. |currentver| replace:: 0.3.24 
.. |ebtoolchain| replace:: foss-2023b

OpenBLAS
========

.. sidebar:: OpenBLAS
   
   :Latest Version: |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: https://www.openblas.net/
   :Documentation: https://github.com/xianyi/OpenBLAS/wiki/User-Manual

OpenBLAS is one of the :ref:`BLAS <blas_stanage>` implementations installed on Stanage.
It also provides some optimised LAPACK routines.

Usage
-----

OpenBLAS can be activated using one of:

.. tabs::

   .. group-tab:: Icelake
           
        .. code-block:: console

           module load OpenBLAS/0.3.24-GCC-13.2.0    # foss-2023b toolchain
           module load OpenBLAS/0.3.23-GCC-12.3.0    # foss-2023a toolchain
           module load OpenBLAS/0.3.21-GCC-12.2.0    # foss-2022b toolchain
           module load OpenBLAS/0.3.20-GCC-11.3.0    # foss-2022a toolchain
           module load OpenBLAS/0.3.18-GCC-11.2.0    # foss-2021b toolchain
           module load OpenBLAS/0.3.15-GCC-10.3.0    # foss-2021a toolchain
           module load OpenBLAS/0.3.12-GCC-10.2.0    # foss-2020b toolchain
           module load OpenBLAS/0.3.9-GCC-9.3.0      # foss-2020a toolchain

   .. group-tab:: Znver3
   
        .. code-block:: console
        
           module load OpenBLAS/0.3.20-GCC-11.3.0    # foss-2022a toolchain

which also loads a version of the :ref:`GCC <gcc_stanage>` compiler.

========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELOPENBLAS`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted by compiling and running the following test:

.. code-block:: c

	#include <stdio.h>
	#include <cblas.h>

	int main() {
	    const int N = 3;
	    double A[9] = {1.0, 2.0, 3.0,
			   4.0, 5.0, 6.0,
			   7.0, 8.0, 9.0};

	    double B[9] = {9.0, 8.0, 7.0,
			   6.0, 5.0, 4.0,
			   3.0, 2.0, 1.0};

	    double C[9];
	    int i, j;

	    // Perform matrix multiplication C = A * B
	    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, A, N, B, N, 0.0, C, N);

	    // Print the result matrix C
	    printf("Result matrix C:\n");
	    for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
		    printf("%f ", C[i*N + j]);
		}
		printf("\n");
	    }

	    return 0;
	}

Expected output:

.. code-block:: console

	Result matrix C:
	30.000000 24.000000 18.000000 
	84.000000 69.000000 54.000000 
	138.000000 114.000000 90.000000
