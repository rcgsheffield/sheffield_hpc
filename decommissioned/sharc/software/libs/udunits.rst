.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc_udunits:

udunits
=======

.. sidebar:: udunits

   :Latest version: 2.2.28
   :URL: https://www.unidata.ucar.edu/software/udunits

The UDUNITS package supports units of physical quantities. 
Its C library provides for arithmetic manipulation of units and for conversion 
of numeric values between compatible units. The package contains an extensive unit database, 
which is in XML format and user-extendable. The package also contains a command-line utility 
for investigating units and converting values.

.. caution::

        UDUNITS is typically loaded as an external dependency for R. Please ensure you select the matching 
        GCC compiler versions of your version of R and the UDUNITS libraries.

--------

Usage
-----

To make this library available, run one of the following: ::

        module load libs/udunits/2.2.26/gcc-4.9.4
        module load libs/udunits/2.2.28/gcc-8.2

--------

Installation notes
------------------
This section is primarily for administrators of the system. 

Version 2.2.28
^^^^^^^^^^^^^^

This was compiled with GCC 8.2.0

* To install Qsub :download:`this script </decommissioned/sharc/software/install_scripts/libs/udunits/2.2.28/gcc-8.2/install_udunits.sh>`
* The installer script automatically creates a module file and logs.


Version 2.2.26
^^^^^^^^^^^^^^

This was compiled with GCC 4.9.4

* Run :download:`this script </decommissioned/sharc/software/install_scripts/libs/udunits/2.2.26/gcc-4.9.4/install_udunits.sh>`
* Next, :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/udunits/2.2.26/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/udunits/2.2.26/gcc-4.9.4`` 

