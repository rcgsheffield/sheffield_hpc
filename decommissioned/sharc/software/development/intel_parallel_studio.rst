.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc-intel-parallel-studio:

Intel Parallel Studio
=====================

Intel Parallel Studio XE Composer Edition is a software development suite that helps boost application performance by taking advantage of the ever-increasing processor core count and vector register width available in Intel Xeon processors and other compatible processors.  
Its core components are compilers and libraries for fast linear algebra, data transformation and parallelisation.

The suite includes:

* :ref:`Intel C++ and Fortran compilers <sharc-intel-compilers>`: these help create C, C++ and Fortran applications that "can take full advantage of the advanced hardware capabilities available in Intel processors and co-processors. They also simplify that development by providing high level parallel models and built-in features like explicit vectorization and optimization reports".
* :ref:`Data Analytics Acceleration Library (DAAL) <sharc-intel-daal>`: functions for data analysis (characterization, summarization, and transformation) and Machine Learning (regression, classification, and more). Only available in >=2017 version of Parallel Studio.
* :ref:`Math Kernel Library (MKL) <sharc-intel-mkl>`: This library provides highly optimized, threaded and vectorized functions to maximize performance on each processor family. Utilizes de facto standard C and Fortran APIs for compatibility with BLAS, LAPACK and FFTW functions from other math libraries.
* :ref:`Integrated Performance Primitives (IPP) <sharc-intel-ipp>`: "high-quality, production-ready, low-level building blocks for image processing, signal processing, and data processing (data compression/decompression and cryptography) applications."
* :ref:`Threading Building Blocks (TBB) <sharc-intel-tbb>`: lets you write "parallel C++ programs that take full advantage of multicore performance, that are portable and composable, and that have future-proof scalability."

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

Parallel Studio XE Composer Edition 2019.3
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Download ``parallel_studio_xe_2019_update3_composer_edition.tgz`` from the Intel
   Portal, save in ``/usr/local/media/protected/intel/2019.3/`` then make it
   only readable by the ``hpc_app-admins`` group.
#. Ensure details of the Intel license server are in the file
   ``/usr/local/packages/dev/intel-pe-xe-ce/license.lic``
#. Run :download:`this script
   </decommissioned/sharc/software/install_scripts/dev/intel-ps-xe-ce/2019.3/install.sh>`.
   This installs Parallel Studio into
   ``/usr/local/packages/dev/intel-pe-xe-ce/2019.3/binary/``.  Products are
   activated using the aforementioned license file during the installation
   process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.
   These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the
   location of the aforementioned license file and set other environment
   variables required by the different Parallel Studio products.  There is one
   modulefile for all Parallel Studio software and other modulefiles for
   specific products.  

    * The :download:`Compilers modulefile </decommissioned/sharc/software/modulefiles/dev/intel-compilers/19.0.3>` should be installed as ``/usr/local/modulefiles/dev/intel-compilers/19.0.3``.
    * The :download:`DAAL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-daal/2019.3/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-daal/2019.3/binary``.
    * The :download:`IPP modulefile </decommissioned/sharc/software/modulefiles/libs/intel-ipp/2019.3/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-ipp/2019.3/binary``.
    * The :download:`MKL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2019.3/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-mkl/2019.3/binary``.
    * The :download:`TBB modulefile </decommissioned/sharc/software/modulefiles/libs/intel-tbb/2019.3/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-tbb/2019.3/binary``.
    * See the (TCL) modulefiles for details of how they were derived from Intel-supplied environment-manipulating shell scripts.

#. Check that licensing is working by activating the Intel Compilers modulefile
   then try compiling `a trivial C program
   <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using the
   ``icc`` compiler.

Parallel Studio XE Composer Edition 2017.0
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Download ``parallel_studio_xe_2017_composer_edition.tgz`` from the Intel
   Portal, save in ``/usr/local/media/protected/intel/2017.0/`` then make it
   only readable by the ``app-admins`` group.
#. Ensure details of the Intel license server are in the file
   ``/usr/local/packages/dev/intel-pe-xe-ce/license.lic``
#. Run :download:`this script
   </decommissioned/sharc/software/install_scripts/dev/intel-ps-xe-ce/2017.0/install.sh>`.
   This installs Parallel Studio into
   ``/usr/local/packages/dev/intel-pe-xe-ce/2017.0/binary/``.  Products are
   activated using the aforementioned license file during the installation
   process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.
   These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the
   location of the aforementioned license file and set other environment
   variables required by the different Parallel Studio products.  There is one
   modulefile for all Parallel Studio software and other modulefiles for
   specific products.  

    * The :download:`Compilers modulefile </decommissioned/sharc/software/modulefiles/dev/intel-compilers/17.0.0>` should be installed as ``/usr/local/modulefiles/dev/intel-compilers/17.0.0``.
    * The :download:`DAAL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-daal/2017.0/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-daal/2017.0/binary``.
    * The :download:`IPP modulefile </decommissioned/sharc/software/modulefiles/libs/intel-ipp/2017.0/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-ipp/2017.0/binary``.
    * The :download:`MKL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2017.0/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-mkl/2017.0/binary``.
    * The :download:`TBB modulefile </decommissioned/sharc/software/modulefiles/libs/intel-tbb/2017.0/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-tbb/2017.0/binary``.
    * See the (TCL) modulefiles for details of how they were derived from Intel-supplied environment-manipulating shell scripts.

#. Check that licensing is working by activating the Intel Compilers modulefile
   then try compiling `a trivial C program
   <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using the
   ``icc`` compiler.

Parallel Studio XE Composer Edition 2016.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Download ``parallel_studio_xe_2016_composer_edition_update1.tar`` from the Intel
   Portal, save in ``/usr/local/media/protected/intel/2016.1/`` then make it
   only readable by the ``app-admins`` group.
#. Ensure details of the Intel license server are in the file
   ``/usr/local/packages/dev/intel-pe-xe-ce/license.lic``
#. Run :download:`this script
   </decommissioned/sharc/software/install_scripts/dev/intel-ps-xe-ce/2016.1/install.sh>`.
   This installs Parallel Studio into
   ``/usr/local/packages/dev/intel-pe-xe-ce/2016.1/binary/``.  Products are
   activated using the aforementioned license file during the installation
   process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.
   These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the
   location of the aforementioned license file and set other environment
   variables required by the different Parallel Studio products.  There is one
   modulefile for all Parallel Studio software and other modulefiles for
   specific products.  

    * The :download:`Compilers modulefile </decommissioned/sharc/software/modulefiles/dev/intel-compilers/16.0.1>` should be installed as ``/usr/local/modulefiles/dev/intel-compilers/16.0.1``.
    * The :download:`DAAL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-daal/2016.1/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-daal/2016.1/binary``.
    * The :download:`IPP modulefile </decommissioned/sharc/software/modulefiles/libs/intel-ipp/2016.1/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-ipp/2016.1/binary``.
    * The :download:`MKL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2016.1/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-mkl/2016.1/binary``.
    * The :download:`TBB modulefile </decommissioned/sharc/software/modulefiles/libs/intel-tbb/2016.1/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-tbb/2016.1/binary``.
    * See the (TCL) modulefiles for details of how they were derived from Intel-supplied environment-manipulating shell scripts.

#. Check that licensing is working by activating the Intel Compilers modulefile
   then try compiling `a trivial C program
   <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using the
   ``icc`` compiler.

Parallel Studio XE Composer Edition 2015.7
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Download ``l_compxe_2015.7.235.tgz`` from the Intel
   Portal, save in ``/usr/local/media/protected/intel/2015.7/`` then make it
   only readable by the ``app-admins`` group.
#. Ensure details of the Intel license server are in the file
   ``/usr/local/packages/dev/intel-pe-xe-ce/license.lic``
#. Run :download:`this script
   </decommissioned/sharc/software/install_scripts/dev/intel-ps-xe-ce/2015.7/install.sh>`.
   This installs Parallel Studio into
   ``/usr/local/packages/dev/intel-pe-xe-ce/2015.7/binary/``.  Products are
   activated using the aforementioned license file during the installation
   process.
#. Install several modulefiles to locations under ``/usr/local/modulefiles``.
   These modulefiles set the ``INTEL_LICENSE_FILE`` environment variable to the
   location of the aforementioned license file and set other environment
   variables required by the different Parallel Studio products.  There is one
   modulefile for all Parallel Studio software and other modulefiles for
   specific products.  

    * The :download:`Compilers modulefile </decommissioned/sharc/software/modulefiles/dev/intel-compilers/15.0.7>` should be installed as ``/usr/local/modulefiles/dev/intel-compilers/15.0.7``.
    * The :download:`IPP modulefile </decommissioned/sharc/software/modulefiles/libs/intel-ipp/2015.7/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-ipp/2015.7/binary``.
    * The :download:`MKL modulefile </decommissioned/sharc/software/modulefiles/libs/intel-mkl/2015.7/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-mkl/2015.7/binary``.
    * The :download:`TBB modulefile </decommissioned/sharc/software/modulefiles/libs/intel-tbb/2015.7/binary>` should be installed as ``/usr/local/modulefiles/libs/intel-tbb/2015.7/binary``.
    * See the (TCL) modulefiles for details of how they were derived from Intel-supplied environment-manipulating shell scripts.

#. Check that licensing is working by activating the Intel Compilers modulefile
   then try compiling `a trivial C program
   <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ using the
   ``icc`` compiler.

