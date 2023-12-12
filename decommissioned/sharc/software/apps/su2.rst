.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

SU2
===

.. sidebar:: SU2
   
   :Versions: 5.0.0, 6.0.0
   :Dependencies: Modules loaded for GCC compiler 6.2.0 and Open MPI 2.1.1
   :URL: https://su2code.github.io/
   :Documentation: https://github.com/su2code/SU2/wiki

The SU2 suite is an open-source collection of C++ based software tools for performing Partial Differential Equation (PDE) analysis and solving PDE-constrained optimization problems. The toolset is designed with Computational Fluid Dynamics (CFD) and aerodynamic shape optimization in mind, but is extensible to treat arbitrary sets of governing equations such as potential flow, elasticity, electrodynamics, chemically-reacting flows, and many others. SU2 is under active development by the Aerospace Design Lab (ADL) of the Department of Aeronautics and Astronautics at Stanford University and many members of the community, and is released under an open-source license. 

Usage
-----

SU2 5.0.0 or 6.0.0 can be activated using the module files::

    module load apps/su2/5.0.0/gcc-6.2-openmpi-2.1.1
    module load apps/su2/6.0.0/gcc-6.2-openmpi-2.1.1

Note that the above module files also load GCC 6.2.0 and Open MPI 2.1.1.

Installation notes
------------------

SU2 5.0.0 was installed using the
:download:`install_su2.sh </decommissioned/sharc/software/install_scripts/apps/su2/5.0.0/gcc-6.2-openmpi-2.1.1/install_su2.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/su2/5.0.0/gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/su2/5.0.0/gcc-6.2-openmpi-2.1.1>`.
    
SU2 6.0.0 was installed using the
:download:`install_su2_6.0.0.sh </decommissioned/sharc/software/install_scripts/apps/su2/6.0.0/gcc-6.2-openmpi-2.1.1/install_su2_6.0.0.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/su2/6.0.0/gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/su2/6.0.0/gcc-6.2-openmpi-2.1.1>`.
    

