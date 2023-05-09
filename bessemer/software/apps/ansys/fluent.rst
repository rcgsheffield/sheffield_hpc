.. _ansys-bessemer-fluent:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/bessemer-sidebar.rst

Fluent
========================

.. contents::
    :depth: 3

----------------

ANSYS Fluent is a Computational Fluid Dynamics (CFD) code for modelling fluid flow, heat transfer, mass transfer and chemical reactions.
Fluent has interfaces to other pre and post processing packages supplied by ANSYS such as ICEMCFD or Ensight and can incorporate user developed models via user defined functions.
Fluent can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPU and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-bessemer.rst

--------------------

Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on Bessemer with the ``srun --pty bash -i`` command which supports graphical applications.
You can load an ANSYS module above and then start the fluent program by running the ``fluent`` command.

If desired, the ANSYS Workbench GUI executable can be launched with the  ``runwb2`` command.
To use more than a single core, you should write a batch job script and fluent journal file for submission to the batch queues.

--------------------

Batch jobs
----------

To submit Fluent jobs with larger resources a batch job must be submitted to the scheduler.
A Fluent batch job is composed of a Fluent journal file which tells Fluent what to do and submission script which tells the scheduler how much resource to request and how to start Fluent.

Fluent Journal files
^^^^^^^^^^^^^^^^^^^^

A Fluent journal file is effectively a sequence of TUI and/or Scheme commands that you’ll supply to Fluent instead of using the GUI / TUI.
A more thorough explanation and tutorial on how to make a Fluent journal file can be found on the following page:  :ref:`Writing Fluent journal files. <writing-fluent-journal-files>`

.. important::

  It is critical that you consult with the :ref:`Fluent journal syntax <writing-fluent-journal-files>` documentation linked above in order to ensure features such as autosaving and intermediate save states are turned on and functioning correctly!

Batch Submission Script
^^^^^^^^^^^^^^^^^^^^^^^

Fluent is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` parallel environments but will use its in-build MPI communications for both.
On Bessemer, cross node jobs are not permitted and there is no ``mpi-rsh`` parallel environment.
This necessitates the use of the default :ref:`SMP <parallel_SMP>` OpenMP parallel environment  (up to 40 cores on a single node only).
The lack of other options compared to :ref:`Fluent on ShARC<ansys-sharc-fluent>` is as a result of execution on a single node not requiring these options.


The following is an example batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``subjou.jou``, and carry out a 2D double precision CFD simulation.
The script requests 4 cores using the OpenMP parallel environment with a runtime of 60 mins and 2 GB of real memory per core.

Sample SMP Fluent Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""""

.. hint::

    * The ``2ddp`` argument is used to specify a 2D double precision simulation. Valid values include: ``2d``, ``2ddp``, ``3d`` and ``3ddp``
    * The argument ``$SLURM_NTASKS`` is a SLURM scheduler variable which will return the requested number of tasks.
    * The arguments ``-gu`` and ``-driver null`` instruct Fluent that it will be running with no GUI to avoid errors caused by plot / figure export.


.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=8000
    #SBATCH --job-name=name_fluent_smp_4
    #SBATCH --output=output_fluent_smp_4
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/20.2
    fluent 2ddp -i test.jou -gu -t$SLURM_NTASKS -driver null


The job is submitted to the queue by typing:

.. code-block:: bash

    sbatch cfd_job.sh


---------------



.. include:: ../../../../referenceinfo/ANSYS/fluent/export-fluent-plots-while-using-batch-jobs.rst

---------------

ANSYS Fluent training and help resources
----------------------------------------

.. important::

  Academic support requests should be directed to the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_  or 
  the `ANSYS Learning Forum <https://forum.ansys.com/>`_ (**ensure you register with your University email for priority support**).

ANSYS provides numerous academic training and help resources including tutorials, video lectures and examples for computational fluid dynamics products.
A short list of the resources ANSYS maintains is summarised below:

*  `"How to" youtube playlists for computational fluid dynamics products. <https://www.youtube.com/user/ANSYSHowToVideos/playlists?view=50&sort=dd&shelf_id=3>`_
*  `An extensive number of free online courses on computational fluid dynamics products and theory <https://courses.ansys.com/index.php/fluids/>`_