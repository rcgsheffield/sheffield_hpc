.. _jh_nb_usage:

Creating, editing and running Jupyter Notebooks
===============================================

Creating Notebooks
------------------

After :ref:`creating or deciding on a conda environment <jh_conda>` 
containing the Jupyter Kernel(s) you want to execute Notebook(s) with plus the packages want to import within Notebook(s)
you can now create a Notebook or open an existing one.

To create a Notebook:

#. Using the JupyterLab file browser, browse to the place you want to create your Notebook then
#. Click **File**, **New from Launcher** then click the icon representing the Conda environment you want to start your Notebook in.

A blank Notebook should appear in a new JupyterLab tab.
Your Notebook will have access to the packages installed in the selected Conda environment.

Opening existing Notebooks
--------------------------

To open an existing Notebook either:

* Click on an existing Notebook (``.ipynb``) file in :ref:`JupyterLab's file browser <jh_jupyterlab>` or
* Click **File** then **Open from Path** or **Open from URL**

.. warning:: 

   If using **Open from URL** ensure the Notebook is from a reputable source.

Switching Jupyter Kernel
------------------------

After opening a Notebook, you can **change the Kernel used for executing code cells** by 
clicking **Kernel** then **Change Kernel...** from the menu bar to 
bring up a list of available Kernels.

Some of the Kernels in this list correspond to Conda environments created by the system administrators; 
others were automatically found by a Jupyter plug-in that 
searches for valid Jupyter Kernels in all conda environments visible to you.

It is **recommended that you create your own Conda environments** (typically one per project/workflow).

**Do not use** the ``jupyterhub``, ``jupyterhub2`` or ``jupyterhub-dev`` environments.
You are advised not to use the ``anaconda`` Kernels/environments either as these are read-only to most users
and users have little control over if/when they are updated and what packages they contain.  

Using Jupyter Notebooks
-----------------------

The basics of using Jupyter Notebooks to create self-describing, runable workflow documents 
are explained in the `Jupyter Notebook official documentation`_.

Pyspark
^^^^^^^
if you want to use `Pyspark <https://spark.apache.org/docs/latest/api/python/index.html>`__ with conda and :ref:`Jupyter on ShARC <jupyterhub_sge>` then some extra configuration is required: see :ref:`pyspark_sharc_jupyterhub`.

.. _Jupyter Notebook official documentation: http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/Notebook%20Basics.html
