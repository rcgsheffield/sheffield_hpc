JupyterHub
==========

The `Jupyter Notebook <http://jupyter.org/>`_ is a web application that allows 
you to create and share documents that contain live code, equations, 
visualizations and explanatory text.
It is an excellent interface to explore your data and share your research.

The JupyterHub is a web interface for running notebooks on the iceberg cluster.
It allows you to login and have a notebook server started up on the cluster, 
with access to both your data stores and the resources of iceberg.


.. warning::
    This service is currenty **experimental**, if you use this service and
    encounter a problem, please provide feedback to
    `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`_.


Logging into the JupyterHub
---------------------------

To get started visit `https://jupyter.shef.ac.uk <https://jupyter.shef.ac.uk>`_
and log in with your university account. 
A notebook session will be submitted to the iceberg queue once you have logged
in, this can take a minute or two, so the page may seem to be loading for some
time.

.. note::
    There is currently no way of specifying any options to the queue when
    submitting the server job. So you can not increase the amount of memory
    assigned or the queue the job runs in. There is an ongoing project to add
    this functionality.



Using the Notebook on iceberg
-----------------------------

To create a new notebook session, select the "New" menu on the right hand side
of the top menu.

.. image:: /images/jupyterhub-kernels.png

You will be presented with a menu showing all available conda environments that
have Jupyter available. To learn more about installing custom Python
environments with conda see :ref:`python-conda`.

To learn how to use the Jupyter Notebook see the `official documentation
<http://jupyter-notebook.readthedocs.org/en/latest/examples/Notebook/rstversions/Notebook%20Basics.html#the-notebook-dashboard>`_.

Using the Notebook Terminal
###########################

In the "New" menu it is possible to start a terminal, this is a fully featured
web terminal, running on a worker node. You can use this terminal to perform
any command line only operation on iceberg. Including configuring new Python
environments and installing packages.

.. image:: /images/jupyterhub-terminal.png

Troubleshooting
---------------

Below is a list of common problems:

1. If you modify the ``PYTHON_PATH`` variable in your ``.bashrc`` file your
   jupyter server may not start correctly, and you may encounter a 503 error
   after logging into the hub. The solution to this is to remove these lines
   from your ``.bashrc`` file.
2. If you have previously tried installing and running Jupyter yourself (i.e.
   not using this JupyterHub interface) then you may get 503 errors when
   connecting to JupyterHub due to `the old .jupyter profile in your home
   directory <https://github.com/jupyter/jupyterhub/issues/294>`_;  if you then
   find a jupyter log file in your home directory containing ``SSL
   WRONG_VERSION_NUMBER`` then try deleting (or renaming) the ``.jupyter``
   directory in your home directory.
