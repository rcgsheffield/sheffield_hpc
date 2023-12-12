.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _doxygen_sharc:

Doxygen
=======

Doxygen is a tool for building documentation for source code e.g. inter-related HTML pages for C++ source code.

Usage
-----

Doxygen can be loaded with either: ::

    module load apps/doxygen/1.8.13/gcc-4.9.4
    module load apps/doxygen/1.9.1/gcc-8.2-cmake-3.17.1

NB Doxygen has a run-time dependency on ``libstdc++`` so the above also needs to
(and does) load the :ref:`GCC compiler <gcc_sharc>` version 4.9.4 or 8.2 respectively.

Installation
------------

Version 1.9.1 GCC v8.2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Install using :download:`this script </decommissioned/sharc/software/install_scripts/apps/doxygen/1.9.1/gcc-8.2-cmake-3.17.1/install_doxygen.sh>`
2. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/apps/doxygen/1.9.1/gcc-8.2-cmake-3.17.1>` as ``/usr/local/modulefiles/apps/doxygen/1.9.1/gcc-8.2-cmake-3.17.1``


Version 1.8.13 GCC v4.9.4
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Install using :download:`this script </decommissioned/sharc/software/install_scripts/apps/doxygen/1.8.13/gcc-4.9.4/install.sh>`
2. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/apps/doxygen/1.8.13/gcc-4.9.4>` as ``/usr/local/modulefiles/apps/doxygen/1.8.13/gcc-4.9.4``

