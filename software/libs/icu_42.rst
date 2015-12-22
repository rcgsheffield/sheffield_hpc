.. index::
    single: ICU

icu - International Components for Unicode
==========================================

.. sidebar:: icu version 42
   
   :Version: 42
   :Support Level: Bronze
   :Dependancies: compilers/gcc/4.4.7
   :URL: http://site.icu-project.org/
   :Location: /usr/local/packages6/libs/gcc/4.4.7/icu/42

ICU is the premier library for software internationalization, used by a wide array of companies and organizations

Usage
-----
To make the library available, run the following module command

.. code-block:: none

        module load libs/gcc/4.4.7/icu/42

Installation notes
------------------
This section is primarily for administrators of the system.

icu version 42 is the version of icu linked to by the system version of boost -- version 1.41. This build is to allow compilation of that version of boost.

.. code-block:: none

        tar -xvzf icu4c-4_2_1-src.tgz
        cd icu/source/
        ./runConfigureICU Linux/gcc --prefix=/usr/local/packages6/libs/gcc/4.4.7/icu/42
        make
        make install


Testing
-------
:code:`make check`

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

Module File
-----------
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
