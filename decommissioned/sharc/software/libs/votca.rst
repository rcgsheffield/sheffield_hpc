.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _votca_sharc:

VOTCA
======

.. sidebar:: VOTCA

   :Latest version: v2022
   :URL: https://www.votca.org/index.html

VOTCA is a software package which focuses on the analysis of molecular dynamics data,
 the development of systematic coarse-graining techniques as well as methods used for 
 simulating microscopic charge (and exciton) transport in disordered semiconductors. 
 Its C++ core is interfaced to Bash and Perl flow-control scripts.

-------

Usage
-----

Load by running one of the following ::

    module load libs/votca/v2022/gcc-8.2-cmake-3.17.1

This will:

* add several VOTCA programs to your ``PATH`` environment variable

The command-line programs that Votca provides are:



* ``csg_boltzmann``
* ``csg_call``
* ``csg_density``
* ``csg_dlptopol``
* ``csg_dump``
* ``csg_fmatch``
* ``csg_gmxtopol``
* ``csg_imc_solve``
* ``csg_inverse``
* ``csg_map``
* ``csg_property``
* ``csg_resample``
* ``csg_reupdate``
* ``csg_stat``
* ``votca_compare``
* ``votca_help2doc``
* ``votca_property``



-------

Documentation
-------------
Standard ``man`` pages are available for the provided commands/functions.

These can be viewed using e.g. ::

    $ man csg_boltzmann

Much more information is available on the `project site <https://www.votca.org/index.html>`_.

-------



Installation notes
------------------
This section is primarily for administrators of the system.

**Version .v2022**

Votca v2022 was compiled with GCC 8.2 and cmake 3.1.7. 
