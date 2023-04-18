.. _gdal_stanage:

Geospatial Data Abstraction Library (GDAL)
==========================================

.. sidebar:: GDAL

   :Latest version: 3.2.1,3.3.2
   :URL: http://www.gdal.org/

GDAL is a library used by many Geographic Information Systems (GIS) packages for converting 
between many different raster and vector GIS data formats.  It also includes command-line 
utilities for data translation and processing.  It is released under an an X/MIT style Open 
Source license by the `Open Source Geospatial Foundation <http://www.osgeo.org/>`_.

-------

Usage
-----

Load by running ::

    module load GDAL/3.2.1-foss-2020b
    
This will:

* add several GDAL programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the GDAL library
* activate the modules associated with the specific :ref:`foss toolchain <stanage_eb_toolchains>`

You can run ``gdal-config --version`` to test that you are running the required version ::

    $ gdal-config --version
    3.3.2

Some commonly used command-line programs that GDAL provides are:

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
.. sweep - manuals not currently available
    Standard ``man`` pages are available for the provided commands/functions.

    These can be viewed using e.g. ::

        $ man gdal_contour

    Much more information is available on the `project site <http://www.gdal.org/>`_.

Documentation is available on the `project site <http://www.gdal.org/>`_.

-------

.. sweep Supported file formats
    ----------------------
    
    GDAL has been compiled on this system with support for only a limited set of GIS data formats.  
    See **Installation notes** below for a list of those provided by each available version of GDAL.
    
    -------

Installation notes
------------------
This section is primarily for administrators of the system. GDAL has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTGDAL/easybuild`` with a given module loaded.

