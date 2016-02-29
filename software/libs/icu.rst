icu - International Components for Unicode
==========================================

.. sidebar:: icu

   :Latest Version: 55
   :URL: http://site.icu-project.org/

ICU is the premier library for software internationalization, used by a wide array of companies and organizations

Usage
-----
Version 55 of the icu library requires gcc version 4.8.2. To make the compiler and library available, run the following module commands ::

        module load compilers/gcc/4.8.2
        module load libs/gcc/4.8.2/icu/55

Version 42 of the icu library uses gcc version 4.4.7 which is the default on Iceberg. To make the library available, run the following command ::

        module load libs/gcc/4.4.7/icu/42

Installation Notes
------------------
This section is primarily for administrators of the system.

**Version 55**

Icu 55 is a pre-requisite for the version of boost required for an experimental R module used by one of our users. ::

    module load compilers/gcc/4.8.2
    tar -xvzf icu4c-55_1-src.tgz
    cd icu/source
    ./runConfigureICU Linux/gcc --prefix=/usr/local/packages6/libs/gcc/4.8.2/icu/55/
    make

**Version 42**

Icu version 42 was originally installed as a system RPM. This install moved icu to a module-based install ::

        tar -xvzf icu4c-4_2_1-src.tgz
        cd icu/source/
        ./runConfigureICU Linux/gcc --prefix=/usr/local/packages6/libs/gcc/4.4.7/icu/42
        make
        make install

Testing
-------
**Version 55**

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

**Version 42**

`make check`

Last few lines of output were

.. code-block:: none

        All tests passed successfully...]
        Elapsed Time: 00:00:12.000
        make[2]: Leaving directory `/home/fe1mpc/icu/source/test/cintltst'
        ---------------
        ALL TESTS SUMMARY:
        ok:  testdata iotest cintltst
        ===== ERRS:  intltest
        make[1]: *** [check-recursive] Error 1
        make[1]: Leaving directory `/home/fe1mpc/icu/source/test'
        make: *** [check-recursive] Error 2

The error can be ignored since it is a bug in the test itself:

- http://sourceforge.net/p/icu/mailman/message/32443311/

Module Files
------------
**Version 55**
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

**Version 42**
Module File Location: :code:`/usr/local/modulefiles/libs/gcc/4.4.7/icu/42`

.. code-block:: none

        #%Module1.0#####################################################################
        ##
        ## icu 42 module file
        ##

        ## Module file logging
        source /usr/local/etc/module_logging.tcl
        ##


        proc ModulesHelp { } {
                puts stderr "Makes the icu library available"
        }

        set ICU_DIR /usr/local/packages6/libs/gcc/4.4.7/icu/42

        module-whatis   "Makes the icu library available"

        prepend-path LD_LIBRARY_PATH $ICU_DIR/lib
        prepend-path LIBRARY_PATH $ICU_DIR/lib
        prepend-path CPLUS_INCLUDE_PATH $ICU_DIR/include
