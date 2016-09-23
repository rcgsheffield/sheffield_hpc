.. _PGI_Compiler_GPU:

Compiling on the GPU using the PGI Compiler
===========================================
The PGI Compilers are a set of commercial Fortran,C and C++ compilers from the Portland Group. To make use of them, first start an :ref:`interactive GPU session <GPUInteractive>` and run one of the following module commands, depending on which version of the compilers you wish to use ::

        module load compilers/pgi/13.1
        module load compilers/pgi/14.4

The PGI compilers have several features that make them interesting to users of GPU hardware:-

OpenACC Directives
------------------
OpenACC is a relatively new way of programming GPUs that can be significantly simpler to use than low-level language extensions such as CUDA or OpenCL. From the `OpenACC website <http://www.openacc-standard.org/About_OpenACC>`_ :

    The OpenACC Application Program Interface describes a collection of compiler directives to specify loops and regions of code in standard C, C++ and Fortran to be offloaded from a host CPU to an attached accelerator. OpenACC is designed for portability across operating systems, host CPUs, and a wide range of accelerators, including APUs, GPUs, and many-core coprocessors.

    The directives and programming model defined in the OpenACC API document allow programmers to create high-level host+accelerator programs without the need to explicitly initialize the accelerator, manage data or program transfers between the host and accelerator, or initiate accelerator startup and shutdown.

For more details concerning OpenACC using the PGI compilers, see `The PGI OpenACC website <http://www.pgroup.com/resources/accel.htm>`_.

CUDA Fortran
------------
In mid 2009, PGI and NVIDIA cooperated to develop CUDA Fortran. CUDA Fortran includes a Fortran 2003 compiler and tool chain for programming NVIDIA GPUs using Fortran.

* `CUDA Fortran Programming Guide <http://www.pgroup.com/lit/whitepapers/pgicudaforug.pdf>`_.

CUDA-x86
--------
NVIDIA CUDA was developed to enable offloading computationally intensive kernels to massively parallel GPUs. Through API function calls and language extensions, CUDA gives developers explicit control over the mapping of general-purpose computational kernels to GPUs, as well as the placement and movement of data between an x86 processor and the GPU.

The PGI CUDA C/C++ compiler for x86 platforms allows developers using CUDA to compile and optimize their CUDA applications to run on x86-based workstations, servers and clusters with or without an NVIDIA GPU accelerator. When run on x86-based systems without a GPU, PGI CUDA C applications use multiple cores and the streaming SIMD (Single Instruction Multiple Data) capabilities of Intel and AMD CPUs for parallel execution.

* `PGI CUDA-x86 guide <http://www.pgroup.com/resources/cuda-x86.htm>`_.
