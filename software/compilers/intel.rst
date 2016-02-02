.. index::
    single: Intel Compilers

.. _`Intel Compilers`:

Intel Compilers
===============
Intel Compilers help create C, C++ and Fortran applications that can take full advantage of the advanced hardware capabilities available in Intel processors and co-processors. They also simplify that development by providing high level parallel models and built-in features like explicit vectorization and optimization reports.

Making the Intel Compilers available
------------------------------------

After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or :code:`qrsh` command. To make one of the versions of the Intel Compiler available, run one of the following module commands ::

        module load compilers/intel/15.0.3
        module load compilers/intel/14.0
        module load compilers/intel/12.1.15
        module load compilers/intel/11.0

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

The following links are to Intel's website

* `User and Reference Guide for the Intel® C++ Compiler 15.0 <https://software.intel.com/en-us/compiler_15.0_ug_c>`_
* `User and Reference Guide for the Intel® Fortran Compiler 15.0 <https://software.intel.com/en-us/compiler_15.0_ug_f>`_
* `Step by Step optimizing with Intel C++ Compiler <https://software.intel.com/en-us/articles/step-by-step-optimizing-with-intel-c-compiler>`_

Related Software on the system
------------------------------
Users of the Intel Compilers may also find the following useful:

* :ref:`NAG Fortran Library (serial)` - A library of over 1800 numerical and statistical functions.

Installation Notes
------------------
The following notes are primarily for system administrators.

* Version 15.0.3

  * The install is located on the system at ``/usr/local/packages6/compilers/intel/2015/``
  * The license file is at ``/usr/local/packages6/compilers/intel/license.lic``
  * The environment variable ``INTEL_LICENSE_FILE`` is set by the environment module and points to the license file location
  * Download the files ``l_ccompxe_2015.3.187.tgz`` (C/C++) and ``l_fcompxe_2015.3.187.tgz`` (Fortran) from Intel Portal.
  * Put the above .tgz files in the same directory as `install_intel15.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/compilers/intel/2015.3/install_intel15.sh>`_ and `silent_master.cfg <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/compilers/intel/2015.3/silent_master.cfg>`_
  * Run ``install_intel15.sh``
  * To find what was required in the module file, I did ::

     env > base.env
     source /usr/local/packages6/compilers/intel/2015/composer_xe_2015.3.187/bin/compilervars.sh intel64
     env > after_intel.env
     diff base.env after_intel.env

  * The `module file <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/compilers/intel/15.0.3>`_ is on iceberg at ``/usr/local/modulefiles/compilers/intel/15.0.3``

version 14 and below
~~~~~~~~~~~~~~~~~~~~
Installation notes are not available for these older versions of the Intel Compiler.
