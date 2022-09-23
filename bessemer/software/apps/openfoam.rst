OpenFOAM
==========

.. sidebar:: OpenFOAM

   :Versions: 8.0, v2012
   :URL: https://openfoam.org/ or https://www.openfoam.com/
   :Documentation: https://cfd.direct/openfoam/user-guide or https://www.openfoam.com/documentation/overview
   :Dependencies: Easybuild foss/2020a toolchain, NCurses 6.2, METIS 5.1.0, SCOTCH 6.0.9, CGAL 4.14.3 and Paraview 5.8.0

OpenFOAM is leading software for computational fluid dynamics (CFD). It is licensed free and open source only under the GNU General Public Licence (GPL) by the OpenFOAM Foundation. Different versions of OpenFOAM supplied from different projects exist so choose your module carefully.

Usage
-----

There are two OpenFOAM modules, choose one and load it with either:

.. code-block:: bash

    module load OpenFOAM/8-foss-2020a
    module load OpenFOAM/v2012-foss-2020a


OpenFOAM can be used in an interactive or batch job. Both OpenFOAM modules can be activated using the module file and sourcing the OpenFOAM environment script e.g.

.. code-block:: bash

    module load OpenFOAM/8-foss-2020a
    source $FOAM_BASH


.. hint::

    Users should investigate OpenFOAM documentation to determine which OpenFOAM executables are parallel compatible and 
    which are serial only. Only the ``simpleFoam`` executable shown below is parallel compatible and is executed with ``srun``
    in multiple core jobs.

------------

Interactive Usage
--------------------

The following is an example single core interactive session running the pitzDaily example model.

After connecting to Bessemer (see :ref:`ssh`), you can start an `interactive graphical session <https://docs.hpc.shef.ac.uk/en/latest/hpc/scheduler/submit.html#interactive-sessions>`_.

.. code-block:: bash

    module load OpenFOAM/8-foss-2020a
    source $FOAM_BASH
    rm -r /fastdata/$USER/tests/openfoam/run/
    mkdir -p /fastdata/$USER/tests/openfoam/run
    cd /fastdata/$USER/tests/openfoam/run
    cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
    chmod 700 -R pitzDaily && cd pitzDaily
    blockMesh
    simpleFoam
    paraFoam #To view the output.

------------

Batch Usage
--------------------

The following is an example batch job running the pitzDaily example model:

.. important::

    You will need to supply a `decomposeParDict <https://cfd.direct/openfoam/user-guide/v8-running-applications-parallel/>`_ in the system subdirectory of the case - check the installation script for an example using the EOF method to add it :

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=8000
    #SBATCH --job-name=name_OpenFOAM_smp_4
    #SBATCH --output=output_OpenFOAM_smp_4
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    rm -r /fastdata/$USER/tests/openfoam/run/
    mkdir -p /fastdata/$USER/tests/openfoam/run
    cd /fastdata/$USER/tests/openfoam/run
    module load OpenFOAM/8-foss-2020a
    source $FOAM_BASH
    cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
    chmod 700 -R pitzDaily && cd pitzDaily
    cp /home/$USER/openfoam/my_custom_decomposeParDict system/decomposeParDict #You must supply you own copy or see the example modified test script below.
    blockMesh
    decomposePar
    srun --export=ALL simpleFoam -parallel

------------

Installation note for Administrators:
-------------------------------------

OpenFOAM v2012
^^^^^^^^^^^^^^

OpenFOAM v2012 has been installed using Easybuild with all third party modules  (NCurses 6.2, METIS 5.1.0, SCOTCH 6.0.9, CGAL 4.14.3 and Paraview 5.8.0)

Installation was tested as follows as above with the :download:`example batch script  </bessemer/software/modulefiles/OpenFOAM/test_OpenFOAMv2012_parallel.sbatch>` modified to load **OpenFOAM/v2012-foss-2020a** (Getting Started example from https://openfoam.org/download/8-source/) with the following decomposeParDict:
https://openfoamwiki.net/index.php/DecomposePar

The module file is available below:

- :download:`/usr/local/modulefiles/live/eb/all/OpenFOAM/v2012-foss-2020a </bessemer/software/modulefiles/OpenFOAM/v2012-foss-2020a>`

OpenFOAM 8
^^^^^^^^^^

OpenFOAM 8 has been installed using Easybuild with all third party modules (NCurses 6.2, METIS 5.1.0, SCOTCH 6.0.9, CGAL 4.14.3 and Paraview 5.8.0)

Installation was tested as follows as above with the :download:`example batch script modified </bessemer/software/modulefiles/OpenFOAM/test_OpenFOAM_parallel.sbatch>` (Getting Started example from https://openfoam.org/download/8-source/) with the following decomposeParDict:
https://openfoamwiki.net/index.php/DecomposePar


The module file is available below:

- :download:`/usr/local/modulefiles/live/eb/all/OpenFOAM/8-foss-2020a </bessemer/software/modulefiles/OpenFOAM/8-foss-2020a>`
