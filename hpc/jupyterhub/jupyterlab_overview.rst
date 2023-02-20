.. _jh_jupyterlab: 

JupyterLab
==========

After starting a JupyterHub session
you are presented with Jupyter's 
which is the default tab in Jupyter's user interface.  
This view shows you (amongst other things):

* **Files on the machine running your Jupyter session** (here, the cluster), *not* your local machine.  This behaves much like a desktop file browser application.  Use this to find existing Notebooks (or text files) to open/run/edit.
* **A 'Launcher' tab** that lets you 
   * Create a new Jupyter Notebook using a 'kernel' in a specific Conda environment 
   * Create a new Jupyter `Console <https://jupyterlab.readthedocs.io/en/stable/user/code_console.html>`__ using a 'kernel' in a specific Conda environment 
   * Start a new web-based terminal session
   * Create a new text file, Markdown file or Python code file
* **Tabs for open Notebooks, web-based terminal sessions and web-based file editing views**.

.. image:: /images/jupyterhub/sharc-jh-main-nb-svr-interface.png
   :align: center
   :alt: JupyterLab interface

.. _jh_automount_issue:

.. warning:: 

   Certain directories may not be accessible via this interface:

   * ``/home/username``
   * ``/data/username``
   * ``/shared/volname``

   This set of directories are :ref:`automounted <filestore>` 
   i.e. made available to the user on demand
   but you cannot express that demand via this interface.
   If you browse into ``/data`` and it is empty or does not contain your personal subdirectory 
   then you need to briefly open a :ref:`Jupyter terminal <jh_terminal>` and 
   run: ::

      ls /data/username

   then that directory should subsequently be visible/accessible in the JupyterLab file browser.
