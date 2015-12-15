.. _python-conda:

Python
======

.. sidebar:: Python

   :Support Level: Gold
   :Dependencies: None
   :URL: https://python.org
   :Version: All


This page documents the "miniconda" installation on iceberg. This is the
recommended way of using Python on iceberg, and the best way to be able to
configure custom sets of packages for your use.

"conda" a Python package manager, allows you to create "environments" which are
sets of packages that you can modify. It does this by installing them in your
home area. This page will guide you through loading conda and then creating and
modifying environments so you can install and use whatever Python packages you
need.

Using conda Python
------------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session
with the ``qsh`` or ``qrsh`` command.

Conda Python can be loaded with::

        module load apps/python/conda

The ``root`` conda environment (the default) provides Python 3 and no extra
modules, it is automatically updated, and not recommended for general use, just
as a base for your own environments. There is also a ``python2`` environment,
which is the same but with a Python 2 installation.

Quickly Loading Anaconda Environments
-------------------------------------

There are a small number of environments provided for everyone to use, these are
the default ``root`` and ``python2`` environments as well as various versions
of Anaconda for Python 3 and Python 2.

The anaconda environments can be loaded through provided module files::

    module load apps/python/anaconda2-2.4.0
    module load apps/python/anaconda3-2.4.0

Where ``anaconda2`` represents Python 2 installations and ``anaconda3``
represents Python 3 installations.
These commands will also load the ``apps/python/conda`` module and then
activate the anaconda environment specified.


Using conda Environments
########################

Once the conda module is loaded you have to load or create the desired
conda environments. For the documentation on conda environments see
`the conda documentation <http://conda.pydata.org/docs/using/envs.html>`_.

You can load a conda environment with::

    source activate python2

where ``python2`` is the name of the environment, and unload one with::

    source deactivate

which will return you to the ``root`` environment.

It is possible to list all the available environments with::

    conda env list

Provided system-wide are a set of anaconda environments, these will be
installed with the anaconda version number in the environment name, and never
modified. They will therefore provide a static base for derivative environments
or for using directly.


Creating an Environment
#######################

Every user can create their own environments, and packages shared with the
system-wide environments will not be reinstalled or copied to your file store,
they will be ``symlinked``, this reduces the space you need in your ``/home``
directory to install many different Python environments.

To create a clean environment with just Python 2 and numpy you can run::

    conda create -n mynumpy python=2.7 numpy

This will download the latest release of Python 2.7 and numpy, and create an
environment named ``mynumpy``.

Any version of Python or list of packages can be provided::

    conda create -n myscience python=3.5 numpy=1.8.1 scipy

If you wish to modify an existing environment, such as one of the anaconda
installations, you can ``clone`` that environment::

    conda create --clone anaconda3-2.3.0 -n myexperiment

This will create an environment called ``myexperiment`` which has all the
anaconda 2.3.0 packages installed with Python 3.


Installing Packages Inside an Environment
#########################################

Once you have created your own environment you can install additional packages
or different versions of packages into it. There are two methods for doing
this, ``conda`` and ``pip``, if a package is available through conda it is
strongly recommended that you use conda to install packages. You can search for
packages using conda::

    conda search pandas

then install the package using::

    conda install pandas

if you are not in your environment you will get a permission denied error
when trying to install packages, if this happens, create or activate an
environment you own.

If a package is not available through conda you can search for and install it
using pip::

    pip search colormath

    pip install colormath

Previous Anaconda Installation
------------------------------

There is a legacy anaconda installation which is accessible through the
``binapps/anacondapython/2.3`` module.
This module should be considered **deprecated** and should no longer be used.


Using Python with MPI
---------------------

There is an **experimental** set of packages for conda that have been compiled
by the iceberg team, which allow you to use a MPI stack entirely managed by
conda.  This allows you to easily create complex evironments and use MPI
without worrying about other modules or system libraries.

To get access to these packages you need to run the following command to add
the repo to your conda config::

    conda config --add channels file:///usr/local/packages6/conda/conda-bld/

you should then be able to install the packages with the ``openmpi`` feature,
which currently include openmpi, hdf5, mpi4py and h5py::

    conda create -n mpi python=3.5 openmpi mpi4py

Currently, there are Python 2.7, 3.4 and 3.5 versions of mpi4py and h5py
compiled in this repository.

The build scripts for these packages can be found in this
`GitHub <https://github.com/rcgsheffield/conda-packages>`_ repository.

Running a Jupyter Notebook server on Iceberg
--------------------------------------------

`Jupyter <http://jupyter.org/>`_ allows you to bring together runnable blocks
of code, output from that code (e.g. plots, tables), documenting text, images
and other media in a **Notebook** interface, which is displayed in your browser
(the *client*).  
This client executes the blocks of code by sending them off to a **Notebook
server**, which in turn asks a **kernel** program that understands the language
they are written in to execute them.  
Much of Jupyter is written in Python but there are kernels for `many other
languages
<https://github.com/ipython/ipython/wiki/IPython-kernels-for-other-languages>`_.

There are too many features and benefits of Jupyter to list them here; the main
ones for the end user are that you can iteratively explore data, running and
re-running cells as you learn more about the problem domain, and along the way,
build an attractive document where code, explanatory text, equations and plots 
collectively form a research narrative.  For a brief overview of the Jupyter
system, see `this video <https://www.youtube.com/watch?v=Rc4JQWowG5I>`_.

To **run a Jupyter Notebook server on Iceberg then connect to it from your own machine**, 
log into a worker node from the head node using ``qrsh`` 
then load the ``conda`` module with ``module load apps/python/conda``.  
Make a note of the name of the worker node you log in to. 

Next, create (if necessary) then activate a conda environment in which you have
installed the ``jupyter`` conda package (and possibly other packages) e.g.::

    $ conda create -n jupyterplayground python=3.5 jupyter
    $ . activate jupyterplayground

You probably want to make sure that your connection to your Notebook server 
is **encrypted** and that you can restrict who can connect to it (**authentication**).
Enable (TLS) encryption and authentication by going through the following steps in the 
`Jupyter documentation <http://jupyter-notebook.readthedocs.org/en/latest/public_server.html>`_:

- *Securing a notebook server*
- *Preparing a hashed password*
- *Adding hashed password to your notebook configuration file*
- *Using SSL for encrypted communication*
- *Running a public notebook server*

Next, start the Jupyter Notebook server on the worker node::

    $ jupyter notebook --ip='*' --no-browser
  
make a note of the port (e.g. ``8888``) that the Notebook server is *listening* on, 
then leave this terminal running.
 
We now need to try connecting to this Notebook server from a web browser. 
We cannot connect to the Notebook server directly as we cannot talk directly to
Iceberg nodes over the University network.  As a workaround, you can set up a 
**SSH tunnel** to route all communications from your machine to the worker node
*via the head node*, which we can communicate with from the university network.
On Linux or OS X, you can set up this SSH tunnel to the worker node by running
the following on your own machine::

    $ ssh -L 9999:<<worker_node>>:<<port_name>> iceberg.shef.ac.uk
    
where ``<<worker_node>>`` is the name of the Iceberg worker node that we started
the Notebook server on.  Again, leave this terinal open.  If you are using
Windows, then you can use the free `PuTTy
<http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_ program to
do the same job (you need to *forward* a *Source Port* (e.g. ``9999``) to a
*Destination* (e.g. ``node068:8888``, i.e. ``<<worker_node>>:<<port_name>>``).  
See `this guide <http://howto.ccs.neu.edu/howto/windows/ssh-port-tunneling-with-putty/>`_ 
for info on how to set up SSH tunnels using PuTTy).

You should now be able to communicate with the Notebook server by pointing your
web browser at https://localhost:9999.

This workflow is obviously a little convoluted; in future it may be streamlined (e.g. by 
using `JupyterHub <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>`_ 
to allow end-users to start up new Notebook servers from their web browsers. 

Note that all Notebooks created using a Notebook server running on Iceberg will
be saved on Iceberg and the Notebook has access to Iceberg's filesystems but
not those on your machine.


Installation Notes
------------------
These are primarily for administrators of the system.

The conda package manager is installed in ``/usr/share/packages6/conda``, it
was installed using the `miniconda <http://conda.pydata.org/miniconda.html>`_
installer.

The two "root" environments ``root`` and ``python2`` can be updated using the
update script located in
``/usr/local/packages6/conda/_envronments/conda-autoupdate.sh``. This should be
run regularly to keep this base environments upto date with Python, and more
importantly with the conda package manager itself.

Installing a New Version of Anaconda
####################################

Perform the following::

    $ cd /usr/local/packages6/conda/_envronments/
    $ cp anaconda2-2.3.0.yml anaconda2-x.y.z.yml

then edit that file modifying the environment name and the anaconda version
under requirements then run::

    $ conda env create -f anaconda2-x.y.z.yml

then repeat for the Python 3 installation.

Then copy the modulefile for the previous version of anaconda to the new
version and update the name of the environment. Also you will need to append
the new module to the ``conflict`` line in
`apps/python/.conda-environments.tcl`.

