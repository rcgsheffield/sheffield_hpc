.. _job_submission_control:

Job Submission and Control
==========================

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

    ./*

Introduction
------------

As mentioned in the :ref:`what is HPC section <what_is_hpc>`, HPC clusters like :ref:`ShARC <sharc>`,
:ref:`Bessemer <Bessemer>` and :ref:`Stanage <stanage>` use a program called a scheduler to control and submit work to 
appropriate nodes.

    All user work is dispatched to a cluster using a tool called a job scheduler. 
    A job scheduler is a tool used to manage, submit and fairly queue users' 
    jobs in the shared environment of a HPC cluster. A cluster will normally use a 
    single scheduler and allow a user to request either an immediate interactive job, 
    or a queued batch job.

Here at the University of Sheffield, we use 2 different schedulers, the :ref:`SGE scheduler <sge_info>` on ShARC 
and the more modern :ref:`SLURM scheduler <slurm_info>` on Bessemer and Stanage. Both have the same purpose, use similar 
commands and work on the same three basic principles:

* they allocate exclusive and/or non-exclusive access to resources (compute nodes) to users for some duration of time so they can perform work,
* they provide a framework for starting, executing, and monitoring work on the set of allocated nodes,
* they arbitrate contention for resources by managing a queue of pending work.

--------

Key Concepts 
------------

.. tip::

    If you are not familiar with basic computer architecture we **highly recommend** reading our 
    :ref:`General Computer Architecture Quick Start page <general_computer_architecture_quickstart>` 
    before continuing.

When engaging with our documentation several concepts must be well understood with reference to 
schedulers and jobs which will be explained below:

Types of Job
^^^^^^^^^^^^

There are two types of job on any scheduler, **interactive** and **batch**:

**Interactive** jobs are ones where they are requested and immediately run providing the user 
with a bash shell (or a shell of their choosing) in which they can then run their software or 
scripts in.

Typically only very few nodes in a HPC cluster are dedicated solely to interactive jobs and 
interactive jobs require the resources to be available instantenously as the request is made 
or the request will fail. This means that interactive requests cannot always be fulfilled, 
particularly when requesting multiple cores.

**Batch** jobs are the other kind of job where a user prepares a batch submission script which 
both requests the resources for the job from the scheduler and contains the execution commands 
for a given program to run. On job submission, the scheduler will add it to the chosen queue and 
run your job when resources become available. 

Any task that can be executed without any user intervention while it is running can be submitted as 
a batch job. This excludes jobs that require a Graphical User Interface (GUI), however, many common 
GUI applications such as ANSYS or MATLAB can also be used without their GUIs.

If you wish to use a cluster for interactive work and/or running applications like MATLAB or ANSYS 
using GUIs, you will need to request an interactive job from the scheduler.

If you wish to use a cluster to dispatch a very large ANSYS model you will need to request
batch job from the scheduler and prepare an appropriate batch script.

.. note::

    Long running jobs *should* use the batch submission system rather than
    requesting an interactive session for a very long time. Doing this will
    lead to better cluster performance for all users.



Queues and partitions
^^^^^^^^^^^^^^^^^^^^^

Queues or partitions (in SLURM) are queues of jobs submitted to a scheduler for it to run.
They can have an assortment of constraints such as job size limit, job time limit, users 
permitted to use it and some nodes will be configured to accept jobs only from certain queues 
e.g. Department specific nodes. 

All jobs are dispatchable
^^^^^^^^^^^^^^^^^^^^^^^^^

When a user requests that a job, (either a batch or an interactive session), is 
ran on the cluster, the scheduler will run jobs from the queue based 
on a set of rules, priorities and availabilities.

How and where a job can run are set when the job is requested based on the resource 
amounts requested as well as the chosen queue (assuming a user has permissions to use a queue.)

This means that not all interactive jobs are possible as the resources may not be available. It 
also means that the amount of time it takes for any batch job to run is dependent on how large the job 
resource request is, which queue it is in, what resources are available in that queue and 
how much previous resource usage the user has. The larger a resource request is, the longer it will 
take to wait for those resources to become available and the longer it will take for subsequent jobs 
to queue as a result of the fair scheduling algorithm.

Fair scheduling
^^^^^^^^^^^^^^^

Job schedulers are typically configured to use a fair-share / wait time system. In short, the scheduler assesses 
your previous CPU time and memory time (consumption) to give a requested job a priority. Subsequently it uses how 
long your job has had to wait in order to bump up that priority. Once your job is the highest priority, the job will 
then run when the requested resources become available on the system. Your running total for CPU time / memory time usage 
will decay over time but in general the more resources you request and for longer, the lower your initial job priority 
gets and the longer you have to wait behind other people's jobs.

If you are seeing one job start and another immediately begin this is not an intentional chaining setting on the scheduler's 
part. This is quite likely simply a reflection of your subsequent jobs waiting for resources to become available and it just so 
happens that your running job finishes freeing up the resources for the next.

As a natural consequence of backfilling into any trapped resources - you may see small time, memory and core request jobs with a 
lower priority running before your own with a higher priority. This is because they are small enough to utilize the trapped resource 
before the job trapping those resources is finished. This is not unfair and it would be inefficient and irresponsible for us to 
intentionally block a job from running simply because the priority is lower than a larger job that won't fit in that trapped resource.

--------


.. _submit_job_bessemer:

Job Submission / Control on Bessemer
------------------------------------

.. _submit_interactive_bessemer:

Interactive Jobs
^^^^^^^^^^^^^^^^


SLURM uses a single command to launch interactive jobs:

* :ref:`srun` Standard SLURM command supporting graphical applications.

Usage of the command is as follows:

.. code-block:: console

    $ srun --pty bash -i

You can configure the resources available to the interactive session by adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

.. code-block:: console

    $ srun --mem=16G --pty bash -i

To start a session with access to 2 cores, use **either**:

.. code-block:: console

    $ srun --cpus-per-task=2 --pty bash -i #2 cores per task, 1 task and 1 node per job default. Preferred!
    $ srun --ntasks-per-node=2 --pty bash -i #2 tasks per node, 1 core per task and 1 node per job default.

Please take care with your chosen options as usage in concert with other options
can be multiplicative.

A further explanation of why you may use the tasks options or cpus options can be found :ref:`here<slurm_tasks_vs_cpus_per_task_bessemer>`.

A table of common interactive job options is given below; any of these can be
combined together to request more resources.

==================================== =======================================================================
Slurm Command                        Description
==================================== =======================================================================
``-t min`` or ``-t days-hh:mm:ss``   Specify the total maximum wall clock execution time for the job. 
                                     The upper limit is 08:00:00. **Note:** these limits may differ
                                     for reservations /projects.

``--mem=xxG``                        |br| 
                                     ``--mem=xxG`` is used to specify the maximum amount (``xx``)
                                     of real memory to be requested **per node**.
 
 
                                     |br| If the real memory usage of your job exceeds this value 
                                     multiplied by the number of cores / nodes you requested then your
                                     job will be killed.

``-c nn`` or ``--cpus-per-task=nn``
                                     |br| ``-c`` is cores per task, take care with your chosen
                                     number of tasks.

``--ntasks-per-node=nn``
                                     |br| ``--ntasks-per-node=`` is tasks per node, take care with your 
                                     chosen number of cores per node. The default is one task per node, 
                                     but note that other options can adjust the default of 1 core per task 
                                     e.g. ``--cpus-per-task``. 
==================================== =======================================================================

.. _sattach_interactive_bessemer:

Rejoining an interactive job
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If we lose connection to an interactive job, we can use the ``sattach`` command which attaches to a running Slurm job step.
Just keep in mind that ``sattach`` doesn't work for external or batch steps, as they aren't 
set up for direct attachment.

Example:

.. code-block:: console

    [te1st@bessemer-login1 ~]$ squeue --me
            JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            833300 interacti     bash   te1st  R      31:22      1 node001
    [te1st@bessemer-login1 ~]$ sattach 833300.0 
    [te1st@bessemer-node001 ~]$ echo $SLURM_JOB_ID
    833300

Here we attached to SLURM job 833300 step 0. For more information type ``man sattach``

.. _submit_batch_bessemer:

Batch Jobs
^^^^^^^^^^

.. tip::

    Batch jobs have larger resource limits than interactive jobs! For guidance on what these 
    limits are and how best to select resources please see our :ref:`Choosing appropriate compute resources <Choosing-appropriate-compute-resources>` page.

SLURM uses a single command to submit batch jobs:

* :ref:`sbatch` Standard SLURM command with no support for interactivity or graphical applications.

The `Slurm docs <https://slurm.schedmd.com/sbatch.html>`_ have a complete list of available ``sbatch`` options.

The batch submission scripts are executed for submission as below:

.. code-block:: sh

    sbatch submission.sh

Note the job submission number. For example:

.. code-block:: sh

    Submitted batch job 1226

You can check your output log or error log file as below:

.. code-block:: sh

    cat JOB_NAME-1226.out

There are numerous further options you can request in your batch submission files which are 
detailed below:

Name your job submission:

.. code-block:: sh

    #SBATCH --job-name=JOB_NAME

Specify a number of nodes:

.. code-block:: sh

    #SBATCH --nodes=1

.. warning::
    
    Note that the Bessemer free queues do not permit the use of more than 1 node per job.

Specify a number of tasks per node:

.. code-block:: sh

    #SBATCH --ntasks-per-node=4

Specify a number of tasks:

.. code-block:: sh

    #SBATCH --ntasks=4

Specify a number of cores per task:

.. code-block:: sh

    #SBATCH --cpus-per-task=4

Request a specific amount of memory **per job**:

.. code-block:: sh

    #SBATCH --mem=16G

Specify the job output log file name:

.. code-block:: sh

    #SBATCH --output=output.%j.test.out

Request a specific amount of time:

.. code-block:: sh

    #SBATCH --time=00:30:00

Request job update email notifications:

.. code-block:: sh

    #SBATCH --mail-user=username@sheffield.ac.uk

For the full list of the available options please visit the SLURM manual webpage for 
sbatch here: https://slurm.schedmd.com/sbatch.html

Here is an example SLURM batch submission script that runs a fictitious program called ``foo``:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #SBATCH --mem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

.. _slurm_tasks_vs_cpus_per_task_bessemer:

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``.
* It is always best to fully specify job's resources with your submission script.
* All **Slurm** Scheduler options start with ``#SBATCH``
* You should use the SLURM option ``--ntasks=nn`` Number of "tasks", for programs using distributed 
  parallelism (:ref:`MPI<parallel_MPI>`).
* You should use the SLURM option ``--ntasks-per-node=nn`` Number of "tasks per node", for programs 
  using distributed parallelism (:ref:`MPI<parallel_MPI>`). Note that the Bessemer free queues do not 
  permit the use of more than 1 node per job.
* You should use the SLURM option ``--cpus-per-task=nn`` Number of "cores per task", for programs using 
  shared memory parallelism (:ref:`SMP<parallel_SMP>` or :ref:`openmp<parallel_SMP>`).
* You will often require one or more ``module`` commands in your submission file to make programs and 
  libraries available to your scripts. Many applications and libraries are available as modules on 
  :ref:`Bessemer <bessemer-software>`.

Here is a more complex :ref:`SMP<parallel_SMP>` example that requests more resources:

.. code-block:: bash

    #!/bin/bash
    # Request 16 gigabytes of real memory (RAM) 4 cores *4G = 16
    #SBATCH --mem=16G
    # Request 4 cores
    #SBATCH --cpus-per-task=4
    # Email notifications to me@somedomain.com
    #SBATCH --mail-user=me@somedomain.com
    # Email notifications if the job fails
    #SBATCH --mail-type=FAIL
    # Change the name of the output log file.
    #SBATCH --output=output.%j.test.out
    # Rename the job's name
    #SBATCH --job-name=my_smp_job


    # Load the modules required by our program
    module load compilers/gcc/5.2
    module load apps/gcc/foo

    # Set the OPENMP_NUM_THREADS environment variable to 4
    # This is needed to ensure efficient core usage.
    export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

.. tip::

    Bessemer currently supports running preemptable jobs. These are jobs which have been set to run in a reserved queue's node when those nodes are idle. These reserved queues 
    are typically :ref:`private (research group-owned or dept-owned) nodes <groupnodes_bessemer>`,
    but these resources will be reclaimed (and the associated jobs preempted) if
    members of those groups/departments submit jobs that can only start if those resources are repurposed.

    For more details on running preemptable jobs on Bessemer please see: :ref:`preemptable_jobs_bessemer`

Monitoring running Jobs
^^^^^^^^^^^^^^^^^^^^^^^

There are two commands to monitor running and queued jobs:

* :ref:`sstat`
* :ref:`squeue`

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/squeue_usage_import.rst


.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/sstat_usage_import.rst

Stopping or cancelling Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jobs can be stopped or cancelled using the ``scancel`` command:

* :ref:`scancel`

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/scancel_usage_import.rst

Investigating finished Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jobs which have already finished can be investigated using the ``seff`` script:

* :ref:`seff` 

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/seff_usage_import.rst


Or in even more depth using the ``sacct`` command:

* :ref:`sacct` 

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/sacct_usage_import.rst

.. _job_debugging_bessemer:

Debugging failed Jobs
^^^^^^^^^^^^^^^^^^^^^

If one of your jobs has failed and you need to debug why this has occured you should consult the 
job records held by the scheduler with the :ref:`sacct` referenced above as well as the generated 
job logs.
 
These output and error log files will be generated in the job working directory with the job name or 
output log file name as of the form ``slurm-$JOBID.out`` where ``$JOBID`` is the scheduler provided job id. 
Looking at these logs should indicate the source of any issues.

:ref:`sacct` will also give a job's **state** and **ExitCode** field with each job.

The **ExitCode** is the return value of the exiting program/script. It can be a user defined value if the 
job is finished with a call to 'exit(number)'. Any non-zero exit code will be assumed to be a job failure 
and will result in a Job State of FAILED with a Reason of "NonZeroExitCode".

The job logs may also include a "derived exit code" field. This is set to the value of the highest exit code returned by 
all of the job's steps (srun invocations). 

--------

.. _submit_job_stanage:

Job Submission / Control on Stanage
-----------------------------------

.. tip::

    The Stanage cluster has been configured to have the same default resource request limits as the ShARC cluster. 
    Please see our :ref:`Choosing appropriate compute resources page <Choosing-appropriate-compute-resources>` for further information.


.. _submit_interactive_stanage:

Interactive Jobs
^^^^^^^^^^^^^^^^


SLURM uses a single command to launch interactive jobs:

* :ref:`srun` Standard SLURM command supporting graphical applications.

Usage of the command is as follows:

.. code-block:: console

    $ srun --pty bash -i

You can configure the resources available to the interactive session by adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

.. code-block:: console

    $ srun --mem=16G --pty bash -i

To start a session with access to 2 cores, use **either**:

.. code-block:: console

    $ srun --cpus-per-task=2 --pty bash -i #2 cores per task, 1 task and 1 node per job default. Preferred!
    $ srun --ntasks-per-node=2 --pty bash -i #2 tasks per node, 1 core per task and 1 node per job default.

Please take care with your chosen options as usage in concert with other options
can be multiplicative.

A further explanation of why you may use the tasks options or cpus options can be found :ref:`here<slurm_tasks_vs_cpus_per_task_stanage>`.

A table of common interactive job options is given below; any of these can be
combined together to request more resources.

==================================== =======================================================================
Slurm Command                        Description
==================================== =======================================================================
``-t min`` or ``-t days-hh:mm:ss``   Specify the total maximum wall clock execution time for the job. 
                                     The upper limit is 08:00:00. **Note:** these limits may differ
                                     for reservations /projects.

``--mem=xxG``                        |br| 
                                     ``--mem=xxG`` is used to specify the maximum amount (``xx``)
                                     of real memory to be requested **per node**.
 
 
                                     |br| If the real memory usage of your job exceeds this value 
                                     multiplied by the number of cores / nodes you requested then your
                                     job will be killed.

``-c nn`` or ``--cpus-per-task=nn``
                                     |br| ``-c`` is cores per task, take care with your chosen
                                     number of tasks.

``--ntasks-per-node=nn``
                                     |br| ``--ntasks-per-node=`` is tasks per node, take care with your 
                                     chosen number of cores per node. The default is one task per node, 
                                     but note that other options can adjust the default of 1 core per task 
                                     e.g. ``--cpus-per-task``. 
==================================== =======================================================================

.. _sattach_interactive_stanage:

Rejoining an interactive job
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If we lose connection to an interactive job, we can use the ``sattach`` command which attaches to a running Slurm job step.
Just keep in mind that ``sattach`` doesn't work for external or batch steps, as they aren't 
set up for direct attachment.

Example:

.. code-block:: console

    [te1st@login1 [stanage] ~]$ squeue --me
            JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            833300 interacti     bash   te1st  R      31:22      1 node001
    [te1st@login1 [stanage] ~]$ sattach 833300.0 
    [te1st@node001 [stanage] ~]$ echo $SLURM_JOB_ID
    833300

Here we attached to SLURM job 833300 step 0. For more information type ``man sattach``

.. _submit_batch_stanage:

Batch Jobs
^^^^^^^^^^

.. tip::

    Batch jobs have larger resource limits than interactive jobs! For guidance on what these 
    limits are and how best to select resources please see our :ref:`Choosing appropriate compute resources <Choosing-appropriate-compute-resources>` page.

SLURM uses a single command to submit batch jobs:

* :ref:`sbatch` Standard SLURM command with no support for interactivity or graphical applications.

The `Slurm docs <https://slurm.schedmd.com/sbatch.html>`_ have a complete list of available ``sbatch`` options.

The batch submission scripts are executed for submission as below:

.. code-block:: sh

    sbatch submission.sh

Note the job submission number. For example:

.. code-block:: sh

    Submitted batch job 1226

You can check your output log or error log file as below:

.. code-block:: sh

    cat JOB_NAME-1226.out

There are numerous further options you can request in your batch submission files which are 
detailed below:

Name your job submission:

.. code-block:: sh

    #SBATCH --job-name=JOB_NAME

Specify a number of nodes:

.. code-block:: sh

    #SBATCH --nodes=1

Specify a number of tasks per node:

.. code-block:: sh

    #SBATCH --ntasks-per-node=4

Specify a number of tasks:

.. code-block:: sh

    #SBATCH --ntasks=4

Specify a number of cores per task:

.. code-block:: sh

    #SBATCH --cpus-per-task=4

Request a specific amount of memory **per node**:

.. code-block:: sh

    #SBATCH --mem=16G

Request a specific amount of memory **per CPU core**:

.. code-block:: sh

    #SBATCH --mem-per-cpu=16G

Specify the job output log file name:

.. code-block:: sh

    #SBATCH --output=output.%j.test.out

Request a specific amount of time:

.. code-block:: sh

    #SBATCH --time=00:30:00

Request job update email notifications:

.. code-block:: sh

    #SBATCH --mail-user=username@sheffield.ac.uk

For the full list of the available options please visit the SLURM manual webpage for 
sbatch here: https://slurm.schedmd.com/sbatch.html

Here is an example SLURM batch submission script that runs a fictitious program called ``foo``:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #SBATCH --mem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

.. _slurm_tasks_vs_cpus_per_task_stanage:

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``.
* It is always best to fully specify job's resources with your submission script.
* All **Slurm** Scheduler options start with ``#SBATCH``
* You should use the SLURM option ``--ntasks=nn`` Number of "tasks", for programs using distributed 
  parallelism (:ref:`MPI<parallel_MPI>`).
* You should use the SLURM option ``--ntasks-per-node=nn`` Number of "tasks per node", for programs 
  using distributed parallelism (:ref:`MPI<parallel_MPI>`).
* You should use the SLURM option ``--cpus-per-task=nn`` Number of "cores per task", for programs using 
  shared memory parallelism (:ref:`SMP<parallel_SMP>` or :ref:`openmp<parallel_SMP>`).
* You will often require one or more ``module`` commands in your submission file to make programs and 
  libraries available to your scripts. 


-----

Cluster job resource limits
---------------------------

While the Sheffield cluster have very large amounts of resources to use for your jobs there 
are limits applied in order for the schedulers to function.  The limits below apply to the default 
free queues. Other queues may have different settings.

.. warning::

    You must ensure that your jobs do not attempt to exceed these limits as the schedulers are not 
    forgiving and will summarily kill any job which exceeds the requested limits without warning. 

CPU Limits
^^^^^^^^^^

Please note that the CPU limits do depend on the chosen :ref:`parallel <parallel>` environment for ShARC 
jobs, with SMP type jobs limited to a maximum of 16 cores in either job type. Please also note that interactive 
jobs with more than 16 cores are only available in the MPI parallel environment 

.. warning::

    Please note that for either cluster the larger the number of cores you request in an interactive job the more 
    likely the request is to fail as the requested resource is not immediately available.

.. include:: /referenceinfo/imports/scheduler/cpu_allocation_limits_table_import.rst

Time Limits
^^^^^^^^^^^

.. include:: /referenceinfo/imports/scheduler/time_allocation_limits_table_import.rst

Memory Limits
^^^^^^^^^^^^^

.. include:: /referenceinfo/imports/scheduler/memory_allocation_limits_table_import.rst


Advanced / Automated job submission and management
--------------------------------------------------

Further information on advanced or automated job submission and management can be found on our dedicated page: :ref:`advanced_job_submission_control` 

Reference information and further resources
-------------------------------------------

Quick reference information for the SGE scheduler (ShARC), Bessemer scheduler (SLURM) and Stanage scheduler can be 
found in the :ref:`scheduler-reference-info` section.

Stanford Research Computing Center provide a `SGE to SLURM conversion guide <https://srcc.stanford.edu/sge-slurm-conversion>`_.
