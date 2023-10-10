.. _nektar-stanage:

.. |softwarename| replace:: Nektar++
.. |currentver| replace:: 5.0.1
.. |ebtoolchain| replace:: foss-2020b

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: https://www.nektar.info/

|softwarename| is a tensor product based finite element package designed to allow one to construct efficient 
classical low polynomial order h-type solvers (where h is the size of the finite element) as well as higher 
p-order piecewise polynomial order solvers.

The framework comes with a number of solvers and also allows one to construct a variety of new solvers. 
Example solvers and tutorials on their use are documented in the |softwarename| user guide, available from 
the `Documentation page <https://www.nektar.info/getting-started/documentation/>`_ .

========

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console
	
    $ module load Nektar++/5.0.1-foss-2020b

To see a list of the available commands with a given |softwarename| module loaded:

.. code-block:: bash
        
        ls ${EBROOTNEKTARPLUSPLUS}/bin



--------------------------

Batch Usage
--------------------

First we download an example tutorial:

.. code-block:: bash

        wget https://doc.nektar.info/tutorials/latest/incns/taylor-green-vortex/incns-taylor-green-vortex.tar.gz
        tar -xvzf incns-taylor-green-vortex.tar.gz

The following is an example submission script for this `tutorial <https://doc.nektar.info/tutorials/latest/incns/taylor-green-vortex/incns-taylor-green-vortex.html#incns-taylor-green-vortexch4.html>`_:

.. code-block:: bash

        #!/bin/bash
        #SBATCH --job-name=nektar
        #SBATCH --nodes=1
        #SBATCH --ntasks-per-node=32
        #SBATCH --cpus-per-task=1
        #SBATCH --time=02:00:00

        module load Nektar++/5.0.1-foss-2020b
        
        export OMP_NUM_THREADS=1
        
        INPUT=$PWD/incns-taylor-green-vortex/completed/solver64
        
        srun --export=ALL IncNavierStokesSolver /
        ${INPUT}/TGV64_mesh.xml /
        ${INPUT}/TGV64_conditions.xml
                
========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELNEKTARPLUSPLUS`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted by following the above example.