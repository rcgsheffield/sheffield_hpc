.. _iceberg_intel_parallel_studio:

Intel Parallel Studio
=====================

Intel Parallel Studio XE is a software development suite that helps boost application performance by taking advantage of the ever-increasing processor core count and vector register width available in Intel Xeon processors and other compatible processors.  
Its core components are compilers and libraries for fast linear algebra, data transformation and parallelisation.

Composer Edition 2017
---------------------

This includes:

* :ref:`Intel C++ and Fortran compilers <iceberg_intel_compilers>`: these help create C, C++ and Fortran applications that "can take full advantage of the advanced hardware capabilities available in Intel processors and co-processors. They also simplify that development by providing high level parallel models and built-in features like explicit vectorization and optimization reports".
* :ref:`Data Analytics Acceleration Library (DAAL) <iceberg_intel_daal>`: functions for data analysis (characterization, summarization, and transformation) and Machine Learning (regression, classification, and more).
* :ref:`Math Kernel Library (MKL) <iceberg_intel_mkl>`: This library provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. Utilizes de facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.
* :ref:`Integrated Performance Primitives (IPP) <iceberg_intel_ipp>`: "high-quality, production-ready, low-level building blocks for image processing, signal processing, and data processing (data compression/decompression and cryptography) applications."
* :ref:`Threading Building Blocks (TBB) <iceberg_intel_tbb>`: lets you write "parallel C++ programs that take full advantage of multicore performance, that are portable and composable, and that have future-proof scalability."

It does not include Intel's MPI implementation.  See `Intel's site <https://software.intel.com/en-us/intel-parallel-studio-xe/details>`_ for further details of what Parallel Studio Composer Edition includes.

Licensing and availability
--------------------------

Some components of Parallel Studio are freely available for those only wanting
community support; other components, such as the compilers are commercial
software. 

The University has purchased a number of Intel-supported licenses for the
Parallel Studio Composer Edition products listed above.  These can be accessed
by (and are shared between) the University's HPC clusters and researchers' own
machines.  

Installation Notes
------------------

The following notes are primarily for system administrators.

**Parallel Studio XE Composer Edition 2017.0**

#. Download ``parallel_studio_xe_2017_composer_edition.tgz`` from the Intel
   Portal, save in ``/usr/local/media/protected/intel/2017.0/`` then make it
   only readable by the ``app-admins`` group.
#. Ensure details of the Intel license server are in the file
   ``/usr/local/packages6/compilers/intel/license.lic``
#. Run :download:`this script
   </iceberg/software/install_scripts/compilers/intel-ps-xe-ce/2017.0/install.sh>`.
   This installs Parallel Studio into
   ``/usr/local/packages6/compilers/intel-pe-xe-ce/2017.0/binary/``.  Products are
   activated using the aforementioned license file during the installation
   process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.
   These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the
   location of the aforementioned license file and set other environment
   variables required by the different Parallel Studio products.  There is one
   modulefile for all Parallel Studio software and other modulefiles for
   specific products.  

    * The :download:`Compilers modulefile </iceberg/software/modulefiles/compilers/intel/17.0.0>` should be installed as ``/usr/local/modulefiles/compilers/intel/17.0.0``.
    * The :download:`DAAL modulefile </iceberg/software/modulefiles/libs/binlibs/intel-daal/2017.0>` should be installed as ``/usr/local/modulefiles/libs/binlibs/intel-daal/2017.0``.
    * The :download:`IPP modulefile </iceberg/software/modulefiles/libs/binlibs/intel-ipp/2017.0>` should be installed as ``/usr/local/modulefiles/libs/binlibs/intel-ipp/2017.0``.
    * The :download:`MKL modulefile </iceberg/software/modulefiles/libs/binlibs/intel-mkl/2017.0>` should be installed as ``/usr/local/modulefiles/libs/binlibs/intel-mkl/2017.0``.
    * The :download:`TBB modulefile </iceberg/software/modulefiles/libs/binlibs/intel-tbb/2017.0>` should be installed as ``/usr/local/modulefiles/libs/binlibs/intel-tbb/2017.0``.
    * See the (TCL) modulefiles for details of how they were derived from Intel-supplied environment-manipulating shell scripts.

#. Check that licensing is working by activating the Intel Compilers modulefile
   then try compiling `a trivial C program
   <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using :ref:`the
   icc compiler <iceberg_intel_compilers>`.

