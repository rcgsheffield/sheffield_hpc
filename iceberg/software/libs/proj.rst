.. _proj_iceberg:

PROJ.4
======

.. sidebar:: PROJ.4

   :Latest version: 4.9.3
   :URL: https://github.com/OSGeo/proj.4

PROJ.4 consists of programs and a library for managing cartographic projections.

Usage
-----

By running ::

    $ module load libs/gcc/6.2/proj/4.9.3

you

* add several PROJ.4 programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the PROJ.4 library

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

PROJ.4 4.9.3 was compiled with v6.2.0 of the GCC compiler suite.

#. ``cd`` to a scratch directory.
#. Download, build and install PROJ.4 using `install_proj_4.9.3.sh <https://github.com/mikecroucher/HPC_Installers/blob/master/libs/proj/4.9.3/sheffield/iceberg/install_proj_4.9.3.sh>`_.  Files are installed into ``/usr/local/packages6/libs/gcc/6.2/proj/4.9.3/``
#. Install `this modulefile <https://github.com/mikecroucher/HPC_Installers/blob/master/libs/proj/4.9.3/sheffield/iceberg/proj_4.9.3_modulefile>`_ as ``/usr/local/modulefiles/libs/gcc/6.2/proj/4.9.3``
