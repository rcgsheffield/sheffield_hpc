.. _sharc-intel-compilers:

Intel Compilers
===============

Intel Compilers help create C, C++ and Fortran applications that can take full advantage of the advanced hardware capabilities available in Intel processors and co-processors. They also simplify that development by providing high level parallel models and built-in features like explicit vectorization and optimization reports.

Parallel Studio Composer Edition 2017 versions
----------------------------------------------

These versions of the Intel compilers were installed as part of :ref:`Intel Parallel Studio <sharc-intel-parallel-studio>` but can be used with or without the other Parallel Studio components.

After connecting to the ShARC cluster (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or :code:`qrsh` command then run ::

    dev/intel-compilers/17.0.0/binary

Compilation examples
--------------------
**C**

To compile the C hello world example into an executable called ``hello`` using the Intel C compiler ::

    icc hello.c -o hello

**C++**

To compile the C++ hello world example into an executable called ``hello`` using the Intel C++ compiler ::

      icpc hello.cpp -o hello

**Fortran**

To compile the Fortran hello world example into an executable called ``hello`` using the Intel Fortran compiler ::

      ifort hello.f90 -o hello

Detailed Documentation
----------------------
Once you have loaded the module on Iceberg, ``man`` pages are available for Intel compiler products ::

    man ifort
    man icc

The following links are to Intel's website:

* `User and Reference Guide for the Intel® C++ Compiler 17.0 <https://software.intel.com/en-us/intel-cplusplus-compiler-17.0-user-and-reference-guide-intel-system-studio-2017>`_
* `User and Reference Guide for the Intel® Fortran Compiler 17.0 <https://software.intel.com/en-us/intel-fortran-compiler-17.0-user-and-reference-guide>`_
* `Step by Step optimizing with Intel C++ Compiler <https://software.intel.com/en-us/articles/step-by-step-optimizing-with-intel-c-compiler>`_

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing <sharc-intel-parallel-studio>`.

Related Software on the system
------------------------------

TODO: add link to NAG Fortran Library (serial)

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel Compilers 2017**

Installed as part of :ref:`Parallel Studio Composer Edition 2017 <sharc-intel-parallel-studio>`.

`This modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/dev/intel-compilers/17.0.0>`__ was installed as ``/usr/local/modulefiles/dev/intel-compilers/17.0.0``.
