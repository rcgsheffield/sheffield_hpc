.. _salloc:

salloc
======

.. important::

    Contrary to the description on this page and defaults, the ``salloc`` command on the **Bessemer cluster (only)** has been reconfigured to 
    provide an alternative method to spawn an interactive session.

    If no command is specified when invoking ``salloc``, then after the resources are allocated **a new shell starts inside the requested resources** 
    rather than starting a new user shell on the same machine.


``salloc``  is a SLURM scheduler command  used  to allocate a Slurm job allocation, which is a set of 
resources (nodes), possibly with some set of constraints  (e.g.  number of  processors  per  node). 

When  ``salloc``  successfully  obtains  the requested allocation, it then runs the command specified 
by  the  user on the current machine and then revokes the allocation.

If no command is specified, then by default ``salloc`` starts the user's default shell on the same machine.

While in an ``sbatch`` job or interactive session, ``salloc`` can also be used to allocate 
part of the jobs resources to specific ``srun`` sub-tasks.

Documentation
-------------

Documentation is available on the system using the command

.. code-block:: console

    $ man salloc

Usage
-----

The ``salloc`` command is used to request an allocation from the SLURM scheduler and takes the same arguments as ``srun``.

The ``salloc`` command can be used with a subsequent command or script to request an allocation then run that 
command/script **on the current machine** (not on the allocated nodes/resources). When the command / script is finished the 
allocation will be revoked.

The command may be any program the user wishes. Some typical commands are seen below:

.. code-block:: console
    
    $ salloc --nodes=1 --ntasks-per-node=1 --mem-per-cpu=2G --time=01:00:00 srun mycommand

Or: 

.. code-block:: console
    
    $ salloc --nodes=1 --ntasks-per-node=1 --mem-per-cpu=2G --time=01:00:00 srun myscript.sh


An example is seen as follows with the ``sleep 10`` command with a single task on a single node for 1 minute:

.. code-block:: console
    :emphasize-lines: 1,6

    $ salloc --nodes=1 --ntasks-per-node=1 --mem-per-cpu=2G --time=00:01:00 bash -c 'sleep 10'
    salloc: Pending job allocation 2165971
    salloc: job 2165971 queued and waiting for resources
    salloc: job 2165971 has been allocated resources
    salloc: Granted job allocation 2165971              #The sleep command starts
    salloc: Relinquishing job allocation 2165971        #The sleep command has finished.
    salloc: Job allocation 2165971 has been revoked.

This has requested the allocation then waited 10 seconds and then cancelled the allocation.

To demonstrate that the command after ``salloc`` runs on the current machine and **not** on the allocated nodes/resources see the example 
below: 

.. code-block:: console
    :emphasize-lines: 1,2,3,8

    $ hostname
    bessemer-node001.shef.ac.uk
    $ salloc --nodes=1 --ntasks-per-node=1 --mem-per-cpu=2G --time=01:00:00 hostname
    salloc: Pending job allocation 2165974
    salloc: job 2165974 queued and waiting for resources
    salloc: job 2165974 has been allocated resources
    salloc: Granted job allocation 2165974
    bessemer-node001.shef.ac.uk
    salloc: Relinquishing job allocation 2165974
    salloc: Job allocation 2165974 has been revoked.

As is seen in line 1, we are on the login node as indicated by the ``hostname`` command. When we execute the
``salloc`` command to reserve resources and instruct it to run the ``hostname`` command it again shows the same host 
as the command executed by ``salloc`` occurs on the current machine **not** on the allocated nodes/resources.

When the ``salloc`` command is invoked without a command it will run the user's default shell. This in effect 
provides an allocation for which ``srun`` jobs can be dispatched to on the fly. This can be advantegous as scripts/commands ran with 
``srun`` can run immediately, since the resources are allocated already.

This is another example, requesting a single node job with 4 tasks (1 CPU per task) a total of 2GB memory for an hour without a command:

.. code-block:: console

    $ salloc --nodes=1 --ntasks-per-node=4 --mem=2G --time=01:00:00

The output will look like the below: 

.. code-block:: console
    :emphasize-lines: 1

    $ salloc --nodes=1 --ntasks-per-node=4 --mem=2G --time=01:00:00
    salloc: Pending job allocation 2117564
    salloc: job 2117564 queued and waiting for resources
    salloc: job 2117564 has been allocated resources
    salloc: Granted job allocation 2117564


The allocation command will wait until the resource request is fulfilled and then return to the 
login node (by running the default shell.) 

.. warning::

    When you are finished with your tasks please ensure that you release / cancel your allocation using 
    the  :ref:`scancel<scancel>` command: ``scancel $SLURM_JOB_ID``, so compute resources are not trapped and idle.

The allocation will then be available for use using the ``srun`` command. You can see running allocations by showing 
them with ``sacct`` : 

.. code-block:: console
    :emphasize-lines: 1

    $ sacct
    JobID        JobName    Partition  Account    AllocCPUS  State      ExitCode 
    ------------ ---------- ---------- ---------- ---------- ---------- -------- 
    2117564      interacti+ interacti+       free          4    RUNNING      0:0 

And dispatching the command ``hostname`` to each of the 4 tasks with ``srun``:

.. code-block:: console
    :emphasize-lines: 1

    $ srun hostname
    bessemer-node001.shef.ac.uk
    bessemer-node001.shef.ac.uk
    bessemer-node001.shef.ac.uk
    bessemer-node001.shef.ac.uk


Note that there is no need to supply the ``SLURM_JOB_ID`` variable as when ``salloc`` ran it 
spawned you a subshell with this varible set for the fulfilled allocation.

It is seen that the ``srun`` command is ran in each task, if you want to run a single task 
but with multiple cores you can make a request using the ``-c`` or ``--cpus-per-task`` arguments.

More specific information for using the ``salloc`` command can be found by running the 
``salloc`` command with the  ``--help`` flag or by `visiting the slurm page on
salloc <https://slurm.schedmd.com/salloc.html>`_.
