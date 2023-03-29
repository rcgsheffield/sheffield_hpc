.. _proj_stanage:

PROJ
====

.. sidebar:: PROJ

   :Versions: 9.1.1, 8.1.0, 7.2.1
   :URL: https://github.com/OSGeo/proj

PROJ consists of programs and a library for managing cartographic projections.

Usage
-----

By running one of the following ::
        
        module load PROJ/7.2.1-GCCcore-10.2.0
        module load PROJ/8.1.0-GCCcore-11.2.0
        module load PROJ/9.1.1-GCCcore-12.2.0


you

* add several PROJ programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the PROJ library
* activate version 10.2.0 of the GCC compiler (as its C++ standard library is required when using PROJ.7)
* activate version 11.2.0 of the GCC compiler (as its C++ standard library is required when using PROJ.8)
* activate version 12.2.0 of the GCC compiler (as its C++ standard library is required when using PROJ.9)

You can run ``proj`` to test that you are running the required version ::

    $ proj 
    Rel. 9.1.1, December 1st, 2022
    usage: proj [-bdeEfiIlmorsStTvVwW [args]] [+opt[=arg] ...] [file ...]

Documentation
-------------
Standard ``man`` pages are available for the provided commands/functions ``cs2cs``, ``geod``, ``proj``, ``geodesic`` and ``pj_init``.

These can be viewed using e.g. ::

    $ man proj

Installation notes
------------------

This section is primarily for administrators of the system. PROJ has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTPROJ/easybuild`` with a given module loaded.
