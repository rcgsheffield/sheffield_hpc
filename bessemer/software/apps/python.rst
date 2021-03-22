.. _python_conda_bessemer:

Python
======

.. sidebar:: Python

   :Support Level: Core
   :URL: https://python.org


This page documents the "anaconda" installation on Bessemer. This is the
recommended way of using Python, and the best way to be able to configure custom
sets of packages for your use.

"conda" a Python package manager, allows you to create "environments" which are
sets of packages that you can modify. It does this by installing them in your
home area. This page will guide you through loading conda and then creating and
modifying environments so you can install and use whatever Python packages you
need.

Using conda Python
------------------

After connecting to Bessemer, start an interactive session
with the ``srun --pty bash -i command``.

Anaconda Python can be loaded with one of the following: ::

    module load Anaconda3/2019.07
    module load Anaconda3/5.3.0 

The ``root`` conda environment (the default) provides Python 3 and no extra
modules, it is automatically updated, and not recommended for general use, just
as a base for your own environments.


Creating an Environment
#######################

Every user can create their own environments, and packages shared with the
system-wide environments will not be reinstalled or copied to your file store,
they will be *symlinked*, this reduces the space you need in your ``/home``
directory to install many different Python environments.

To create a clean environment with just Python 3.8 and numpy you can run::

    conda create -n mynumpy python=3.8 numpy

This will download the latest release of Python 3.8 and numpy, and create an
environment named ``mynumpy``.

Any version of Python or list of packages can be provided::

    conda create -n myscience python=3.5 numpy=1.8.1 scipy

If you wish to modify an existing environment, such as one of the anaconda
installations, you can ``clone`` that environment::

    conda create --clone myscience -n myexperiment

This will create an environment called ``myexperiment`` which has all the
same conda packages as the ``myscience`` environment.


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
using pip, *i.e.*::

    pip search colormath

    pip install colormath


Using conda Environments
########################

Once the conda module is loaded you have to load or create the desired
conda environments. For the documentation on conda environments see
`the conda documentation <http://conda.pydata.org/docs/using/envs.html>`_.

You can load a conda environment with::

    source activate myexperiment

where ``myexperiment`` is the name of the environment, and unload one with::

    source deactivate

which will return you to the ``root`` environment.

It is possible to list all the available environments with::

    conda env list

Provided system-wide are a set of anaconda environments, these will be
installed with the anaconda version number in the environment name, and never
modified. They will therefore provide a static base for derivative environments
or for using directly.

Using conda and Python in a batch job
#####################################

Create a batch job submission script called ``myscript.slurm`` that is similar to the following:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --ntasks=1
   #SBATCH --time=10:00
   #SBATCH --mem-per-cpu=100

   export SLURM_EXPORT_ENV=ALL
   module load Anaconda3/2019.07

   # We assume that the conda environment 'myexperiment' has already been created
   source activate myexperiment
   srun python mywork.py

Then submit this to Slurm by running:

.. code-block:: bash

   sbatch myscript.slurm



Installing a personal copy of miniconda
---------------------------------------


Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.

------------

The latest miniconda releases will be made available at https://docs.conda.io/en/latest/miniconda.html

On Bessemer you should install miniconda to your home directory e.g. (``/home/$USER/miniconda``).

Download the installer: ::

    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

Check the sums match with those listed on the website: ::

    sha256sum Miniconda3-latest-Linux-x86_64.sh

Make the file executable: ::

    chmod +x Miniconda3-latest-Linux-x86_64.sh

Run the installer but make sure to choose your home directory and subdirectory i.e. /home/$USER/miniconda (n.b. don't make this directory prior to intalling as it makes the directory itself when you supply it with a directory path.)

``Ensure you do not initialize Miniconda as this will break you loading other Anaconda modules on the cluster!`` ::

    ./Miniconda3-latest-Linux-x86_64.sh
    
Make a modules folder for yourself: ::

    mkdir /home/$USER/modules
    
Make a module file for the install you just made: ::

    nano /home/$USER/modules/minconda
    
Make a suitable module file: ::

    #%Module10.2#####################################################################
    ##
    ## User home Directory Miniconda module file
    ##
    #  Updated by JKWMoore 10/12/2020
    #
    #
    ################################################################################
    proc ModulesHelp { } {
    global version

    puts stderr "Makes a user's personal install of Miniconda in their home directory available."
    }

    module-whatis   "Makes a user's personal install of Miniconda in their home directory available."

    # module variables
    #
    set MINICONDA_DIR     /home/$env(USER)/miniconda/bin

    prepend-path PATH $MINICONDA_DIR
    
``Warning - module files are written in TCL not bash!``
    
Make your own modules available to be loaded: ::

    module use /home/$USER/modules

To skip doing the above everytime you login, you can add this line to the .bashrc file in your home directory.

You can load the module whenever you need it with (assuming you named the module file miniconda): ::

    module load miniconda
    
``Avoid loading any two modules of the same type at the same time - i.e. do not load our anaconda modules and miniconda at the same time.``


