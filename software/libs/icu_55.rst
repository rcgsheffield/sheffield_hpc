.. index::
    single: ICU

icu - International Components for Unicode
==========================================

.. sidebar:: icu version 55

   :Version: 55
   :Support Level: Bronze
   :Dependancies: compilers/gcc/4.8.2
   :URL: http://site.icu-project.org/
   :Location: /usr/local/packages6/libs/gcc/4.8.2/icu/55 

ICU is the premier library for software internationalization, used by a wide array of companies and organizations

Usage
-----
This build of the icu library requires gcc version 4.8.2. To make the compiler and library available, run the following module commands

.. code-block:: none

        module load compilers/gcc/4.8.2
        module load libs/gcc/4.8.2/icu/55

Installation Notes
------------------
This section is primarily for administrators of the system.

Icu 55 is a pre-requisite for the version of boost required for an experimental R module used by one of our users.

.. code-block:: none

    module load compilers/gcc/4.8.2
    tar -xvzf icu4c-55_1-src.tgz
    cd icu/source
    ./runConfigureICU Linux/gcc --prefix=/usr/local/packages6/libs/gcc/4.8.2/icu/55/
    make

Testing
-------
`make check`

Last few lines of output were

.. code-block:: none

   [All tests passed successfully...]
    Elapsed Time: 00:00:00.086
    make[2]: Leaving directory `/home/fe1mpc/icu/icu/source/test/letest'
    ---------------
    ALL TESTS SUMMARY:
    All tests OK:  testdata intltest iotest cintltst letest
    make[1]: Leaving directory `/home/fe1mpc/icu/icu/source/test'
    make[1]: Entering directory `/home/fe1mpc/icu/icu/source'
    verifying that icu-config --selfcheck can operate
    verifying that make -f Makefile.inc selfcheck can operate
    PASS: config selfcheck OK
    rm -rf test-local.xml

Module File
-----------
Module File Location: `/usr/local/modulefiles/libs/gcc/4.8.2/icu/55`

.. code-block:: none

        #%Module1.0#####################################################################
        ##
        ## icu 55 module file
        ##

        ## Module file logging
        source /usr/local/etc/module_logging.tcl
        ##


        proc ModulesHelp { } {
                puts stderr "Makes the icu library available"
        }

        set ICU_DIR /usr/local/packages6/libs/gcc/4.8.2/icu/55

        module-whatis   "Makes the icu library available"

        prepend-path LD_LIBRARY_PATH $ICU_DIR/lib
        prepend-path LIBRARY_PATH $ICU_DIR/lib
        prepend-path CPLUS_INCLUDE_PATH $ICU_DIR/include

