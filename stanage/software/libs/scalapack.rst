.. _scalapack_stanage:


.. |softwarename| replace:: ScaLAPACK
.. |currentver| replace:: 2.2.0
.. |ebtoolchain| replace:: gompi-2023b-fb

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Latest Version:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: http://www.netlib.org/scalapack/
   :Documentation: http://www.netlib.org/scalapack/#_documentation

ScaLAPACK is a library of high-performance linear algebra routines
for parallel distributed memory machines.
ScaLAPACK solves:

* Dense and banded linear systems
* Least squares problems
* Eigenvalue problems
* Singular value problems

Usage
-----

ScaLAPACK can be activated in several ways.

To load ScaLAPACK plus

* a version of :ref:`OpenBLAS <openblas_stanage>`,
* and the :ref:`gompi or gompic toolchain <stanage_eb_toolchains>`

ScaLAPACK can be activated using one of: 

.. tabs::

   .. group-tab:: Icelake
   
        .. code-block::

                module load ScaLAPACK/2.2.0-gompi-2023b-fb
                module load ScaLAPACK/2.2.0-gompi-2023a-fb
                module load ScaLAPACK/2.2.0-gompi-2022b-fb
                module load ScaLAPACK/2.2.0-gompi-2022a-fb
                module load ScaLAPACK/2.1.0-gompi-2021b-fb
                module load ScaLAPACK/2.1.0-gompi-2021a-fb
                module load ScaLAPACK/2.1.0-gompi-2020b
                module load ScaLAPACK/2.1.0-gompi-2020a
   
   .. group-tab:: Znver3

        .. code-block::

                module load ScaLAPACK/2.2.0-gompi-2022a-fb 

Note that all load OpenBLAS, despite the change in the module naming convention for more recent toolchains.

========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELSCALAPACK`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted by compiling and testing the following:

.. code-block:: c

	#include <stdio.h>
	#include <stdlib.h>
	#include <mpi.h>

	// External BLACS and ScaLAPACK functions
	extern void Cblacs_pinfo(int *mypnum, int *nprocs);
	extern void Cblacs_get(int context, int request, int *value);
	extern void Cblacs_gridinit(int *context, char *order, int nprow, int npcol);
	extern void Cblacs_gridinfo(int context, int *nprow, int *npcol, int *myrow, int *mycol);
	extern void Cblacs_gridexit(int context);
	extern void Cblacs_exit(int NotDone);

	extern void descinit_(int *desc, int *m, int *n, int *mb, int *nb, int *irsrc, int *icsrc, int *ictxt, int *lld, int *info);
	extern void pdgesv_(int *n, int *nrhs, double *a, int *ia, int *ja, int *descA, int *ipiv, double *b, int *ib, int *jb, int *descB, int *info);

	int main(int argc, char **argv) {
	    int ictxt, nprow, npcol, myrow, mycol;
	    int info, n = 2, nrhs = 1;
	    int descA[9], descB[9];
	    int ipiv[2];
	    double A[4] = {4.0, 2.0, 1.0, 3.0}; // 2x2 matrix
	    double B[2] = {1.0, 2.0}; // RHS vector

	    // Initialize MPI
	    MPI_Init(&argc, &argv);

	    // Initialize BLACS
	    Cblacs_pinfo(&myrow, &nprow);
	    Cblacs_get(-1, 0, &ictxt); // Use -1 to get default system context
	    nprow = 1;
	    npcol = 1;
	    Cblacs_gridinit(&ictxt, "R", nprow, npcol);
	    Cblacs_gridinfo(ictxt, &nprow, &npcol, &myrow, &mycol);

	    // Initialize matrix descriptors
	    int nb = 2; // block size
	    int lld = 2; // local leading dimension
	    int zero = 0;
	    descinit_(descA, &n, &n, &nb, &nb, &zero, &zero, &ictxt, &lld, &info);
	    descinit_(descB, &n, &nrhs, &nb, &nb, &zero, &zero, &ictxt, &lld, &info);

	    // Check if descriptors were initialized correctly
	    if (info != 0) {
		printf("Error in descriptor initialization: %d\n", info);
		MPI_Finalize();
		return info;
	    }

	    // Solve the linear system A*X = B
	    int ia = 1, ja = 1, ib = 1, jb = 1;
	    pdgesv_(&n, &nrhs, A, &ia, &ja, descA, ipiv, B, &ib, &jb, descB, &info);

	    // Check for success
	    if (myrow == 0 && mycol == 0) {
		if (info == 0) {
		    printf("Solution: %f %f\n", B[0], B[1]);
		} else {
		    printf("Error: %d\n", info);
		}
	    }

	    // Finalize BLACS and MPI
	    Cblacs_gridexit(ictxt);
	    MPI_Finalize();

	    return 0;
	}

Expected result:

.. code-block::

	Solution: 0.100000 0.600000
