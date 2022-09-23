.. _`PGI Compilers_bessemer`:

PGI Compilers
=============

The PGI Compiler suite offers C, C++ and Fortran Compilers.
For full details of the features of this compiler suite
see `PGI's website <http://www.pgroup.com/products/pgiworkstation.htm>`_.

Making the PGI Compilers available
----------------------------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst


You can then activate a specific version of the compiler suite using one of: ::

   module load PGI/19.1-GCC-8.2.0-2.31.1
   module load PGI/18.10-GCC-6.4.0-2.28

Once you've loaded the module, you can check the version with: ::

   pgcc --version


Compilation examples
--------------------
**C**

To compile a C hello world example into an executable called ``hello`` using the PGI C compiler ::

    pgcc hello.c -o hello

**C++**

To compile a C++ hello world example into an executable called ``hello`` using the PGI C++ compiler ::

    pgc++ hello.cpp -o hello

**Fortran**

To compile a Fortran hello world example into an executable called ``hello`` using the PGI Fortran compiler ::

    pgf90 hello.f90 -o hello


Compiling on the GPU using the PGI Compiler
-------------------------------------------

Start an interactive GPU session (:ref:`GPUInteractive_bessemer`) and the following module command ::

   module load PGI/19.1-GCC-8.2.0-2.31.1

The PGI compilers have several features that make them interesting to users of GPU hardware:-

OpenACC Directives
^^^^^^^^^^^^^^^^^^

OpenACC is a relatively new way of programming GPUs that can be significantly simpler to use than low-level language extensions such as CUDA or OpenCL. From the `OpenACC website <http://www.openacc-standard.org/About_OpenACC>`_ :

    The OpenACC Application Program Interface describes a collection of compiler directives to specify loops and regions of code in standard C, C++ and Fortran to be offloaded from a host CPU to an attached accelerator. OpenACC is designed for portability across operating systems, host CPUs, and a wide range of accelerators, including APUs, GPUs, and many-core coprocessors.

    The directives and programming model defined in the OpenACC API document allow programmers to create high-level host+accelerator programs without the need to explicitly initialize the accelerator, manage data or program transfers between the host and accelerator, or initiate accelerator startup and shutdown.

For more details concerning OpenACC using the PGI compilers, see `The PGI OpenACC website <http://www.pgroup.com/resources/accel.htm>`_.

CUDA Fortran
^^^^^^^^^^^^

In mid 2009, PGI and NVIDIA cooperated to develop CUDA Fortran. CUDA Fortran includes a Fortran 2003 compiler and tool chain for programming NVIDIA GPUs using Fortran.

* `CUDA Fortran Programming Guide <http://www.pgroup.com/lit/whitepapers/pgicudaforug.pdf>`_.

CUDA-x86
^^^^^^^^

NVIDIA CUDA was developed to enable offloading computationally intensive kernels to massively parallel GPUs. Through API function calls and language extensions, CUDA gives developers explicit control over the mapping of general-purpose computational kernels to GPUs, as well as the placement and movement of data between an x86 processor and the GPU.

The PGI CUDA C/C++ compiler for x86 platforms allows developers using CUDA to compile and optimize their CUDA applications to run on x86-based workstations, servers and clusters with or without an NVIDIA GPU accelerator. When run on x86-based systems without a GPU, PGI CUDA C applications use multiple cores and the streaming SIMD (Single Instruction Multiple Data) capabilities of Intel and AMD CPUs for parallel execution.

* `PGI CUDA-x86 guide <http://www.pgroup.com/resources/cuda-x86.htm>`_.

Installation Notes
------------------

Source archives for PGI compilers can be found and downloaded for those registered at: https://www.pgroup.com/support/release_archive.php

These archives are then added in the Easybuild media directory: ``/usr/local/media/eb-srcs/p/PGI``.

Version 19.1
^^^^^^^^^^^^^^^

Version 19.1 was installed using the ``PGI-19.1-GCC-8.2.0-2.31.1.eb`` easyconfig. Post installation the module file was amended with an additional line to provide the licence server address as follows: ::

    prepend-path    PGROUPD_LICENSE_FILE            /usr/local/packages/common/licenses/pgi.lic

Version 18.10
^^^^^^^^^^^^^^^

Version 18.10 was installed using the ``PGI-18.10-GCC-6.4.0-2.28.eb`` easyconfig. Post installation the module file was amended with an additional line to provide the licence server address as with Version 19.1 .