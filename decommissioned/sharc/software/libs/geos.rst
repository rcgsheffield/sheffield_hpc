.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _geos_sharc:

geos
====

.. sidebar:: geos

   :Version: 3.6.1
   :URL: http://trac.osgeo.org/geos/

GEOS (Geometry Engine, Open Source) is a C/C++ port of a subset of 
the `Java Topology Suite <http://locationtech.github.io/jts/>`_ (JTS), 
which in turn is a library that:

* Provides an object model for planar geometry together with a set of fundamental geometric functions. 
* JTS conforms to the `Simple Features Specification for SQL <http://www.opengeospatial.org/standards/sfs>`_ published by the Open GIS Consortium. 
* JTS is designed to be used as a core component of vector-based geomatics software such as geographical information systems. 
* It can also be used as a general-purpose library providing algorithms in computational geometry. 

.. caution::

    GEOS is typically loaded as an external dependency for R. Please ensure you select the matching 
    GCC compiler versions of your version of R and the GEOS libraries.

--------

Usage
-----

To make this library available, run one of the following: ::

    module load libs/geos/3.6.1/gcc-4.9.4
    module load libs/geos/3.6.1/gcc-8.2    

This also activates the matching version of the GCC compiler suite (as its C++ standard library is required by GEOS.)

--------

The rgeos interface in R
------------------------
rgeos is a CRAN package that provides an R interface to geos. It is not installed in R by default so you need to install a version in your home directory.

After connecting to ShARC (see :ref:`ssh`), start an interactive session (e.g. using the :code:`qrshx` command). Run the following module commands ::

    module load apps/R/3.2.0
    module load compilers/gcc/4.8.2
    module load libs/gcc/4.8.2/geos/3.6.1

Launch R and run the command ::

  install.packages('rgeos')

If you’ve never installed an R package before on the system, it will ask you if you want to install to a personal library. Answer ``y`` to any questions you are asked.

The library will be installed to a sub-directory called ``R`` in your home directory and you should only need to perform the above procedure once.

Once you have performed the installation, you will only need to run the ``module`` commands above to make the geos library available to the system. Then, you use ``rgeos`` as you would any other library in R ::

    library('rgeos')

--------

Installation notes
------------------
This section is primarily for administrators of the system.

Version 3.6.1
^^^^^^^^^^^^^

GEOS 3.6.1 was compiled with 4.9.4 and 8.2.0 versions of the GCC compiler suite.

**GCC version 8.2.0**

#. Download, configure, build, test and install Qsub submitting :download:`this script </decommissioned/sharc/software/install_scripts/libs/geos/3.6.1/gcc-8.2/install_geos.sh>`.
#. The installer script automatically creates a module file and logs.

**GCC version 4.9.4**

#. Download, configure, build, test and install using :download:`this script </decommissioned/sharc/software/install_scripts/libs/geos/3.6.1/gcc-4.9.4/install.sh>`, ensuring that all stderr and stdout is redirected to :download:`a log file </decommissioned/sharc/software/install_scripts/libs/geos/3.6.1/gcc-4.9.4/install.log>`. 
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/geos/3.6.1/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/geos/3.6.1/gcc-4.9.4``

Potentially useful output at the end of the configure run ::

    Swig: false
    Python bindings: false
    Ruby bindings: false

The build was tested by running ``make check`` from the build directory: ::

    # TOTAL: 1
    # PASS:  1
    # SKIP:  0
    # XFAIL: 0
    # FAIL:  0
    # XPASS: 0

