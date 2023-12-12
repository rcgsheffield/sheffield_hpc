.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc_expat:

Expat
=======

.. sidebar:: expat

    :Latest version: 2.2.7
    :URL: https://libexpat.github.io/

Expat is a stream-oriented XML parser library written in C.
Expat excels with files too large to fit RAM, and where performance and flexibility are crucial.
There are a number of applications, libraries and hardware using Expat, as well as bindings and 
3rd-party wrappers.

.. caution::

    Expat is typically loaded as an external dependency for R. Please ensure you select the matching 
    GCC compiler versions of your version of R and the Expat libraries.

--------

Usage
-----

To make this library available, run one of the following: ::

    module load libs/expat/2.2.7/gcc-4.9.4
    module load libs/expat/2.2.7/gcc-8.2

--------

Installation notes
------------------
This section is primarily for administrators of the system. 

Version 2.2.7
^^^^^^^^^^^^^

This was compiled with GCC 8.2.0 and 4.9.4 .

* To install Qsub :download:`this script </decommissioned/sharc/software/install_scripts/libs/expat/2.2.7/gcc-8.2/install_expat.sh>`
* Edit the script to change the version of GCC if desired.
* The installer script automatically creates a module file and logs.

