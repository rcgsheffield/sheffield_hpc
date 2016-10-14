.. _gdal_iceberg:

Geospatial Data Abstraction Library (GDAL)
==========================================

.. sidebar:: GDAL

   :Latest version: 2.1.1
   :URL: http://www.gdal.org/

GDAL is a library used by many Geographic Information Systems (GIS) packages for converting between many different raster and vector GIS data formats.  It also includes command-line utilities for data translation and processing.  It is released under an an X/MIT style Open Source license by the [Open Source Geospatial Foundation](http://www.osgeo.org/).

Usage
-----

By running ::

    $ module load libs/gcc/6.2/proj/2.1.1

you

* add several GDAL programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the GDAL library

You can run ``gdal-config --version`` to test that you are running the required version ::

    $ gdal-config --version
    2.1.1

The command-line programs that GDAL provides are ::
    $ gdaladdo
    $ gdalbuildvrt
    $ gdal-config
    $ gdal_contour
    $ gdaldem
    $ gdalenhance
    $ gdal_grid
    $ gdalinfo
    $ gdallocationinfo
    $ gdalmanage
    $ gdal_rasterize
    $ gdalserver
    $ gdalsrsinfo
    $ gdaltindex
    $ gdaltransform
    $ gdal_translate
    $ gdalwarp
    $ nearblack
    $ ogr2ogr
    $ ogrinfo
    $ ogrlineref
    $ ogrtindex
    $ testepsg

The ``gdal...`` utilities are mostly for processing raster GIS data formats, whilst the ``ogr...`` utilities are for processing vector GIS data formats.

Documentation
-------------
Standard ``man`` pages are available for the provided commands/functions.

These can be viewed using e.g. ::

    $ man gdal_contour

Much more information is available on the `project site <http://www.gdal.org/>`_.

Supported file formats
----------------------

GDAL has been compiled on this system with support for only a limited set of GIS data formats.  See **Installation notes** below for a list of those provided by each available version of GDAL.

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 2.1.1**

GDAL 2.1.1 was compiled with v6.2.0 of the GCC compiler suite.

#. ``cd`` to a scratch directory.
#. Download, build and install GDAL using `install_gdal_2.1.1.sh <https://github.com/mikecroucher/HPC_Installers/blob/master/libs/gdal/2.1.1/sheffield/iceberg/install_gdal_2.1.1.sh>`_, ensuring that all output is redirected into a log file.  GDAL files are installed into ``/usr/local/packages6/libs/gcc/6.2/gdal/2.1.1/``
#. Install `this modulefile <https://github.com/mikecroucher/HPC_Installers/blob/master/libs/gdal/2.1.1/sheffield/iceberg/gdal_2.1.1_modulefile>`_ as ``/usr/local/modulefiles/libs/gcc/6.2/gdal/2.1.1``

The **file formats** supported by the build generated using ``install_gdal_2.1.1.sh`` are listed `here <https://github.com/mikecroucher/HPC_Installers/blob/master/libs/gdal/2.1.1/sheffield/iceberg/install_gdal_2.1.1_configure_output.log>`_.
