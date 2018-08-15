.. _iceberg_ctffind:

ctffind
=======

.. sidebar:: ctffind

   :Versions:  4.1.5 3.140609 
   :URL: http://grigoriefflab.janelia.org/ctf

CTFFIND4, CTFFIND3 and CTFTILT are programs for finding CTFs of electron
micrographs.  The programs CTFFIND3 and CTFFIND4 are updated versions of the
program CTFFIND2, which was developed in 1998 by Nikolaus Grigorieff at the MRC
Laboratory of Molecular Biology in Cambridge, UK with financial support from
the MRC. This software is licensed under the terms of the `Janelia Research
Campus Software Copyright 1.1 <http://license.janelia.org/license/>`_.

Making ctffind available
------------------------

To activate and use CTFFIND4, run: ::

      module load apps/gcc/4.9.2/ctffind/4.1.5

This makes the following programs available in your session: 

* ``ctffind``
* ``ctffind_plot_results.sh``     

To activate and use CTFFIND3, run: ::

      module load apps/gcc/4.4.7/ctffind/3.140609

This makes the following programs available in your session:

* ``ctffind3.exe``     
* ``ctffind3_mp.exe``  
* ``ctftilt.exe``      
* ``ctftilt_mp.exe``

CTFFIND4 should run **significantly faster** than CTFFIND3 and may give slightly
improved results when processing data from detectors other than scanned
photographic film.

Installation notes
------------------
These are primarily for system administrators.

**Version 4.1.5**

This version was built using GCC 4.9.2, the :ref:`Intel Math Kernel Library
(MKL) <iceberg_intel_mkl>` for fast fourier transforms and the :ref:`wxWidgets
<iceberg_wxWidgets>` toolkit for its user interface.

It also has run-time dependencies on all three of those software packages.

It was installed as an optional dependency of Relion 2.

#. Download, patch, configure, compile and install using :download:`this script </iceberg/software/install_scripts/apps/gcc/4.9.2/ctffind/4.1.5/install.sh>`
#. Install :download:`this modulefile </iceberg/software/modulefiles/apps/gcc/4.9.2/ctffind/4.1.5>` as ``/usr/local/modulefiles/apps/gcc/4.9.2/ctffind/4.1.5``

**Version 3.140609**

This version was built using GCC 4.4.7.

#. Download, configure, compile and install using :download:`install_ctffind.sh </iceberg/software/install_scripts/apps/gcc/4.4.7/ctffind/3.140609/install.sh>`
#. Install :download:`this modulefile </iceberg/software/modulefiles/apps/gcc/4.4.7/ctffind/3.140609>` as ``/usr/local/modulefiles/apps/gcc/4.4.7/ctffind/3.140609``
