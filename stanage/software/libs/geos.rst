.. _geos_stanage:

geos
====

.. sidebar:: geos

   :Version: 3.9.1
   :URL: http://trac.osgeo.org/geos/

GEOS (Geometry Engine, Open Source) is a C/C++ port of a subset of 
the `Java Topology Suite <http://locationtech.github.io/jts/>`_ (JTS), 
which in turn is a library that:

* Provides an object model for planar geometry together with a set of fundamental geometric functions. 
* JTS conforms to the `Simple Features Specification for SQL <https://www.ogc.org/standard/sfs/>`_ published by the Open GIS Consortium. 
* JTS is designed to be used as a core component of vector-based geomatics software such as geographical information systems. 
* It can also be used as a general-purpose library providing algorithms in computational geometry. 

.. caution::

    GEOS is typically loaded as an external dependency for R. Please ensure you select the matching 
    GCC compiler versions of your version of R and the GEOS libraries.

--------

Usage
-----

To make this library available, run one of the following: ::

    module load GEOS/3.9.1-GCC-10.2.0
    module load GEOS/3.9.1-GCC-11.2.0    

This also activates the matching version of the GCC compiler suite (as its C++ standard library is required by GEOS.)

--------

The rgeos interface in R
------------------------
rgeos is a CRAN package that provides an R interface to geos. It is not installed in R by default so you need to install a version in your home directory.

After connecting to Stanage (see :ref:`ssh`), start an interactive session (e.g. using the :code:`srun --pty bash -i` command). Run the following module commands ::

    module load R/4.0.5-foss-2020b
    module load GEOS/3.9.1-GCC-10.2.0
    
Launch R and run the command ::

  install.packages('rgeos')

If you’ve never installed an R package before on the system, it will ask you if you want to install to a personal library. Answer ``y`` to any questions you are asked.

The library will be installed to a sub-directory called ``R`` in your home directory and you should only need to perform the above procedure once.

Once you have performed the installation, you will only need to run the ``module`` commands above to make the geos library available to the system. Then, you use ``rgeos`` as you would any other library in R ::

    library('rgeos')

--------

Installation notes
------------------
This section is primarily for administrators of the system. GEOS has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTGEOS/easybuild`` with a given module loaded.

Testing
-------

Create a file called ``geos_hello_world.c`` with the following content (`source <https://libgeos.org/usage/c_api/>`_)::
    
    #include <stdio.h>  /* for printf */
    #include <stdarg.h> /* for va_list */

    /* Only the CAPI header is required */
    #include <geos_c.h>

    static void
    geos_msg_handler(const char* fmt, ...)
    {
        va_list ap;
        va_start(ap, fmt);
        vprintf (fmt, ap);
        va_end(ap);
    }

    int main()
    {
        /* Send notice and error messages to the terminal */
        initGEOS(geos_msg_handler, geos_msg_handler);

        /* Read WKT into geometry object */
        GEOSWKTReader* reader = GEOSWKTReader_create();
        GEOSGeometry* geom_a = GEOSWKTReader_read(reader, "POINT(1 1)");

        /* Convert result to WKT */
        GEOSWKTWriter* writer = GEOSWKTWriter_create();
        char* wkt = GEOSWKTWriter_write(writer, geom_a);
        printf("Geometry: %s\n", wkt);

        /* Clean up allocated objects */
        GEOSWKTReader_destroy(reader);
        GEOSWKTWriter_destroy(writer);
        GEOSGeom_destroy(geom_a);
        GEOSFree(wkt);

        /* Clean up the global context */
        finishGEOS();
        return 0;
    }

Next compile the ``geos_hello_world.c`` file::
    
    $ cc geos_hello_world.c -o geos_hello_world -l geos_c
    $ ./geos_hello_world

Output should look like this::

    Geometry: POINT (1.0000000000000000 1.0000000000000000)
