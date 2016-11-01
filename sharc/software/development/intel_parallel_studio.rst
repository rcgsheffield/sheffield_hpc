.. _sharc_intel_parallel_studio:

Intel Parallel Studio
=====================

Intel Parallel Studio XE is a software development suite that helps boost application performance by taking advantage of the ever-increasing processor core count and vector register width available in Intel Xeon processors and other compatible processors.  
Its core components are compilers and libraries for fast linear algebra, data transformation and parallelisation.

Composer Edition 2017
---------------------

This includes:

* Intel C++ and Fortran compilers: these help create C, C++ and Fortran applications that "can take full advantage of the advanced hardware capabilities available in Intel processors and co-processors. They also simplify that development by providing high level parallel models and built-in features like explicit vectorization and optimization reports".
* Math Kernel Library (MKL): This library provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. Utilizes de facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.
* Threading Building Blocks (TBB): lets you write "parallel C++ programs that take full advantage of multicore performance, that are portable and composable, and that have future-proof scalability."
* Integrated Performance Primitives (IPP): "high-quality, production-ready, low-level building blocks for image processing, signal processing, and data processing (data compression/decompression and cryptography) applications."
* Data Analytics Acceleration Library (DAAL): functions for Data Analysis (Characterization, Summarization, and Transformation) and Machine Learning (Regression, Classification, and More).

It does not include Intel's MPI implementation.  See `Intel's site <https://software.intel.com/en-us/intel-parallel-studio-xe/details>`_ for further details of what Parallel Studio Composer Edition includes.

Licensing and availability
--------------------------

Some components of Parallel Studio are freely available for those only wanting community support; other components, such as the compilers are commercial software. 

The University has purchased a number of Intel-supported licenses for Parallel Studio Composer Edition products.  These can be accessed by (and are shared between) the University's HPC clusters and researchers' own machines.  

Installation Notes
------------------

The following notes are primarily for system administrators.

**Parallel Studio XE Composer Edition 2017.0**

#. Download ``parallel_studio_xe_2017_composer_edition.tgz`` from the Intel Portal, save in ``/usr/local/media/protected/intel/2017.0/`` then make it only readable by the ``app-admins`` group.
#. Ensure details of the Intel license server are in the file ``/usr/local/packages/dev/intel-pe-xe-ce/license.lic``
#. Run `install_intel-ps-xe-ce_2017.0.sh <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/install_scripts/dev/intel-ps-xe-ce/2017.0/install_intel-ps-xe-ce_2017.0.sh>`__.  This installs Parallel Studio into ``/usr/local/packages/dev/intel-pe-xe-ce/2017.0/binary/``.  Products are activated using the aforementioned license file during the installation process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.  These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the location of the aforementioned license file and set other environment variables required by the different Parallel Studio products.  There is one modulefile for all Parallel Studio software and other modulefiles for specific products.  
    * `The Compilers modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/dev/intel-compilers/17.0.0>`__ should be installed as ``/usr/local/modulefiles/dev/intel-compilers/17.0.0``.
    * `The DAAL modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-daal/2017.0>`__ should be installed as ``/usr/local/modulefiles/libs/intel-daal/2017.0/binary``.
    * `The IPP modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-ipp/2017.0>`__ should be installed as ``/usr/local/modulefiles/libs/intel-ipp/2017.0/binary``.
    * `The MKL modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-mkl/2017.0>`__ should be installed as ``/usr/local/modulefiles/libs/intel-mkl/2017.0/binary``.
    * `The TBB modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-tbb/2017.0>`__ should be installed as ``/usr/local/modulefiles/libs/intel-tbb/2017.0/binary``.
#. Check that licensing is working by activating the Intel Compilers modulefile then try compiling `a trivial C program <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using the ``icc`` compiler.

TODO: 

* add notes on how created modulefiles
