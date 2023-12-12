.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc-python-conda:

Python
======

.. sidebar:: Python

   :Support Level: Core
   :URL: https://python.org


This page documents the "miniconda" installation on ShARC. This is the
recommended way of using Python, and the best way to be able to configure custom
sets of packages for your use.

"conda" a Python package manager, allows you to create "environments" which are
sets of packages that you can modify. It does this by installing them in your
home area. This page will guide you through loading conda and then creating and
modifying environments so you can install and use whatever Python packages you
need.

Using Conda Python
------------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session
with the ``qrshx`` or ``qrsh`` command.

Conda Python can be loaded with::

        module load apps/python/conda

The ``root`` conda environment (the default) provides Python 3 and no extra
modules, it is automatically updated, and not recommended for general use, just
as a base for your own environments. There is also a ``python2`` environment,
which is the same but with a Python 2 installation.

.. warning::

    Due to Anaconda being installed in a module you must use the ``source`` command instead of ``conda`` 
    when activating or deactivating environments!

Quickly Conda Environments
-------------------------------------

There are a small number of environments provided for everyone to use, these are
the default ``root`` and ``python2`` environments as well as various versions
of Anaconda for Python 3 and Python 2.

The anaconda environments can be loaded through provided module files::

    module load apps/python/anaconda2-4.2.0
    module load apps/python/anaconda3-4.2.0

Where ``anaconda2`` represents Python 2 installations and ``anaconda3``
represents Python 3 installations.
These commands will also load the ``apps/python/conda`` module and then
activate the anaconda environment specified.

.. note::
   Anaconda 2.5.0 and higher are compiled with Intel MKL libraries which should
   result in higher numerical performance.


Using a Conda Environment
-------------------------

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

.. _sharc_conda_create_env:

Creating a Conda Environment
----------------------------

Every user can create their own environments, and packages shared with the
system-wide environments will not be reinstalled or copied to your file store,
they will be ``symlinked``, this reduces the space you need in your ``/home``
directory to install many different Python environments.

To create a clean environment with just Python 2 and numpy you can run::

    conda create -n mynumpy python=2.7 numpy

This will download the latest release of Python 2.7 and numpy, and create an
environment named ``mynumpy``.

Any version of Python or list of packages can be provided::

    conda create -n myscience python=3.5 numpy=1.15.2 scipy

If you wish to modify an existing environment, such as one of the anaconda
installations, you can ``clone`` that environment::

    conda create --clone anaconda3-4.2.0 -n myexperiment

This will create an environment called ``myexperiment`` which has all the
anaconda 4.2.0 packages installed with Python 3.


.. _sharc_conda_data_dir:

Avoiding large Conda environments filling up your home directory
----------------------------------------------------------------

If you want to create one or more large Conda environments
(e.g. containing bulky Deep Learning packages such as TensorFlow or PyTorch)
then there's a risk you'll quickly use up your home directory's :ref:`10GB storage quota <filestore>`.

Create a ``.condarc`` file in your home directory if it does not already exist. 
Add an ``envs_dirs:`` and ``pkgs_dirs:`` section as shown below:

::

    pkgs_dirs:
    - /data/username/anaconda/.pkg-cache/

    envs_dirs:
    - /data/username/anaconda/.envs


Make sure to replace ``username`` with your own username and 
then create these folders by running the following command: ::

    mkdir -p /data/$USER/anaconda/.pkg-cache/  /data/$USER/anaconda/.envs

Installations of environments and package caching should now occur in your ``/data`` 
area.


Installing Packages Inside an Environment
-----------------------------------------

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
using pip, *i.e.*::

    pip search colormath

    pip install colormath


Using Python with MPI
---------------------

There is an **experimental** set of packages for conda
that have been compiled by the RSE and RCG teams,
which allow you to use a MPI stack entirely managed by Conda.
This allows you to easily create complex evironments and
use MPI without worrying about other modules or system libraries.

To get access to these packages you need to
run the following command to add the repo to your conda config: ::

    conda config --add channels file:///usr/local/packages/apps/conda/conda-bld/

you should then be able to install the packages with the ``openmpi`` feature,
which currently include ``openmpi``, ``hdf5``, ``mpi4py`` and ``h5py``: ::

    conda create -n my_mpi_env python=3.5 openmpi mpi4py

Currently, this channel provides Conda packages for:

- ``mpi4py`` (and ``openmpi``) for Python 3.4, 3.5, 3.6 and 2.7
- ``h5py`` (and ``hdf5``) with MPI support for Python 3.5 and 2.7

The build scripts for these packages can be found in
this `GitHub <https://github.com/rcgsheffield/conda-packages>`_ repository.


Further Conda Python Learning Resources
---------------------------------------

.. include:: /referenceinfo/imports/software/python/python_learning_resources_import.rst

Installation Notes
------------------
These are primarily for administrators of the system.

The conda package manager is installed in ``/usr/share/packages/apps/conda``, it
was installed using the `miniconda <http://conda.pydata.org/miniconda.html>`_
installer.

It is important to regularly update the ``root`` environment to keep the conda
package manager up to date. To do this login as a ``sa_`` account (with write
permissions to ``/usr/local/packages/apps/conda``) and run::

    $ conda update --all
    $ conda update conda

Between updates, remove write permissions on certain dirs/files to prevent sysadmins from
accidentally installing central conda envs instead of local ones /
encountering errors when trying to create local envs: ::

   chmod ugo-w /usr/local/packages/apps/conda /usr/local/packages/apps/conda/envs
   chmod -R ugo-w /usr/local/packages/apps/conda/pkgs

Installing a New Version of Anaconda
####################################

Run the following as a ``sa_`` user (with write permissions to
``/usr/local/packages/apps/conda``::

    $ conda create -n anaconda3-<VERSION> python=3 anaconda=<VERSION>
    $ conda create -n anaconda2-<VERSION> python=2 anaconda=<VERSION>


Then copy the modulefile for the previous version of anaconda to the new
version and update the name of the environment. Also you will need to append
the new module to the ``conflict`` line in
`apps/python/.conda-environments.tcl`.

