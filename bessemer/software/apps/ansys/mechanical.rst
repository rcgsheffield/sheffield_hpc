.. _ansys-bessemer-mechanical:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/bessemer-sidebar.rst

Mechanical / MAPDL
=========================

.. contents::
    :depth: 3

----------------

Ansys Mechanical is a finite element analysis (FEA) tool that enables you to analyze complex product architectures and solve difficult mechanical problems.
You can use Ansys Mechanical to simulate real world behavior of components and sub-systems, and customize it to test design variations quickly and accurately.
ANSYS Mechanical has interfaces to other pre and post processing packages supplied by ANSYS and can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPU and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst
  
----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-bessemer.rst

--------------------

Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on Bessemer with the ``srun --pty bash -i`` command which supports graphical applications.
You can load an ANSYS module above and then start the ANSYS mechanical launcher program by running the ``launcher`` command.

If desired, the ANSYS Workbench GUI executable can be launched with the  ``runwb2`` command.
To use more than a single core, you should write a batch job script and ANSYS mechanical APDL script file for submission to the batch queues.

--------------------

Batch jobs
----------

MAPDL is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` parallel environments but will use its in-build MPI communications for both.
On Bessemer, cross node jobs are not permitted and there is no ``mpi-rsh`` parallel environment.
This necessitates the use of the default :ref:`SMP <parallel_SMP>` OpenMP parallel environment  (up to 40 cores on a single node only).
The lack of other options compared to :ref:`ANSYS Mechanical on ShARC<ansys-sharc-mechanical>` is as a result of execution on a single node not requiring these options.

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
    module load ANSYS/20.2
    mapdl -smp -dir $(pwd) -b -np $SLURM_NTASKS -j solution -i CrankSlot_Flexible.inp

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