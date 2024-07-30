.. |softwarename| replace:: PETSc
.. |currentver| replace:: 3.20.1

.. _petsc_stanage: 

PETSc
=====

.. sidebar::  |softwarename|

   :Versions: |currentver|
   :URL: https://petsc.org/release/
   :Documentation: https://petsc.org/release/manual/

The Portable, Extensible Toolkit for Scientific Computation (PETSc, pronounced PET-see; the S is silent) is a toolkit for Scientific Computation, is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations. It supports MPI, and GPUs through CUDA, HIP or OpenCL, as well as hybrid MPI-GPU parallelism; it also supports the NEC-SX Tsubasa Vector Engine. PETSc (sometimes called PETSc/TAO) also contains the TAO, the Toolkit for Advanced Optimization, software library.PETSc is developed as open-source, requests and contributions are welcome.


Usage
-----

PETSc can be activated using one of:

.. code-block:: bash

   module load PETSc/3.20.1-foss-2022b
   module load PETSc/3.17.4-foss-2022b



Installation Notes
------------------
These are primarily for system administrators.

Version 3.17.4
^^^^^^^^^^^^^^^

The none GPU installation was done using the custom easybuild ``PETSc-3.17.4-foss-2022b.eb``. This will also be submited to the official easybuild config github.

Version 3.20.1
^^^^^^^^^^^^^^^

The none GPU installation was done using the custom easybuild ``PETSc-3.20.1-foss-2022b.eb``. This will also be submited to the official easybuild config github.


Testing
-------

Version 3.20.1 && 3.17.4
^^^^^^^^^^^^^^^^^^^^^^^^

Load the desired PETSc module.

Create a file called example.c

.. code-block:: bash

    static char help[] = "Simple PETSc example demonstrating vector operations.\n\n";

    #include <petscvec.h>
    
    int main(int argc, char **argv) {
        printf("Hello World!");
        return 0;
    }

Compile using the following command:

.. code-block:: bash

    mpicc -o example example.c
