.. _ansys-stanage-mechanical:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/stanage-sidebar.rst

Mechanical / MAPDL
=========================

.. contents::
    :depth: 3

----------------

Ansys Mechanical is a finite element analysis (FEA) tool that enables you to analyse complex product architectures and solve difficult mechanical problems.
You can use Ansys Mechanical to simulate real world behavior of components and sub-systems, and customize it to test design variations quickly and accurately.
ANSYS Mechanical has interfaces to other pre and post processing packages supplied by ANSYS and can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPU and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst
  
----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-stanage.rst

--------------------

Interactive jobs
----------------

You can load an ANSYS module above and then start the ANSYS mechanical launcher program by running the ``launcher`` command.

If desired, the ANSYS Workbench GUI executable can be launched with the  ``runwb2`` command.
To use more than a single core, you should write a batch job script and ANSYS mechanical APDL script file for submission to the batch queues.

--------------------

Batch jobs
----------

MAPDL is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` parallel environments but will use its in-build MPI communications for both.

Sample SMP MAPDL Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""""""

``Mapdl mechanical``: the following is an example batch submission script, ``mech_job.sh``, to run the mechanical executable ``mapdl`` with input file ``CrankSlot_Flexible.inp``, and carry out a mechanical simulation.
The script requests 2 cores using the SMP parallel environment with a runtime of 60 mins and 2 GB of real memory per core.

.. hint::

    * The argument ``$SLURM_NTASKS`` is a SLURM scheduler variable which will return the requested number of tasks.


.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2
    #SBATCH --mem=4000
    #SBATCH --job-name=ansys_mech-test
    #SBATCH --output=output_ansys_mech_test
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/2023R2
    mapdl -smp -dir $(pwd) -b -np $SLURM_NTASKS -j solution -i CrankSlot_Flexible.inp

The job is submitted to the queue by typing:

.. code-block:: bash

    sbatch mech_job.sh

Sample MPI MAPDL Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""""""

``Mapdl mechanical``: the following is an example batch submission script, ``mech_job.sh``, to run the mechanical executable ``mapdl`` with input file ``CrankSlot_Flexible.inp``, and carry out a mechanical simulation.
The script requests 2 cores using the MPI parallel environment with a runtime of 60 mins and 2 GB of real memory per core.

.. hint::

    * The argument ``$SLURM_NTASKS`` is a SLURM scheduler variable which will return the requested number of tasks.


.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=2
    #SBATCH --ntasks-per-node=1
    #SBATCH --mem=2000
    #SBATCH --job-name=ansys_mech-test
    #SBATCH --output=output_ansys_mech_test
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/2023R2
    # Create a hosts file with the allocated nodes
    echo ===========================
    echo List of machines supplied to Ansys Mech
    machinelist=$(scontrol show hostname $SLURM_JOB_NODELIST | awk -v cpus=$SLURM_NTASKS_PER_NODE '{printf "%s:%d:", $0, cpus}' | sed 's/:$//')
    echo $machinelist
    echo ===========================
    mapdl -dis -mpi INTELMPI -machines $machinelist -b -scheduler_tight_coupling -pib.infinipath -i CrankSlot_Flexible.inp

The job is submitted to the queue by typing:

.. code-block:: bash

    sbatch mech_job.sh

-----------------------

ANSYS Mechnical training and help resources
-------------------------------------------

.. important::

  Academic support requests should be directed to the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_  or 
  the `ANSYS Learning Forum <https://forum.ansys.com/>`_ (**ensure you register with your University email for priority support**).

ANSYS provides numerous academic training and help resources including tutorials, video lectures and examples for structural and mechnical products. 
A short list of the resources ANSYS maintains is summarised below:

*  `"How to" youtube playlists for structural and mechnical products. <https://www.youtube.com/user/ANSYSHowToVideos/playlists?view=50&sort=dd&shelf_id=8>`_
*  `An extensive number of free online courses on structural and mechnical products and theory <https://courses.ansys.com/index.php/structures/>`_
