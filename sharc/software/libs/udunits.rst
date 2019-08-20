.. _sharc_udunits:

udunits
=======

.. sidebar:: udunits

   :Latest version: 2.2.26
   :URL: https://www.unidata.ucar.edu/software/udunits

The UDUNITS package supports units of physical quantities. Its C library provides for arithmetic manipulation of units and for conversion of numeric values between compatible units. The package contains an extensive unit database, which is in XML format and user-extendable. The package also contains a command-line utility for investigating units and converting values.

Usage
-----
To make this library available, run the following: ::

        module load libs/udunits/2.2.26/gcc/gcc-4.9.4


Installation notes
------------------
This section is primarily for administrators of the system. 

Version 2.2.26
---------------

This was compiled with GCC 4.9.4

* Run :download:`this script </sharc/software/install_scripts/libs/udunits/2.2.26/gcc-4.9.4/install_udunits.sh>`
* Next, :download:`this modulefile </sharc/software/modulefiles/libs/udunits/2.2.26/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/udunits/2.2.26/gcc/gcc-4.9.4`` 
