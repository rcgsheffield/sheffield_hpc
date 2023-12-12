.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _hdf5_sharc:

High-performance data management and storage suite (HDF5)
=========================================================

.. sidebar:: HDF5

   :Latest version: 1.10.4
   :URL: https://www.hdfgroup.org/solutions/hdf5/

HDF5 is a data model, library, and file format for storing and managing data. It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data. HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5. The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format.

Usage
-----

By running ::

    $ module load libs/hdf5/1.10.4/gcc-8.2.0

you

* add several HDF5 programs to your ``PATH`` environment variable
* allow other programs to make use of (dynamically link against) the HDF5 library
* activate version 8.2.0 of the GCC compiler suite (as its C++ standard library is required by HDF5)

Documentation
-------------

Full documentation is available on the `project site <https://portal.hdfgroup.org/display/HDF5/HDF5>`_.

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 1.10.4**

HDF5 1.10.4 was compiled with v8.2.0 of the GCC compiler suite.

#. Download, configure, build and install by switching to a scratch directory and running :download:`this script </decommissioned/sharc/software/install_scripts/libs/hdf5/1.10.4/gcc-8.2.0/install.sh>`
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/hdf5/1.10.4/gcc-8.2.0>` as ``/usr/local/modulefiles/libs/hdf5/1.10.4/gcc-8.2.0``


