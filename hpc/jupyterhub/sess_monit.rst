.. _jh_sess_monit: 

Monitoring and controlling your Jupyter session
===============================================

Monitoring and control
----------------------

Click here to see what Jupyter Notebooks and Terminals your Jupyter server is running:

.. image:: /images/jupyterhub/jh-show-running-1.png

Here you can **shut down (close) individual Notebooks** and terminals, which may be useful to free up 
the memory and CPU cores that the cluster's job scheduler has allocated for your JupyterHub session:

.. image:: /images/jupyterhub/jh-show-running-2.png

----

If you want to **stop your entire Jupyter server** (i.e. end your JupyterHub session) you can 

#. Click *File* on the top menu bar, then click *Hub Control Panel*
#. Click *Stop My Server*

----

Your JupyterHub session **may terminate for other reasons**:

* The cluster's job scheduler may stop your JupyterHub job if 
  your Jupyter server exceeds the amount of RAM you requested 
  via the :ref:`Spawner Options <jh_spawner_opts>` page.
* Your JupyterHub job has been running for longer than 
  the (fixed) duration specified on the :ref:`Spawner Options <jh_spawner_opts>` page.

---

Session persistence
-------------------

You can **close your Jupyter-related browser tabs** and your Jupyter session will **keep running**
until it terminates for one of the reasons listed above.  

You can then revisit the JupyterHub site to 
reconnect to your Jupyter session and **carry on from where you left off**.

.. warning::

   If you leave your Jupyter session running and are not using it then 
   you are using CPU cores, memory and possibly GPUs that **cannot be used by others**.  

   **Please stop your Jupyter session if you no longer need it**.
