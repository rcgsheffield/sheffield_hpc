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

As mentioned in the :ref:`what is HPC section <what_is_hpc>`, HPC clusters like :ref:`ShARC <sharc>` 
or :ref:`Bessemer <Bessemer>` use a program called a scheduler to control and submit work to 
appropriate nodes.

    All user work is dispatched to a cluster using a tool called a job scheduler. 
    A job scheduler is a tool used to manage, submit and fairly queue users' 
    jobs in the shared environment of a HPC cluster. A cluster will normally use a 
    single scheduler and allow a user to request either an immediate interactive job, 
    or a queued batch job.

Here at the University of Sheffield, we use 2 different schedulers, the :ref:`SGE scheduler <sge_info>` on ShARC 
and the more modern :ref:`SLURM scheduler <slurm_info>` on Bessemer. Both have the same purpose, use similar 
commands and work on the same three basic principles:

* they allocate exclusive and/or non-exclusive access to resources (compute nodes) to users for some duration of time so they can perform work,
* they provide a framework for starting, executing, and monitoring work on the set of allocated nodes,
* they arbitrate contention for resources by managing a queue of pending work.

Key Concepts 
------------

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

When a user requests that a job, (either a batch or an interactive session), to 
be run on the cluster and then the scheduler will run jobs from the queue based 
on a set of rules and priorities.

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

Job schedulers are typically configured to use a fair-share / wait time system. Inshort - the scheduler assesses 
your previous CPU time and memory time (consumption) to give a requested job  a priority. Subsequently it uses how 
long your job has had to wait in order to bump up that priority. Once your job is the highest priority, the job will 
then run when the requested resources become available on the system. Your running total for CPU time / memory time usage 
will decay overtime but in general the more resources you request and for longer, the lower your initial job priority 
gets and the longer you have to wait behind other peoples jobs.

If you are seeing one job start and another immediately begin this is not an intentional chaining setting on the scheduler's 
part. This is quite likely simply a reflection of your subsequent jobs waiting for resources to become available and it just so 
happens that your running job finishes freeing up the resources for the next.

As a natural consequence of backfilling into any trapped resources - you may see small time, memory and core request jobs with a 
lower priority running before your own with a higher priority. This is because they are small enough to utilize the trapped resource 
before the job trapping those resources is finished. This is not unfair and it would be inefficient and irresponsible for us to 
intentionally block a job from running simply because the priority is lower than a larger job that won't fit in that trapped resource.


Job Submission / Control on ShARC
---------------------------------

.. _submit_interactive_sharc:

Interactive Jobs
^^^^^^^^^^^^^^^^

There are three commands for requesting an interactive shell using SGE:

* :ref:`qrsh` - No support for graphical applications.  Standard SGE command.
* :ref:`qsh` - Supports graphical applications.  Standard SGE command.
* :ref:`qrshx` - Supports graphical applications. Superior to :ref:`qsh` and is unique to Sheffield's clusters.

Usage of these commands is as follows:

.. code-block:: console

    $ qrshx

You can configure the resources available to the interactive session by adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

.. code-block:: console

    $ qrshx -l rmem=16G

To start a session with access to 2 cores in the SMP parallel environment:

.. code-block:: console

    $ qrshx -pe smp 2



A table of common interactive job options is given below; any of these can be
combined together to request more resources.

======================  ======================================================================================================================
SGE Command             Description
======================  ======================================================================================================================
``-l h_rt=hh:mm:ss``    Specify the total maximum wall clock
                        execution
                        time for the job. The upper limit is
                        08:00:00. NB these limits may differ
                        for reservations /projects.

``-l rmem=xxG``         
                        
                        ``-l rmem=xxG``
                        is used to specify the maximum amount
                        (``xx``)
                        of real memory to be requested **per
                        CPU core**.


                        If the real memory usage of your
                        job exceeds
                        this value multiplied by the number
                        of cores
                        / nodes you requested then your
                        job will be
                        killed.

``-pe <env> <nn>``      Specify an MPI *parallel
                        environment* and a
                        number of processor cores.

``-pe smp <nn>``
                        The smp parallel
                        environment
                        provides multiple cores on one node.
                        ``<nn>``
                        specifies the max number of
                        cores.

======================  ======================================================================================================================

Note that ShARC has multiple :ref:`parallel environments <parallel>`, the current parallel environments can 
be found on the `ShARC Parallel Environments <../../referenceinfo/scheduler/SGE/sge_parallel_environments.html>`_ page.

.. _submit_batch_sharc:

Batch Jobs
^^^^^^^^^^

There is a single command to submit jobs via SGE:

* :ref:`qsub` - Standard SGE command with no support for interactivity or graphical applications.

The batch submission scripts are executed for submission as below:

.. code-block:: console

    $ qsub myscript.sh

Here is an example SGE batch submission script that runs a fictitious program called ``foo``:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #$ -l rmem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo < foo.dat > foo.res

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``
* **SGE** Scheduler options, such as the amount of memory requested, start with ``#$``


* You will often require one or more ``module`` commands in your submission file.
  These make programs and libraries available to your scripts.
  Many applications and libraries are available as modules on
  :ref:`ShARC <sharc-software>`.

Here is a more complex example that requests more resources:

.. code-block:: bash

    #!/bin/bash
    # Request 16 gigabytes of real memory (RAM) 4 cores *4G = 16
    #$ -l rmem=4G
    # Request 4 cores in an OpenMP environment
    #$ -pe openmp 4
    # Email notifications to me@somedomain.com
    #$ -M me@somedomain.com
    # Email notifications if the job aborts
    #$ -m a

    # Load the modules required by our program
    module load compilers/gcc/5.2
    module load apps/gcc/foo

    # Set the OPENMP_NUM_THREADS environment variable to 4
    export OMP_NUM_THREADS=4

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

Monitoring running Jobs
^^^^^^^^^^^^^^^^^^^^^^^

Stopping or cancelling Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Investigating finished Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

To start a session with access to 2 cores:

.. code-block:: console

    $ srun -c 2 --pty bash -i

The SLURM ``-c`` is cores per task, take care with your chosen number of tasks.

A table of common interactive job options is given below; any of these can be
combined together to request more resources.

======================== ======================================================================================================================
Slurm Command            Description
======================== ======================================================================================================================
``-t [min]``             Specify the total maximum wall clock
``-t [days-hh:mm:ss]``   execution
                         time for the job. The upper limit is
                         08:00:00. NB these limits may differ
                         for reservations /projects.

``-l rmem=xxG``          |br| 
                         ``--mem=xxG``
                         is used to specify the maximum
                         amount (``xx``)
                         of real memory to be requested
                         **per node**.


                         If the real memory usage of your
                         job exceeds
                         this value multiplied by the number
                         of cores
                         / nodes you requested then your
                         job will be
                         killed.

``-c <nn>``

                         |br| ``-c`` is cores per
                         task,
                         take care with your chosen
                         number of tasks.

======================== ======================================================================================================================

.. _submit_batch_bessemer:

Batch Jobs
^^^^^^^^^^

SLURM uses a single command to submit batch jobs:

* :ref:`sbatch` Standard SLURM command with no support for interactivity or graphical applications.

The `Slurm docs <https://slurm.schedmd.com/sbatch.html>`_ have a complete list of available ``sbatch`` options.

The batch submission scripts are executed for submission as below:

.. code-block:: console

    $ sbatch myscript.sh


For Slurm an example batch submission script could be:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #SBATCH --mem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo < foo.dat > foo.res

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``
* **Slurm** Scheduler options start with ``#SBATCH``

* You will often require one or more ``module`` commands in your submission file.
  These make programs and libraries available to your scripts.
  Many applications and libraries are available as modules on :ref:`Bessemer <bessemer-software>`.

Here is a more complex example that requests more resources:


.. code-block:: bash

    #!/bin/bash
    # Request 16 gigabytes of real memory (RAM) 4 cores *4G = 16
    #SBATCH --mem=16G
    # Request 4 cores
    #SBATCH -c 4
    # Email notifications to me@somedomain.com
    #SBATCH --mail-user=me@somedomain.com
    # Email notifications if the job fails
    #SBATCH --mail-type=FAIL

    # Load the modules required by our program
    module load compilers/gcc/5.2
    module load apps/gcc/foo

    # Set the OPENMP_NUM_THREADS environment variable to 4
    export OMP_NUM_THREADS=4

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res



Monitoring running Jobs
^^^^^^^^^^^^^^^^^^^^^^^

Stopping or cancelling Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Investigating finished Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^




Advanced job submission and management
--------------------------------------

The Distributed Resource Management Application API (DRMAA) is available on both clusters which 
can be used with advanced scripts or a Computational Pipeline manager (such as `Ruffus <http://www.ruffus.org.uk/>`_)

For further detail see our guide to the :ref:`drmaa` API.

Reference information and further resources
-------------------------------------------

Quick reference information for the SGE scheduler (ShARC) and Bessemer scheduler (SLURM) can be 
found in the :ref:`scheduler-reference-info` section.

Stanford Research Computing Center provide a `SGE to SLURM conversion guide <https://srcc.stanford.edu/sge-slurm-conversion>`_.