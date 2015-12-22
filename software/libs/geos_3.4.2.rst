.. index::
    single: geos

.. _geos:

geos
====

.. sidebar:: geos

   :Version: 3.4.2
   :Support Level: Bronze
   :Dependancies: compilers/gcc/4.8.2
   :URL: http://trac.osgeo.org/geos/
   :Location: /usr/local/packages6/libs/gcc/4.8.2/geos/3.4.2

GEOS - Geometry Engine, Open Source

Usage
-----
To make this library available, run the following module commands

.. code-block:: none

    module load compilers/gcc/4.8.2
    module load libs/gcc/4.8.2/geos/3.4.2

We load version 4.8.2 of gcc since gcc 4.8.2 was used to build this version of geos.

The rgeos interface in R
------------------------
rgeos is a CRAN package that provides an R interface to geos. It is not installed in R by default so you need to install a version in your home directory.

After connecting to iceberg (see :ref:`ssh`), start an interactive sesssion with the :code:`qrsh` or :code:`qsh` command. Run the following module commands ::

    module load apps/R/3.2.0
    module load compilers/gcc/4.8.2
    module load libs/gcc/4.8.2/geos/3.4.2

Launch R and run the command ::

  install.packages('rgeos')

If you’ve never installed an R package before on the system, it will ask you if you want to install to a personal library. Answer ``y`` to any questions you are asked.

The library will be installed to a sub-directory called ``R`` in your home directory and you should only need to perform the above procedure once.

Once you have performed the installation, you will only need to run the ``module`` commands above to make the geos library available to the system. Then, you use ``regos`` as you would any other library in R ::

    library('rgeos')

Installation notes
------------------
This section is primarily for administrators of the system.

.. code-block:: none

    qrsh
    tar -xvjf ./geos-3.4.2.tar.bz2
    cd geos-3.4.2
    mkdir -p /usr/local/packages6/libs/gcc/4.8.2/geos/3.4.2
    module load compilers/gcc/4.8.2
    ./configure prefix=/usr/local/packages6/libs/gcc/4.8.2/geos/3.4.2

Potentially useful output at the end of the configure run ::

    Swig: false
    Python bindings: false
    Ruby bindings: false
    PHP bindings: false

Once the configuration was complete, I did ::

	make
	make install

Testing
-------

Compile and run the test-suite with ::

  make check

All tests passed.

Module File
-----------
Module File Location: ``/usr/local/modulefiles/libs/gcc/4.8.2/geos/3.4.2``

.. code-block:: none

    more /usr/local/modulefiles/libs/gcc/4.8.2/geos/3.4.2
    #%Module1.0#####################################################################
    ##
    ## geos 3.4.2 module file
    ##

    ## Module file logging
    source /usr/local/etc/module_logging.tcl
    ##

    proc ModulesHelp { } {
            puts stderr "Makes the geos 3.4.2 library available"
    }

    set GEOS_DIR /usr/local/packages6/libs/gcc/4.8.2/geos/3.4.2

    module-whatis   "Makes the geos 3.4.2 library available"

    prepend-path LD_LIBRARY_PATH $GEOS_DIR/lib
    prepend-path PATH $GEOS_DIR/bin
