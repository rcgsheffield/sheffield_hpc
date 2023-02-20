.. _jh_issues: 

JupyterHub: errors and troubleshooting
======================================

Common issues
-------------

After submitting Spawner options I get returned to the Spawner options page after a minute or two
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The cluster is not able to start your JupyterHub session at this time because:

* the cluster is currently doesn't have the capacity to start your JupyterHub job on demand at this time or
* you have requested an incompatible set of resources from the Spawner options form or
* the job scheduler allocates you resources on cluster nodes but the Jupyter server software cannot start for some reason.

To determine if the third of these possibilities is the case
look at the most recent messages written to the ``.jupyterhub.sge.out`` log file in your home directory.

I encounter errors when trying to create/modify environments via the Conda tab in Jupyter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is a :ref:`known issue <jh_conda>` that will hopefully be resolved in future.  
For now create and modify conda environments from the command-line.

I cannot browse to subdirectories below ``/data`` or ``/shared`` from the Jupyter file browser
----------------------------------------------------------------------------------------------

This is a known issue; a workaround is :ref:`described here <jh_jupyterlab>`.

Less common issues
------------------

I get a '503' error after logging in to JupyterHub
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you modify the ``PYTHON_PATH`` variable in your ``.bashrc`` file your Jupyter server may not start correctly.
The solution to this is to remove these lines from your ``.bashrc`` file.

Also, if you have previously tried installing and running Jupyter yourself 
(i.e.  not using this JupyterHub interface) then you may get 503 errors when
connecting to JupyterHub due to `the old .jupyter profile in your home
directory <https://github.com/jupyter/jupyterhub/issues/294>`_;  if you then
find a Jupyter log file in your home directory containing ``SSL
WRONG_VERSION_NUMBER`` then try deleting (or renaming) the ``.jupyter``
directory in your home directory.
