
SU2
====

.. sidebar:: SU2
   
   :Version: 4.1.0
   :Dependancies: gcc/4.4.7 mpi/gcc/openmpi/1.10.1
   :URL: http://su2.stanford.edu/
   :Documentation: https://github.com/su2code/SU2/wiki


The SU2 suite is an open-source collection of C++ based software tools for performing Partial Differential Equation (PDE) analysis and solving PDE constrained optimization problems.

Usage
-----

SU2 can be activated using the module file::

    module load apps/gcc/4.4.7/su2


Installation notes
------------------

Su2 was compiled using the
`install_su2.sh <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/apps/gcc/4.4.7/su2/install_su2.sh>`_ script. SU2 also has it's own version of CGNS which was compiled with the script `install_cgns.sh <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/install_scripts/apps/gcc/4.4.7/su2/install_cgns.sh>`_. The module file is `4.1.0 <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/4.4.7/su2/4.1.0>`_.
