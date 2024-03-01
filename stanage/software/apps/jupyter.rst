.. _jupyter_stanage:

.. |softwarename| replace:: Jupyter Notebook

|softwarename|
==============

.. sidebar:: |softwarename|

   :URL: https://posit.co/products/open-source/rstudio/
   :Documentation: https://jupyter-notebook.readthedocs.io/en/5.6.0/index.html


Jupyter Notebook is an open source web application that you can use to create and share documents that contain live code, equations, visualisations, and text. 

Installing and Running Jupyter Notebooks
========================================

The HPC clusters are only able to host a jupyter notebook work space in an interactive session. To install and run Jupyter please follow these steps.

1. Start an interactive session  with the following command:

.. code-block:: bash
    
    srun --pty bash -i

2. Create  an :ref:`anaconda <python_stanage>` environment. (If you already have an existing environment skip to step 3)

3. Activate an Anaconda environment (This can be an existing one or the one you created in step 2).

4. Install Jupyter using ``pip`` :

.. code-block:: bash
    
    pip install jupyter

5. If it's your first time using Jupyter, you will need to create a notebook configuration file. The following command will create ``jupyter_notebook_config.py`` in your home directory ``~/.jupyter/jupyter_notebook_config.py``.

.. code-block:: bash
    
    jupyter notebook --generate-config

6. Set up a password for your Jupyter notebook (this only needs doing once), with the following command:

.. code-block:: bash
    
    jupyter notebook password

7. Now you are ready to start Jupyter:

.. code-block:: bash
    
    jupyter notebook 

The above command will produce output similar to the following example:

.. code-block:: bash
    
    ...
    ...    
    [I 2024-02-28 14:58:45.046 ServerApp] Jupyter Server 2.12.5 is running at:
    [I 2024-02-28 14:58:45.046 ServerApp] http://localhost:8889/tree
    [I 2024-02-28 14:58:45.046 ServerApp]     http://127.0.0.1:8889/tree
    ...
    ...

.. note:: 

    Please take note of the two addresses in the output. You will need them later. In this example it will be ``http://localhost:8889/tree`` and ``http://127.0.0.1:8889/tree`` . 

Accessing Jupyter with a Web Browser
=====================================

Once you have completed the above steps, you are ready to access Jupyter with a web browser. There are two ways to do this:

#. Using flight-desktop (Recommended)
#. Using Tunneling/port forwading (Advanced users)

Using flight-desktop
====================

1. Start a :ref:`flight <flight-desktop>`  desktop session.
2. Click on the web browser icon 

.. image:: /images/browser_button.PNG

3. Once the web browser is up and running, use the web adress with ``127.0.0.1`` from step 7  of the ``Installing and Running Jupyter Notebooks`` section. In our example, this would be 



.. code-block:: bash
    
    http://127.0.0.1:8889/tree

Using Tunneling/Port Forwading
==============================

This is mostly recommended for advanced users.

1. You must have `ssh keys<ssh_keys>` in place to use this method.
2. Open a new terminal  and enter the following command. (Please note , without SSH keys, this step will fail)

.. code-block:: bash

    ssh -J $YourUsername@stanage.sheffield.ac.uk -L 8888:127.0.0.1:8888 $YourUsername@<IP Address>

.. note:: 

    The above command is heavily dependant on the node you launched  jupyter notebook.


    +------------------------------------------------------+------------------------------------------------------+
    | Interactive Node                                     | IP Address                                           |
    +======================================================+======================================================+
    | node001                                              | 10.10.1.1                                            |
    +------------------------------------------------------+------------------------------------------------------+
    | node002                                              | 10.10.1.2                                            |
    +------------------------------------------------------+------------------------------------------------------+

For example, if we launched Jupyter on interactive node002 then the command would be :

    .. code-block:: bash

        ssh -J $YourUsername@stanage.sheffield.ac.uk -L 8888:127.0.0.1:8888 $YourUsername@10.10.1.2


3.  Open a browser (Chrome/Edge/Mozilla etc) on your machine and enter the address we noted earlier containing  ``localhost`` . 

.. code-block:: bash
    
    http://localhost:8889/tree