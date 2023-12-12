.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _proj_sharc:

PROJ.7
======

.. sidebar:: PROJ.7

   :Versions: 7.1.0, 4.9.3
   :URL: https://github.com/OSGeo/proj

PROJ consists of programs and a library for managing cartographic projections.

Usage
-----

By running ::

    $ module load libs/proj/4.9.3/gcc-4.9.4
    or,
    $ module load libs/proj/7.1.0/gcc-8.2.0

you

* add several PROJ programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the PROJ library
* activate version 4.9.4 of the GCC compiler (as its C++ standard library is required when using PROJ.4)
* activate version 8.2.0 of the GCC compiler (as its C++ standard library is required when using PROJ.7)

You can run ``proj`` to test that you are running the required version ::

    $ proj 
    Rel. 4.9.3, 15 August 2016
    usage: proj [ -bCeEfiIlormsStTvVwW [args] ] [ +opts[=arg] ] [ files ]

Documentation
-------------
Standard ``man`` pages are available for the provided commands/functions ``cs2cs``, ``geod``, ``proj``, ``geodesic`` and ``pj_init``.

These can be viewed using e.g. ::

    $ man proj

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 4.9.3**

PROJ.4 4.9.3 was compiled with v4.9.4 of the GCC compiler suite.

#. ``cd`` to a scratch directory.
#. Download, build and install using :download:`this script </decommissioned/sharc/software/install_scripts/libs/proj/4.9.3/gcc-4.9.4/install.sh>`, ensuring that all stderr and stdout is redirected to :download:`a log file </decommissioned/sharc/software/install_scripts/libs/proj/4.9.3/gcc-4.9.4/install.log>`. 
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/proj/4.9.3/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/proj/4.9.3/gcc-4.9.4``

Test by running ``make check`` from the build directory.  For this build this yielded: ::

    ============================================                                                             
    Running ../nad/test27 using ../src/proj:            
    ============================================                                                             
    doing tests into file proj_out27, please wait       
    diff proj_out27 with pj_out27.dist
    TEST OK
    test file proj_out27 removed

    ../nad/test83 ../src/proj
    ============================================
    Running ../nad/test83 using ../src/proj:
    ============================================
    doing tests into file proj_out83, please wait
    diff proj_out83 with pj_out83.dist
    TEST OK
    test file proj_out83 removed

    PROJ_LIB=. ../nad/testvarious ../src/cs2cs
    Using locale with comma as decimal separator
    ============================================
    Running ../nad/testvarious using ../src/cs2cs:
    ============================================
    doing tests into file tv_out, please wait
    Rel. 4.9.3, 15 August 2016
    <lt-cs2cs>: while processing file: <stdin>, line 1
    pj_transform(): invalid x or y
    Rel. 4.9.3, 15 August 2016
    <lt-cs2cs>: while processing file: <stdin>, line 2
    pj_transform(): acos/asin: |arg| >1.+1e-14
    diff tv_out with tv_out.dist
    TEST OK
    test file tv_out removed

**Version 7.1.0**

PROJ 7.1.0 was compiled with v8.2.0 of the GCC compiler suite.

#. Download, configure, build and install by switching to a scratch directory and running :download:`this script </decommissioned/sharc/software/install_scripts/libs/proj/7.1.0/gcc-8.2.0/install.sh>`
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/proj/7.1.0/gcc-8.2.0>` as ``/usr/local/modulefiles/libs/proj/7.1.0/gcc-8.2.0``


