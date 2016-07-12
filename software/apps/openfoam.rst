
OpenFOAM
========

.. sidebar:: OpenFOAM
   
   :Version: 3.0.0
   :Dependancies: gcc/5.2 mpi/gcc/openmpi/1.10.0 scotch/6.0.4
   :URL: http://www.openfoam.org
   :Documentation: http://www.openfoam.org/docs/


OpenFOAM is free, open source software for computational fluid dynamics (CFD).

Usage
-----

The lastest version of OpenFoam can be activated using the module file::

    module load apps/gcc/5.2/openfoam

Alternatively, you can load a specific version of OpenFOAM::

	module load apps/gcc/5.2/openfoam/2.4.0
	module load apps/gcc/5.2/openfoam/3.0.0

This has the same effect as sourcing the openfoam bashrc file, so that should
not be needed.

Installation notes
------------------

OpenFoam was compiled using the
`install_openfoam.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/openfoam/install_openfoam.sh>`_ script, the module
file is
`3.0.0 <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/openfoam/3.0.0>`_.
