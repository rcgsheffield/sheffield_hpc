.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Bedtools
========

.. sidebar:: Bedtools

   :Versions:  2.30.0
   :Dependencies: dev/gcc/8.2 dev/cmake/3.17.1/gcc-8.2
   :URL: https://bedtools.readthedocs.org/en/latest/

Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks.

Interactive usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the :code:`qrshx` command.

The latest version of bedtools (currently version 2.30.0) is made available with the command:

.. code-block:: none

        module load apps/bedtools/2.30.0/gcc-8.2-cmake-3.17.1


After this any of the bedtools commands can be run from the prompt.


Installation notes
------------------
Bedtools was installed using GCC 8.2 with the script :download:`/usr/local/packages/apps/bedtools/2.30.0/gcc-8.2-cmake-3.17.1/install_bedtools.sh </decommissioned/sharc/software/install_scripts/apps/bedtools/2.30.0/gcc-8.2-cmake-3.17.1/install_bedtools.sh>`

Testing
-------
See: https://github.com/rcgsheffield/sheffield_hpc/issues/1157

Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/bedtools/2.30.0/gcc-8.2-cmake-3.17.1`

The contents of the module file is: ::

    #%Module
    proc ModulesHelp { } {
        puts stderr {

    Description
    ===========
    BEDTools: a powerful toolset for genome arithmetic.
    The BEDTools utilities allow one to address common genomics tasks such as finding feature overlaps and
    computing coverage.
    The utilities are largely based on four widely-used file formats: BED, GFF/GTF, VCF, and SAM/BAM.


    More information
    ================
     - Homepage: https://bedtools.readthedocs.io/
        }
    }

    module-whatis {Description: BEDTools: a powerful toolset for genome arithmetic.
    The BEDTools utilities allow one to address common genomics tasks such as finding feature overlaps and
    computing coverage.
    The utilities are largely based on four widely-used file formats: BED, GFF/GTF, VCF, and SAM/BAM.}
    module-whatis {Homepage: https://bedtools.readthedocs.io/}
    module-whatis {URL: https://bedtools.readthedocs.io/}

    set root /usr/local/packages/apps/bedtools/2.30.0/gcc-8.2-cmake-3.17.1


    module load dev/gcc/8.2
    module load dev/cmake/3.17.1/gcc-8.2

    prepend-path    CMAKE_PREFIX_PATH               $root
    prepend-path    PATH            $root/bin

