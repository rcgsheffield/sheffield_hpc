.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _`PGI Compilers_sharc`:

PGI Compilers
=============
The PGI Compiler suite offers C,C++ and Fortran Compilers. For full details of the features of this compiler suite, see `PGI's website <http://www.pgroup.com/products/pgiworkstation.htm>`_.

Making the PGI Compilers available
----------------------------------

After connecting to the ShARC cluster (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` or :ref:`qrsh` command then activate a specific version of the compiler suite using one of: ::

    module load dev/PGI-compilers/20.4
    module load dev/PGI-compilers/19.5
    module load dev/PGI-compilers/18.10
    module load dev/PGI-compilers/17.5
    module load dev/PGI-compilers/16.10
    module load dev/PGI-compilers/12.10

Once you've loaded the module, you can check the version with ::

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

Start an interactive GPU session (:ref:`GPUInteractive_sharc`) and the following module command ::

    module load dev/PGI-compilers/19.5

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

Version 20.4
^^^^^^^^^^^^^^

The installer is interactive and the process was identical to that of version 16.10 below.

Version 19.5
^^^^^^^^^^^^^^

The installer is interactive and the process was identical to that of version 16.10 below.

Version 18.10
^^^^^^^^^^^^^^^

The installer is interactive and the process was identical to that of version 16.10 below.

Version 17.5
^^^^^^^^^^^^^^

The installer is interactive and the process was identical to that of version 16.10 below.

Version 16.10
^^^^^^^^^^^^^^^

The installer is interactive. Here is a log of the questions and answers. ::

  A network installation will save disk space by having only one copy of the
  compilers and most of the libraries for all compilers on the network, and
  the main installation needs to be done once for all systems on the network.

  1  Single system install
  2  Network install

  Please choose install option: 1

  Please specify the directory path under which the software will be installed.
  The default directory is /opt/pgi, but you may install anywhere you wish,
  assuming you have permission to do so.

  Installation directory? [/opt/pgi] /usr/local/packages/dev/pgi

  If you use the 2016 directory in your path, you may choose to
  update the links in that directory to point to the 16.10 directory.

  Do you wish to update/create links in the 2016 directory? (y/n) y
  Making symbolic links in /usr/local/packages/dev/pgi/linux86-64/2016

  Installing PGI JAVA components into /usr/local/packages/dev/pgia
  Installing PGI CUDA components into /usr/local/packages/dev/pgi
  Installing AMD GPU components into /usr/local/packages/dev/pgi
  Installing PGI OpenACC Unified Memory components into /usr/local/packages/dev/pgi ...

  ************************************************************************
  MPI
  ************************************************************************
  This release contains version 1.10.2 of the Open MPI library.

  Press enter to continue...

  Do you want to install Open MPI onto your system? (y/n) y
  Do you want to enable NVIDIA GPU support in Open MPI? (y/n) y

  Do you wish to generate license keys or configure license service? (y/n) n
  The PGI license management script is available at:
  /usr/local/packages/dev/pgi/linux86-64/16.10/bin/pgi_license_tool

  Do you want the files in the install directory to be read-only? (y/n) n

Version 12.10
^^^^^^^^^^^^^
The installer is interactive and the process was identical to that of version 16.10 above however, it does not create its own module file and so the 16.10 modulefile was copied and amended.


Module files
------------

Module files are automatically created by the installer at ``/usr/local/packages/dev/pgi/modulefiles/pgi/``, these are copied/moved to ``/usr/local/modulefiles/dev/PGI-compilers/`` and amended with the module logging script.

Exceptions to this are noted below.

Version 12.10
^^^^^^^^^^^^^
The installer is interactive and the process was identical to that of version 16.10 above however, it does not create its own module file and so the 16.10 modulefile was copied and amended to suit 12.10.

