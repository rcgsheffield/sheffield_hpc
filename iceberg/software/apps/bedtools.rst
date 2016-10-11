bedtools
========

.. sidebar:: bedtools

   :Versions:  2.25.0
   :Dependancies: compilers/gcc/5.2
   :URL: https://bedtools.readthedocs.org/en/latest/

Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks.

Interactive usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

The latest version of bedtools (currently version 2.25.0) is made available with the command:

.. code-block:: none

        module load apps/gcc/5.2/bedtools

Alternatively, you can make a specific version available:

.. code-block:: none

      module load apps/gcc/5.2/bedtools/2.25.0


After that any of the bedtools commands can be run from the prompt.



Installation notes
------------------
bedtools was installed using gcc 5.2 with the script `install_bedtools.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/install_scripts/apps/gcc/5.2/bedtools/install_bedtools.sh>`_


Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bedtools/2.25.0`

The contents of the module file is ::

    #%Module1.0#####################################################################
    ##
    ## bedtools module file
    ##

    ## Module file logging
    source /usr/local/etc/module_logging.tcl
    ##

    proc ModulesHelp { } {
          global bedtools-version

          puts stderr "   Adds `bedtools-$bedtools-version' to your PATH environment variable and necessary libraries"
    }

    set     bedtools-version 2.25.0
    module load compilers/gcc/5.2

    prepend-path PATH /usr/local/packages6/apps/gcc/5.2/bedtools/2.25.0/bin
