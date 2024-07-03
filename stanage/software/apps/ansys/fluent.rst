.. _ansys-stanage-fluent:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/stanage-sidebar.rst

Fluent
======

.. contents::
    :depth: 3

----------------

ANSYS Fluent is a Computational Fluid Dynamics (CFD) code for modelling fluid flow, heat transfer, mass transfer and chemical reactions.
Fluent has interfaces to other pre and post processing packages supplied by ANSYS such as ICEMCFD or Ensight and can incorporate user developed models via user defined functions.
Fluent can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPU and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-stanage.rst

--------------------

Interactive jobs
----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

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

On Stanage, Fluent jobs can either be run on just one node (SMP) or across multiple nodes, (but will use its in-built MPI communications for both).

Sample SMP Fluent Scheduler Job Script
""""""""""""""""""""""""""""""""""""""

The following is an example batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``test.jou``, and carry out a 2D double precision CFD simulation.
The script requests 4 cores with a runtime of 60 mins and 8 GB of real memory per node.

.. hint::

    * The ``2ddp`` argument is used to specify a 2D double precision simulation. Valid values include: ``2d``, ``2ddp``, ``3d`` and ``3ddp``.
    * The ``#SBATCH --nodes=1`` asks the scheduler for 1 node.
    * The ``#SBATCH --ntasks-per-node=1`` asks the scheduler for 1 task per node.
    * The ``#SBATCH --cpus-per-task=4`` asks the scheduler for 4 cores in the single task.
    * The arguments ``-gu`` and ``-driver null`` instruct Fluent that it will be running with no GUI to avoid errors caused by plot / figure export.
    * The argument ``-sifile=./"$SLURM_JOBID"_fluent_server_info.txt`` tells Fluent to create a file in the working directory with the remote visualization server info.


.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=4
    #SBATCH --mem=8000
    #SBATCH --job-name=name_fluent_smp_4
    #SBATCH --output=output_fluent_smp_4
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/2023R2

    fluent 2ddp -t$SLURM_CPUS_PER_TASK -gu -driver null -sifile=./"$SLURM_JOBID"_fluent_server_info.txt -i test.jou

.. tip::

    You may have noted that this SMP job uses different arguments as the MPI jobs below. The use of a single task is intentional and is in order to ensure all requested memory within a job is available to **all** Fluent application threads
    in a single CGroup. This should avoid asymmetric memory requirements for the host Fluent process during start up in some models causing crashes due to insufficient memory being available and the scheduler terminating the job.


The job is submitted to the queue by typing:

.. code-block:: bash

    sbatch cfd_job.sh



Sample MPI Fluent Scheduler Job Scripts
"""""""""""""""""""""""""""""""""""""""

As SLURM is capable of making MPI job resource requests very specifically, two scripts are provided below. The first is a **"generic"** job submission with the scheduler allocating MPI tasks 
and cores anywhere it can freely find them available in the cluster. The second script is a **"specific"** example with the scheduler being explicitly told to allocate tasks with cores specifically 
across 4 nodes.

.. tip::

    In most cases a generic request for cores across the cluster with ``#SBATCH --ntasks=n`` is ideal to reduce queue times, (as the scheduler can more freely allocate cores), so the first example should suffice in most cases.

The following is the **"generic"** batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``test.jou``, and carry out a 2D double precision CFD simulation.
The script requests 4 cores, 1 core per task (the default) with 4 tasks, with a runtime of 60 mins and 2 GB of real memory per core.

.. hint::

    * The ``#SBATCH --ntasks=4`` asks the scheduler for 4 tasks (each with a single core by default) which are allocated on any node across the cluster as no further specific options are supplied.
    * The ``srun hostname -s > hosts.$SLURM_JOB_ID`` section sets up the hostlist which is required for correct MPI task spawning in conjunction with the ``-cnf=hosts.$SLURM_JOB_ID`` argument.
    * The ``2ddp`` argument is used to specify a 2D double precision simulation. Valid values include: ``2d``, ``2ddp``, ``3d`` and ``3ddp``.
    * The argument ``$SLURM_NTASKS`` is a SLURM scheduler variable which will return the requested number of tasks.
    * The argument ``-mpi=intel`` instructs Fluent to use the Intel MPI communcation method. Consult Fluent documentation for OpenMPI instructions if applicable.
    * The argument ``-scheduler_tight_coupling``  instructs Fluent to use Slurm to efficiently and safely do task spawning.
    * The arguments ``-gu`` and ``-driver null`` instruct Fluent that it will be running with no GUI to avoid errors caused by plot / figure export.
    * The argument ``-pib.infinipath`` instructs Fluent to use the high performance Omnipath networking. 
    * The argument ``-sifile=./"$SLURM_JOBID"_fluent_server_info.txt`` tells Fluent to create a file in the working directory with the remote visualization server info.

.. code-block:: bash

    #!/bin/bash
    #SBATCH --mem-per-cpu=2000 
    #SBATCH --ntasks=4
    #SBATCH --job-name=name_fluent_mpi_4_generic
    #SBATCH --output=output_fluent_mpi_4_generic
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/2023R2

    srun hostname -s > hosts.$SLURM_JOB_ID

    fluent 2ddp -t$SLURM_NTASKS -mpi=intel -scheduler_tight_coupling -cnf=hosts.$SLURM_JOB_ID -gu -driver null  -pib.infinipath -sifile=./"$SLURM_JOBID"_fluent_server_info.txt -i test.jou


The following is the **"specific"** batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``test.jou``, and carry out a 2D double precision CFD simulation.
The script requests 4 cores (1 core per task, 1 task per node on 4 nodes) with a runtime of 60 mins and 2 GB of real memory per core.

.. hint::

    * The ``#SBATCH --nodes=4`` asks the scheduler for 4 nodes.
    * The ``#SBATCH --ntasks-per-node=1`` asks the scheduler for 1 task per node.
    * The ``#SBATCH --cpus-per-task=1`` asks the scheduler for 1 core in each task.
    
    The above combined options taken together instruct the scheduler to allocate the job resources as described above, 1 core per task, 1 task per node on 4 nodes = 4 cores. These options can be combined 
    together in other ways which may be optimal for certain Fluent models. e.g. some may benefit from higher CPU performance, greater memory bandwidth or other optimised resource requests.

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=4
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=1
    #SBATCH --mem-per-cpu=2000 
    #SBATCH --job-name=name_fluent_mpi_4_specific
    #SBATCH --output=output_fluent_mpi_4_specific
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load ANSYS/2023R2

    srun hostname -s > hosts.$SLURM_JOB_ID

    fluent 2ddp -t$SLURM_NTASKS -mpi=intel -scheduler_tight_coupling -cnf=hosts.$SLURM_JOB_ID -gu -driver null  -pib.infinipath -sifile=./"$SLURM_JOBID"_fluent_server_info.txt -i test.jou


Either job can then be submitted to the queue by typing:

.. code-block:: bash

    sbatch cfd_job.sh

---------------



.. include:: /referenceinfo/ANSYS/fluent/export-fluent-plots-while-using-batch-jobs.rst

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
