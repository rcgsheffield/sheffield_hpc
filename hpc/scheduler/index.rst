.. _scheduler:

Using interactive sessions / submitting batch jobs
==================================================

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

    ./*

Getting started 
---------------

To submit jobs to one of our HPC systems see our guide to :ref:`submit-queue`.

Stanford Research Computing Center provide a `SGE to SLURM conversion guide <https://srcc.stanford.edu/sge-slurm-conversion>`_.

Submitting and controlling jobs programmatically
------------------------------------------------

See our guide to the :ref:`drmaa` API.

Reference information
---------------------

Commands that allow you to interact with the scheduler:

* :ref:`qhost` - Show's the status of Sun Grid Engine hosts.
* :ref:`qrsh` - Requests an interactive session on a worker node. No support for graphical applications.
* :ref:`qrshx` - Requests an interactive session on a worker node. Supports graphical applications. Superior to :ref:`qsh` in most cases.
* :ref:`qsh` - Requests an interactive session on a worker node. Supports graphical applications.
* :ref:`qstat` - Displays the status of jobs and queues.
* :ref:`qsub` - Submits a batch job to the system.
