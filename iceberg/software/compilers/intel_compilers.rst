.. _iceberg_intel_compilers:

Intel Compilers
===============

The Intel compilers help create C, C++ and Fortran applications that can take
full advantage of the advanced hardware capabilities available in Intel
processors and co-processors. They also simplify that development by providing
high level parallel models and built-in features like explicit vectorization
and optimization reports.

Several versions of the Intel compilers were installed on this cluster as part
of :ref:`Intel Parallel Studio <iceberg_intel_parallel_studio>` but can be used
with or without the other Parallel Studio components.

Usage and compilation examples
------------------------------

After connecting to iceberg (see :ref:`ssh`), start an interactive session with
the ``qsh`` or ``qrsh`` command. To make one of the versions of the Intel
compilers available, run one of the following module commands ::

        module load compilers/intel/17.0.0
        module load compilers/intel/15.0.3
        module load compilers/intel/14.0
        module load compilers/intel/12.1.15
        module load compilers/intel/11.0

**C**

To compile the C hello world example into an executable called ``hello`` using the Intel C compiler: ::

        icc hello.c -o hello

**C++**

To compile the C++ hello world example into an executable called ``hello`` using the Intel C++ compiler: ::

        icpc hello.cpp -o hello

**Fortran**

To compile the Fortran hello world example into an executable called ``hello`` using the Intel Fortran compiler: ::

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

Version 17.0.0
^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2017 <sharc-intel-parallel-studio>`.

:download:`This modulefile </iceberg/software/modulefiles/compilers/intel/17.0.0>` was installed as ``/usr/local/modulefiles/compilers/intel/17.0.0``.

Version 15.0.3
^^^^^^^^^^^^^^

* The install is located on the system at ``/usr/local/packages6/compilers/intel/2015/``
* The license file is at ``/usr/local/packages6/compilers/intel/license.lic``
* The environment variable ``INTEL_LICENSE_FILE`` is set by the environment module and points to the license file location
* Download the files ``l_ccompxe_2015.3.187.tgz`` (C/C++) and ``l_fcompxe_2015.3.187.tgz`` (Fortran) from Intel Portal.
* Put the above .tgz files in the same directory as `install_intel15.sh :download:</iceberg/software/install_scripts/compilers/intel/2015.3/install_intel15.sh>` and :download:`silent_master.cfg </iceberg/software/install_scripts/compilers/intel/2015.3/silent_master.cfg>`
* Run ``install_intel15.sh``
* To find what was required in the module file: ::

        env > base.env
        source /usr/local/packages6/compilers/intel/2015/composer_xe_2015.3.187/bin/compilervars.sh intel64
        env > after_intel.env
        diff base.env after_intel.env

* The :download:`module file </iceberg/software/modulefiles/compilers/intel/15.0.3>` is on iceberg at ``/usr/local/modulefiles/compilers/intel/15.0.3``

Versions 14 and below
^^^^^^^^^^^^^^^^^^^^^
Installation notes are not available for these older versions of the Intel compilers.
