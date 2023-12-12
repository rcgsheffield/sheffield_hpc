.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _gdal_sharc:

Geospatial Data Abstraction Library (GDAL)
==========================================

.. sidebar:: GDAL

   :Latest version: 2.2.0,3.0.1,3.3.1
   :URL: http://www.gdal.org/

GDAL is a library used by many Geographic Information Systems (GIS) packages for converting 
between many different raster and vector GIS data formats.  It also includes command-line 
utilities for data translation and processing.  It is released under an an X/MIT style Open 
Source license by the `Open Source Geospatial Foundation <http://www.osgeo.org/>`_.

-------

Usage
-----

Load by running one of the following ::

    module load libs/gdal/2.2.0/gcc-6.2
    module load libs/gdal/3.0.1/gcc-8.2-cmake-3.17.1
    module load libs/gdal/3.3.1/gcc-8.2-cmake-3.17.1

This will:

* add several GDAL programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the GDAL library
* activate the mentioned versions of the GCC/CMake compiler suites (as its C++ standard library 
  is required by GDAL)

You can run ``gdal-config --version`` to test that you are running the required version ::

    $ gdal-config --version
    2.2.0

The command-line programs that GDAL provides are:

* ``gdaladdo``
* ``gdalbuildvrt``
* ``gdal-config``
* ``gdal_contour``
* ``gdaldem``
* ``gdalenhance``
* ``gdal_grid``
* ``gdalinfo``
* ``gdallocationinfo``
* ``gdalmanage``
* ``gdal_rasterize``
* ``gdalserver``
* ``gdalsrsinfo``
* ``gdaltindex``
* ``gdaltransform``
* ``gdal_translate``
* ``gdalwarp``
* ``nearblack``
* ``ogr2ogr``
* ``ogrinfo``
* ``ogrlineref``
* ``ogrtindex``
* ``testepsg``

The ``gdal...`` utilities are mostly for processing raster GIS data formats, 
whilst the ``ogr...`` utilities are for processing vector GIS data formats.

-------

Documentation
-------------
Standard ``man`` pages are available for the provided commands/functions.

These can be viewed using e.g. ::

    $ man gdal_contour

Much more information is available on the `project site <http://www.gdal.org/>`_.

-------

Supported file formats
----------------------

GDAL has been compiled on this system with support for only a limited set of GIS data formats.  
See **Installation notes** below for a list of those provided by each available version of GDAL.

-------

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 3.3.1**

GDAL 3.3.1 was compiled with v8.2.0 of the GCC compiler suite. This was installed using the 
:download:`install_gdal.sh </decommissioned/sharc/software/install_scripts/libs/gdal/install_gdal.sh>`
script. This script will automatically install GDAL, generate the module file and correct the file 
permissions as needed. Build logs are also automatically generated and copied to the base install 
directory or src directory.

The additional **GPKG** and **SQlite** drivers are added via the loading of the SQLite module and manual specification 
of the SQLite root directory for the ``./configure`` step.

The **file formats** and **drivers** supported by this build are listed in the compilation log files which can be found 
in the module top level directory. e.g. ``gdal-install.o1234567``

**Version 3.0.1**

GDAL 3.0.1 was compiled with v8.2.0 of the GCC compiler suite. This was installed using the 
:download:`install_gdal.sh </decommissioned/sharc/software/install_scripts/libs/gdal/install_gdal.sh>`
script. This script will automatically install GDAL, generate the module file and correct the file 
permissions as needed. Build logs are also automatically generated and copied to the base install 
directory or src directory.

The additional **GPKG** and **SQlite** drivers are added via the loading of the SQLite module and manual specification 
of the SQLite root directory for the ``./configure`` step.

The **file formats** and **drivers** supported by this build are listed in the compilation log files which can be found 
in the module top level directory. e.g. ``gdal-install.o1234567``

**Version 2.2.0**

GDAL 2.2.0 was compiled with v4.9.4 of the GCC compiler suite.

#. Download, configure, build and install by switching to a scratch directory and running 
   :download:`this script </decommissioned/sharc/software/install_scripts/libs/gdal/2.2.0/gcc-4.9.4/install.sh>`, 
   ensuring that all stderr and stdout is redirected to :download:`a log file </decommissioned/sharc/software/install_scripts/libs/gdal/2.2.0/gcc-4.9.4/install.log>`. 
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/gdal/2.2.0/gcc-4.9.4>` as 
   ``/usr/local/modulefiles/libs/gdal/2.2.0/gcc-4.9.4``

The **file formats** supported by this build are listed in the compilation log files which can be found 
in the module top level directory.

