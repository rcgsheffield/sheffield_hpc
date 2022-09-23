.. _scontrol:

scontrol
========

``scontrol`` is a scheduler command used to control queueing or running jobs.

Documentation
-------------

Documentation is available on the system using the command

.. code-block:: console

    $ man scontrol

Usage
-----

The ``scontrol`` command provides users control of their jobs run through SLURM including 
actions like suspending a job, holding a job from running, or pulling status information on jobs.

To suspend a job that is currently running ``scontrol`` is used with the ``suspend`` argument: 

.. code-block:: console

    $ scontrol suspend job-id

To resume a paused job, we use ``scontrol`` with the ``resume`` argument: 

.. code-block:: console

    $ scontrol resume job-id

Slurm also provides a utility to hold jobs that are queued in the system. 
Holding a job will place the job in the lowest priority, effectively “holding” the job 
from being run. A job can only be held if it’s waiting on the system to be run. 
We use the ``hold`` argument to place a job into a held state: 

.. code-block:: console

    $ scontrol hold job-id

We can then release a held job using the ``release`` argument: 

.. code-block:: console

    $ scontrol release job-id

The ``scontrol`` command can also provide extensive information on jobs using the ``show job`` 
argument: 

.. code-block:: console

    $ scontrol show job job-id

Further information on scontrol commands can be found by `visiting the slurm page on
scontrol <https://slurm.schedmd.com/scontrol.html>`_.
