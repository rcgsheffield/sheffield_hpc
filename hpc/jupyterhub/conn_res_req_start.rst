.. _jh_conn_res_req_start: 

JupyterHub on ShARC: connecting, requesting resources and starting a session 
============================================================================

Connecting
----------

#. From a web browser navigate to the following URL 
   from a machine that is on-campus or
   has a `VPN connection to the University <https://www.sheffield.ac.uk/it-services/vpn>`__: ::

        https://jupyter-sharc.shef.ac.uk

#. When prompted, log in using your University username 
   (e.g. ``te1st``, *not* the first part of your email address)
   and password.

   .. image:: /images/jupyterhub/jh-sharc-login.png

   You can only run one Jupyer Notebook Server on the cluster at a time but 
   you can use your Notebook Server to run multiple Notebooks.

.. _jh_spawner_opts:

Requesting resources (*Spawner options*)
----------------------------------------

Before the Notebook server starts you may wish to 
request resources such as memory, multiple CPUs and GPUs 
using the *Spawner options* form.  It presents you with 
a number of options:

Project
^^^^^^^

As a user on the cluster you are a member of one or more *User Groups*, 
which in turn give access to *Projects*.  By submitting a job 
using a Project you can:

* Use restricted-access worker nodes (possibly bought by your research group);
* Have your job's CPU and memory usage logged in a way that 
  ensures all users of the cluster get fair usage.

**Most users do not need to select a specific Project and 
should leave this setting as its default.**

Job Queue
^^^^^^^^^

Selecting ``any`` lets the scheduler choose an appropriate Job Queue, 
which is typically what you want.

Email address
^^^^^^^^^^^^^

The resource (CPU, memory and runtime) usage of your Jupyter session will be 
emailed to this address when it is stopped or aborts.

This information can by useful for diagnosing 
why the job scheduler has killed your Jupyter session 
should your session use more computation resources 
than you requested at the outset.

CPU cores
^^^^^^^^^

If you select >1 core then you must also 
select a **Parallel Environment** 
otherwise only 1 core will be granted.

Parallel Environment
^^^^^^^^^^^^^^^^^^^^

* ``smp``: The number of CPU cores selected above 
  are all allocated on one node.
* ``mpi``: The number of CPU cores selected above 
  are allocated on one or more nodes.

RAM per CPU core
^^^^^^^^^^^^^^^^

A value in gigabytes.

GPUS per CPU core
^^^^^^^^^^^^^^^^^

Requires that **Project** is ``gpu`` (public GPUs) or another project that allow *you* access to GPUs e.g. ``rse``.

Notebook session runtime
^^^^^^^^^^^^^^^^^^^^^^^^

This is currently fixed at 4 hours.

Starting your Notebook session using the requested resources
------------------------------------------------------------

After you've specified the resources you want for your job,
click *Spawn* to try starting a Jupyter session on one (or more) worker nodes.
This may take a minute.

.. warning::

   If the cluster is busy **or** 
   you have requested an incompatible or otherwise unsatisfiable set of resources 
   from the job scheduler
   then this attempt to start a session will time out
   and you will return to the :ref:`Spawner options <jh_spawner_opts>` form.

Once your session has started you should see the Jupyter file browser interface:

.. image:: /images/jupyterhub/sharc-jh-main-nb-svr-interface.png
