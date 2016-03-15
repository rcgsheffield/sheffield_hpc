Using iceberg
=============

The first step in using iceberg is getting an account and running an interactive
session, if you don't know how to do this you should start with
:ref:`getting-started`.

Once you have connected to iceberg in interactive mode you can run jobs which
take less than **8 hours** and which are graphical or require user interaction.
For more information on what applications you can run read :ref:`software`.

If you require more memory or more processes when running interactive jobs you
will need to tell the cluster management software (the scheduler) what you need.
For more information on this read :ref:`sge-interactive`.

If you want to run jobs which are not interactive you should submit these to the
'queue'. Jobs in the queue will be run when there is free resources for them.
To learn how to use the queue see :ref:`sge-batch`.


**Quick Links:**

* :ref:`Getting-started` : Getting an account and connecting to iceberg
* :ref:`sge-interactive` : Running programs and applications on iceberg interactively.
* :ref:`sge-batch` : Submitting long-running jobs to iceberg job scheduler.


.. toctree::
    :maxdepth: 2
    :hidden:

    getting-started
    accessing/index
    sge
    filestore



