.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

OpenFOAM
========

.. sidebar:: OpenFOAM

   :Version: 4.1, 8, v2012
   :URL: https://openfoam.org/ or https://www.openfoam.com/
   :Documentation: https://cfd.direct/openfoam/user-guide or https://www.openfoam.com/documentation/overview
   :Dependencies: GCC compiler, Open MPI, NCurses (essential), Scotch/PT-Scotch, GMP, MPFR.


OpenFOAM is leading software for computational fluid dynamics (CFD). It is licensed free and open source only under the GNU General Public Licence (GPL) by the OpenFOAM Foundation.


Usage
-----

OpenFOAM can be activated using one of the module files below:

.. code-block:: bash

    module load apps/openfoam/4.1/gcc-6.2-openmpi-2.0.1
    module load apps/openfoam/8/gcc-8.2-openmpi-4.0.1
    module load apps/openfoam/v2012/gcc-8.2-openmpi-4.0.3

OpenFOAM can be used in an interactive or batch job. OpenFOAM modules for version 8 and v2012 can be activated using the module file and sourcing the OpenFOAM environment script e.g.

.. code-block:: bash

        module load apps/openfoam/8/gcc-8.2-openmpi-4.0.1
        source $FOAM_BASH

OpenFOAM version 4.1 uses the module file to match the shell environment and can be loaded by simplying running:

.. code-block:: bash

    module load apps/openfoam/4.1/gcc-6.2-openmpi-2.0.1

.. hint::

    Users should investigate OpenFOAM documentation to determine which OpenFOAM executables are parallel compatible and 
    which are serial only. Only the ``simpleFoam`` executable shown below is parallel compatible and is executed with ``srun``
    in multiple core jobs.

----------

Interactive Usage
--------------------

The following is an example single core interactive session running the pitzDaily example model.

After connecting to ShARC (see :ref:`ssh`), you can start an `interactive graphical session <https://docs.hpc.shef.ac.uk/en/latest/hpc/scheduler/submit.html#interactive-sessions>`_. and assuming a single core request:

.. code-block:: bash

  rm -r /fastdata/$USER/tests/openfoam/run/
  mkdir -p /fastdata/$USER/tests/openfoam/run
  cd /fastdata/$USER/tests/openfoam/run
  module load apps/openfoam/8/gcc-8.2-openmpi-4.0.1
  source $FOAM_BASH
  cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
  chmod 700 -R pitzDaily && cd pitzDaily
  blockMesh
  simpleFoam

------------

Batch Usage
--------------------

The following is an example batch job running the pitzDaily example model:

.. important::

    You will need to supply a `decomposeParDict <https://cfd.direct/openfoam/user-guide/v8-running-applications-parallel/>`_ in the system subdirectory of the case if using parallel processing - check the installation script for an example using the EOF method to add it :

.. code-block:: bash

  #!/bin/bash
  #$ -V
  #$ -cwd
  #$ -M a.person@sheffield.ac.uk
  #$ -m abe
  #$ -l h_rt=01:00:00
  #$ -l rmem=2G
  #$ -pe mpi 4
  #$ -N test_OpenFOAM8_parallel-4

  rm -r /fastdata/$USER/tests/openfoam/run/
  mkdir -p /fastdata/$USER/tests/openfoam/run
  cd /fastdata/$USER/tests/openfoam/run
  module load apps/openfoam/8/gcc-8.2-openmpi-4.0.1
  source $FOAM_BASH
  cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
  chmod 700 -R pitzDaily && cd pitzDaily
  cp /fastdata/$USER/tests/openfoam/decomposeParDict system/decomposeParDict
  blockMesh
  decomposePar
  mpirun -n $NSLOTS simpleFoam -parallel


Installation notes
------------------

OpenFOAM v2012
^^^^^^^^^^^^^^
OpenFOAM v2012 was installed by Git cloning the requisite repositories from https://develop.openfoam.com/Development/openfoam/ and https://develop.openfoam.com/Development/ThirdParty-common/ followed by running the
:download:`compileOFv2012.sge </decommissioned/sharc/software/install_scripts/apps/openfoam/v2012/compileOFv2012.sge>` installation script. (Third party downloads may be necessary prior to compiling.)

Persistent configuration settings can be found in ``/usr/local/packages/apps/openfoam/v2012/OpenFOAM-v2012/etc/prefs.sh``.

All available third party dependencies were also (manually in some cases) downloaded, compiled and installed.

The module file was built by observing shell environment changes / looking at the OpenFOAM documentation and can downloaded: :download:`gcc-8.2-openmpi-4.0.3 </decommissioned/sharc/software/modulefiles/apps/openfoam/v2012/gcc-8.2-openmpi-4.0.3>`.

The use of ``setenv  OMPI_MCA_btl_openib_allow_ib 1`` in the module file is required in order to get the correct connectivity with the Omnipath interconnect.

Installation was tested as follows as above with the :download:`example batch script modified </decommissioned/sharc/software/modulefiles/apps/openfoam/v2012/OpenFOAMv2012-test-parallel-4.sge>`
(Getting Started example from https://openfoam.org/download/8-source/) with the below decomposeParDict:

https://openfoamwiki.net/index.php/DecomposePar

.. note::

  Note that OpenFOAM v2012 has been compiled with its own included OpenMPI 4.0.3.

OpenFOAM 8
^^^^^^^^^^

OpenFOAM 8 was installed by Git cloning the requisite OpenFOAM-8 and ThirdParty-8 directories from https://github.com/OpenFOAM/OpenFOAM-8 followed by running the
:download:`compileOF8pf.sge </decommissioned/sharc/software/install_scripts/apps/openfoam/8/compileOF8pf.sge>` and
:download:`compileOF8pf_Third_Party.sge </decommissioned/sharc/software/install_scripts/apps/openfoam/8/compileOF8pf_Third_Party.sge>` installation scripts. (Third party downloads may be necessary prior to compiling.)

Persistent configuration settings can be found in ``/usr/local/packages/apps/openfoam/8/gcc-8.2-openmpi-4.0.1/site/8/prefs.sh``.

All available third party dependencies were also (manually in some cases) downloaded, compiled and installed. FoamyHexMesh was enabled.

The module file was built by observing shell environment changes / looking at the OpenFOAM documentation and can downloaded: :download:`gcc-8.2-openmpi-4.0.1 </decommissioned/sharc/software/modulefiles/apps/openfoam/8/gcc-8.2-openmpi-4.0.1>`.

The use of ``setenv  OMPI_MCA_btl_openib_allow_ib 1`` in the module file is required in order to get the correct connectivity with the Omnipath interconnect.

Installation was tested as follows as above with the :download:`example batch script modified </decommissioned/sharc/software/modulefiles/apps/openfoam/8/OpenFOAM8-test-parallel-4.sge>`
(Getting Started example from https://openfoam.org/download/8-source/) with the below decomposeParDict:

https://openfoamwiki.net/index.php/DecomposePar

OpenFOAM 4.1
^^^^^^^^^^^^

OpenFOAM 4.1 was installed using the
:download:`install_openfoam.sh </decommissioned/sharc/software/install_scripts/apps/openfoam/4.1/install_openfoam.sh>` script, the module
file is
:download:`gcc-6.2-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/apps/openfoam/4.1/gcc-6.2-openmpi-2.0.1>`. The following optional dependencies were built as part of the installation process: Scotch/PT-Scotch v6.0.3 (located in /usr/local/packages/apps/openfoam/4.1/gcc-6.2-openmpi-2.0.1/ThirdParty-4.1). The following optional dependencies were not installed: ParaView and CGAL.

Installation was tested as follows (Getting Started example from https://openfoam.org/download/4-1-source/)::

    $ mkdir /data/$USER/tests/openfoam/run
    $ cd /data/$USER/tests/openfoam/run
    $ module load apps/openfoam/4.1/gcc-6.2-openmpi-2.0.1
    $ cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
    $ cd pitzDaily
    $ blockMesh
    $ simpleFoam
    $ paraFoam

