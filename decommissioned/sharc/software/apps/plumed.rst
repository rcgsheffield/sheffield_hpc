.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

PLUMED
======

.. sidebar:: PLUMED
   
   :Version: 2.3.2
   :Dependencies: GCC compiler and Open MPI. Modules loaded for GCC 6.2.0 and Open MPI 2.1.1.
   :URL: http://www.plumed.org  
   :Documentation: https://plumed.github.io/doc-v2.3/user-doc/html/index.html

PLUMED is an open source library for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines. Free energy calculations can be performed as a function of many order parameters with a particular focus on biological problems, using state of the art methods such as metadynamics, umbrella sampling and Jarzynski-equation based steered MD. The software, written in C++, can be easily interfaced with both fortran and C/C++ codes.

Usage
-----

PLUMED 2.3.2 can be activated using the module file::

    module load apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1

The PLUMED executable is ``plumed``.
	
Installation notes
------------------

PLUMED 2.3.2 was installed using the
:download:`install_plumed.sh </decommissioned/sharc/software/install_scripts/apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1/install_plumed.sh>` script; the module
file is
:download:`gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1>`.

The installation of PLUMED 2.3.2 was tested using the ``make`` command as part of running the above installation script.
    

