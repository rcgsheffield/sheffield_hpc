.. _sge-queue:

Iceberg's Queue System
======================

To manage use of the Iceberg cluster, there is a queue system
(`SoGE <https://arc.liv.ac.uk/trac/SGE>`_, a derivative of the Sun Grid Engine).

The queue system works by a user requesting some task, either a script or an
interactive session, be run on the cluster and then the scheduler will take
tasks from the queue based on a set of rules and priorities.


.. _sge-interactive:

Using Iceberg Interactively
---------------------------

If you wish to use the cluster for interactive use, such as running applications
such as MATLAB or Ansys, or compiling software, you will need to requeuest that
the scheduler gives you an interactive session. For an introduction to this see
:ref:`getting-started`.

There are two commands which give you an interactive shell::

    [te1st@iceberg-login2 ~]$ qsh

and::

    [te1st@iceberg-login2 ~]$ qrsh

``qsh`` will open a separate xterm terminal and supports running graphical
applications. qrsh gives a shell running on a worker node inside the currently
open terminal, it does not support graphical applications because it has no
X server forwarding configured.

You can configure the resources available to the interactive session by
specifying them as command line options to the qsh or qrsh commands.
For example to run a ``qsh`` session with access to 16 GB of virtual RAM::


    [te1st@iceberg-login2 ~]$ qsh -l mem=16G

or a session with access to 8 cores::

    [te1st@iceberg-login2 ~]$ qsh -pe openmp 8

A table of :ref:`sge-interactive-options` is given below, any of these can be
combined together to request more resources.

.. note::

    Long running jobs *should* use the batch submission system rather than
    requesting an interactive session for a very long time. Doing this will
    lead to better cluster performance for all users.


.. _sge-interactive-options:

Common Interactive Job Options
``````````````````````````````

====================== ========================================================
Command                Description
====================== ========================================================
-l h_rt=hh:mm:ss       Specify the total maximum execution time for the job.

-l mem=xxG             Specify the maximum amount (xx) of memory to be used
                       (per process or core).

-pe <env> <nn>         Specify a parallel environment and number of processors.

-pe openmp <nn>        The openmp parallel environment provides multiple threads
                       on one node. <nn> specifies the max number of
                       threads.
====================== ========================================================

.. _sge-batch:

Running Batch Jobs on iceberg
-----------------------------

The power of iceberg really comes from the 'batch job' queue submission process.
Using this system, you write a script which requests various resources, initializes the computational environment and then executes your program(s).
The scheduler will run your job when resources are available.
As the task is running, the terminal output and any errors are captured and
saved to disk, so that you can see the output and verify the execution of the
task.

Any task that can be executed without any user intervention while it is running
can be submitted as a batch job to Iceberg. This excludes jobs that require a
Graphical User Interface (GUI), however, many common GUI applications such as Ansys or MATLAB can also be
used without their GUIs.

When you submit a batch job, you provide an executable file that will be run by
the scheduler. This is normally a bash script file which provides commands and
options to the program you are using.
Once you have a script file, or other executable file, you can submit it to the queue by running::

    qsub myscript.sh

Here is an example batch submission script that runs a fictitious program called `foo` ::

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    # and 5 gigabytes of virtual memory (mem)
    #$ -l mem=5G -l rmem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    #Run the program foo with input foo.dat
    #and output foo.res
    foo < foo.dat > foo.res

Some things to note:

* The first line always needs to be `#!/bin/bash` to tell the scheduler that this is a bash batch script.
* Comments start with a `#`
* Scheduler options, such as the amount of memory requested, start with `#$`
* You will usually require one or more `module` commands in your submission file. These make programs and libraries available to your scripts.

Here is a more complex example that requests more resources ::

  #!/bin/bash
  # Request 16 gigabytes of real memory (mem)
  # and 16 gigabytes of virtual memory (mem)
  #$ -l mem=16G -l rmem=16G
  # Request 4 cores in an OpenMP environment
  #$ -pe openmp 4
  # Email notifications to me@somedomain.com
  #$ -M me@somedomain.com
  # Email notifications if the job aborts
  #$ -m a

  # load the modules required by our program
  module load compilers/gcc/5.2
  module load apps/gcc/foo

  #Set the OPENMP_NUM_THREADS environment variable to 4
  export OMP_NUM_THREADS=4

  #Run the program foo with input foo.dat
  #and output foo.res
  foo < foo.dat > foo.res

Scheduler Options
-----------------

====================== ========================================================
Command                Description
====================== ========================================================
-l h_rt=hh:mm:ss       Specify the total maximum execution time for the job.

-l mem=xxG             Specify the maximum amount (xx) of memory to be used.

-N                     Job name, used to name output files and in the queue list.

-j                     Join the error and normal output into one file rather
                       than two.

-M                     Email address to send notifications to.

-m bea                 Type of notifications to send. Can be any combination of
                       begin (b) end (e) or abort (a) i.e. `-m ea` for end and
                       abortion messages.
-a                     Specify the earliest time for a job to start, in the
                       format MMDDhhmm. e.g. -a 01011130 will schedule the job
                       to begin no sooner than 11:30 on 1st January.
====================== ========================================================

Frequently Asked SGE Questions
------------------------------
**How many jobs can I submit at any one time**

You can submit up to 2000 jobs to the cluster, and the scheduler will allow up to 200 of your jobs to run simultaneously (we occasionally alter this value depending on the load on the cluster).

**How do I ensure that my jobs run on Ivybridge processors**

Add the following line to your submission script ::

    #$ -l arch=intel-e5-2650v2

This specifies nodes that have the Ivybridge `E5-2650 CPU <http://ark.intel.com/products/75269/Intel-Xeon-Processor-E5-2650-v2-20M-Cache-2_60-GHz>`_

**How do I specify multiple email addresses for job notifications?**

Specify each additional email with it's own `-M` option ::

  #$ -M foo@example.com
  #$ -M bar@example.com

**How do you ensure that a job starts after a specified time?**

Add the following line to your submission script ::

    #$ -a time

but replace ``time`` with a time in the format MMDDhhmm

For example, for 22nd July at 14:10, you’d do ::

    #$ -a 07221410

This won’t guarantee that it will run precisely at this time since that depends on available resources. It will, however, ensure that the job runs *after* this time. If your resource requirements aren’t too heavy, it will be pretty soon after. When I tried it, it started about 10 seconds afterwards but this will vary.
