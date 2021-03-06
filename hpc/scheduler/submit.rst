.. _submit-queue:

Starting interactive jobs and submitting batch jobs
===================================================


Jobs (both interactive sessions and batch jobs) on ShARC are managed using the `Son of Grid Engine <https://arc.liv.ac.uk/trac/SGE>`_
**job scheduling software**.  You will typically see this referred to as
**SGE**, as it is one of several derivatives of `Sun Grid Engine
<https://en.wikipedia.org/wiki/Oracle_Grid_Engine>`_.

Jobs on Bessemer are managed using `Slurm <https://slurm.schedmd.com>`_ .

We typically refer to **SGE** and **Slurm** as the *scheduler*.

Both schedulers work as follows: a user requests that a *job* (task), either a script or an
interactive session, be run on the cluster and then the scheduler will take jobs from
the queue based on a set of rules and priorities.

.. _submit-interactive:

Interactive sessions
--------------------

If you wish to use a cluster for interactive work, such as running applications
like MATLAB or Ansys, or compiling software, you will need to request
interactive session from the scheduler.  The pre-requisites for this (including
connecting to the clusters) are described in :ref:`getting-started`.

There are three commands for requesting an interactive shell using SGE:

* :ref:`qrsh` - No support for graphical applications.  Standard SGE command.
* :ref:`qsh` - Supports graphical applications.  Standard SGE command.
* :ref:`qrshx` - Supports graphical applications. Superior to :ref:`qsh`.  Unique to Sheffield's clusters.

SLURM uses a single command to launch interactive jobs:

* `srun <https://slurm.schedmd.com/srun.html>`_ Standard SLURM command supporting graphical applications.

-----------

Using  interactive scheduler commands
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Usage of these commands is as follows:

**SGE:** ::

    [te1st@sharc-login1 ~]$ qrshx

**Slurm:** ::

    [te1st@bessemer-login1 ~]$ srun --pty bash -i

You can configure the resources available to the interactive session by
adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

**SGE:** ::

    [te1st@sharc-login1 ~]$ qrshx -l rmem=16G

**Slurm:** ::

    [te1st@bessemer-login1 ~]$ srun --mem=16G --pty bash -i

To start a session with access to 2 cores:

**SGE:** ::

    [te1st@sharc-login1 ~]$ qrshx -pe smp 2

**Slurm:** ::

    [te1st@bessemer-login1 ~]$ srun -c 2 --pty bash -i

The SLURM ``-c`` is cores per task, take care with your chosen number of tasks.

A table of :ref:`submit-interactive-options` is given below; any of these can be
combined together to request more resources.

.. note::

    Long running jobs *should* use the batch submission system rather than
    requesting an interactive session for a very long time. Doing this will
    lead to better cluster performance for all users.


.. _submit-interactive-options:

Common Interactive Job Options
``````````````````````````````

.. This stupidly long tail off on the table is actually important for getting the relative widths correct...

====================== ======================== ======================================================================================================================
SGE Command            Slurm Command            Description
====================== ======================== ======================================================================================================================
``-l h_rt=hh:mm:ss``   | ``-t [min]``           Specify the total maximum wall clock
                       | ``-t [days-hh:mm:ss]`` execution
                                                time for the job. The upper limit is
                                                08:00:00. NB these limits may differ
                                                for reservations /projects.

``-l rmem=xxG``        ``--mem=xxG``
                                                For **SGE** (**ShARC**),
                                                ``-l rmem=xxG``
                                                is used to specify the maximum amount
                                                (``xx``)
                                                of real memory to be requested **per
                                                CPU
                                                core**.


                                                |br| For **SLURM** (**Bessemer**),
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

``-pe <env> <nn>``                              Specify an MPI *parallel
                                                environment* and a
                                                number of processor cores.

``-pe smp <nn>``        ``-c <nn>``
                                                **For SGE** the smp parallel
                                                environment
                                                provides multiple cores on one node.
                                                ``<nn>``
                                                specifies the max number of
                                                cores.

                                                |br| **For SLURM** ``-c`` is cores per
                                                task,
                                                take care with your chosen
                                                number of tasks.

====================== ======================== ======================================================================================================================

.. _submit-batch:

Running batch jobs
------------------

The power of the clusters really comes from the *batch job* queue submission process.
Using this system, you write a script which requests various resources, initializes the computational environment and then executes your program(s).
The scheduler will run your job when resources are available.
As the task is running, the terminal output and any errors are captured and
saved to disk, so that you can see the output and verify the execution of the
task.

Any task that can be executed without any user intervention while it is running
can be submitted as a batch job. This excludes jobs that require a
Graphical User Interface (GUI), however, many common GUI applications such as Ansys or MATLAB can also be
used without their GUIs.

When you submit a batch job, you provide an executable script file that will be executed by
the scheduler. This is normally a bash script file which provides commands and
options to the program you are using.

There is a single command to submit jobs via SGE:

* :ref:`qsub` - Standard SGE command with no support for interactivity or graphical applications.

SLURM also uses a single command to submit batch jobs:

* `sbatch <https://slurm.schedmd.com/sbatch.html>`_ Standard SLURM command with no support for interactivity or graphical applications.


These scripts are executed by the qsub and sbatch commands as below:


Using  batch scheduler commands
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**SGE** ::

    qsub myscript.sh

**Slurm** ::

    sbatch myscript.sh

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

To use Slurm the equivalent batch submission script would be:

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
* **SGE** Scheduler options, such as the amount of memory requested, start with ``#$``
* **Slurm** Scheduler options start with ``#SBATCH``

* You will often require one or more ``module`` commands in your submission file.
  These make programs and libraries available to your scripts.
  Many applications and libraries are available as modules on
  :ref:`ShARC <sharc-software>`, :ref:`Bessemer <bessemer-software>`.


Here is a more complex example that requests more resources:

Using **SGE:**

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

Using **Slurm:**

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


Scheduler Options
-----------------

.. This stupidly long tail off on the table is actually important for getting the relative widths correct...

====================== ======================== ======================================================================================================================
SGE Command            Slurm Command            Description
====================== ======================== ======================================================================================================================
``-l h_rt=hh:mm:ss``   | ``-t [min]``           Specify the total maximum wall clock
                       | ``-t [days-hh:mm:ss]`` execution time for the job. The
                                                upper limit is typically 96:00:00
                                                (4 days) on ShARC
                                                and 168:00:00 (7 days) on Bessemer.
                                                |br| |br| Note that these
                                                limits may differ for specific
                                                Projects/Queues.
                                                Also note that requesting less
                                                execution time may
                                                result in your job spending less
                                                time queuing.

``-pe <env> <nn>``     n/a                      Specify a *parallel environment*
                                                and a number of
                                                processor cores.

``-pe smp <nn>``       ``-c <nn>``
                                                **For SGE** the smp parallel
                                                environment
                                                provides multiple cores on one node.
                                                ``<nn>``
                                                specifies the max number of
                                                cores.

                                                |br| **For SLURM** ``-c`` is cores per
                                                task,
                                                take care with your chosen
                                                number of tasks.

``-l rmem=xxG``        ``--mem=xxG``
                                                For **SGE** (**ShARC**),
                                                ``-l rmem=xxG``  is used to specify
                                                the
                                                maximum amount (``xx``) of real
                                                memory to be requested
                                                **per CPU core**.


                                                |br| For **SLURM** (**Bessemer**),
                                                ``--mem=xxG``  is used to specify
                                                the
                                                maximum amount (``xx``) of real
                                                memory to be requested
                                                **per node**.


                                                If the real memory usage of your
                                                job exceeds this value
                                                multiplied by the number of cores
                                                / nodes you requested then
                                                your job will be killed.

``-l arch=``           n/a                      Target a processor architecture.
                                                Note that all public nodes
                                                in ShARC use the same model of
                                                processor.

``-N``                 ``--job-name=``          Job name, used to name output
                                                files and in the queue list.

``-j y[es]|n[o]``      ``-o [filename]``        Join the error and normal output
                                                into one file rather
                                                than two.

``-M``                 ``--mail-user=``         Email address to send notifications
                                                to.

``-m bea``             ``--mail-type=all``      Type of notifications to send.
                                                For SGE can be any combination of
                                                begin (``b``) end (``e``) or abort
                                                (``a``) i.e.
                                                ``-m ea`` for end and abortion
                                                messages.


``-a``                 ``--begin=``             Specify the earliest time for a
                                                job to start
                                                SGE format:  ``[YYMMDDhhmm]``
                                                Slurm format:
                                                ``YYYY-MM-DD[HH:MM[:SS]]``

``-wd working_dir``    ``--workdir=``           Execute  the  job  from  the
                                                directory  specified

``-l excl=true``       ``--exclusive``          Request exclusive access to all
                                                nodes used by the job so
                                                no other jobs can run on them.
                                                This can be useful for
                                                benchmarking purposes where you
                                                want to ensure that you
                                                have exclusive use of e.g.
                                                memory/IO buses. |br| |br| Note that
                                                you still need to request CPU
                                                cores and memory to avoid
                                                being limited to just the
                                                default per job (one core
                                                and a set amount of RAM).  Also
                                                note that the use of
                                                this option will likely result in
                                                longer queuing times.

``-l hostname=``       ``--nodelist=``          Target a node by name. Not
                                                recommended for normal use.

====================== ======================== ======================================================================================================================

The `Slurm docs <https://slurm.schedmd.com/sbatch.html>`_ have a complete list of available ``sbatch`` options.


.. include:: ../../referenceinfo/scheduler/SGE/sge_parallel_environments.rst


Frequently Asked SGE Questions
------------------------------
**How many jobs can I submit at any one time**

You can submit up to 2000 jobs to the cluster, and the scheduler will allow up to 200 of your jobs to run simultaneously (we occasionally alter this value depending on the load on the cluster).

**How do I specify multiple email addresses for SGE job notifications?**

Specify each additional email with its own ``-M`` option ::

  #$ -M foo@example.com
  #$ -M bar@example.com

**I want email notifications but don't want to have to include my email address in every job submission script**

Create a file called ``.sge_request`` in the directory you submit your jobs from containing: ::

    -M my.personal@email.com -M my.work@sheffield.ac.uk

The ``-M`` parameter will be automatically supplied for all future job submissions.
Note that you still need to request email notifications using ``-m`` (see above).

**How do you ensure that an SGE job starts after a specified time?**

Add the following line to your submission script ::

    #$ -a time

but replace ``time`` with a time in the format ``MMDDhhmm``.

For example, for 22nd July at 14:10, you'd do ::

    #$ -a 07221410

This won't guarantee that it will run precisely at this time since that depends on available resources. It will, however, ensure that the job runs *after* this time. If your resource requirements aren't too heavy, it will be pretty soon after. When I tried it, it started about 10 seconds afterwards but this will vary.
