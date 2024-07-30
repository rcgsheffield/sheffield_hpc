.. _python_stanage:

Python
======

.. sidebar:: Python

    :Versions: 2019.7,2020.11,2021.11,2022.05,2022.10
    :Documentation: https://www.python.org/doc/
    :URL: https://python.org


This page documents the "anaconda" installation on Stanage. This is the
recommended way of using Python, and the best way to be able to configure custom
sets of packages for your use.

"conda" a Python package manager, allows you to create "environments" which are
sets of packages that you can modify. It does this by installing them in your
home area. This page will guide you through loading conda and then creating and
modifying environments so you can install and use whatever Python packages you
need.

Using Conda Python
------------------

.. attention::
         
        **We recommend that you use the following 2022 (sub)version of Anaconda3:** ``Anaconda3/2022.05``
        
        *The latest module,* ``Anaconda3/2022.10`` *, is under investigation as this has demonstrated odd 
        behaviour on conda environment exit (for some users). We will investigate this, and advise in due course.*

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

Anaconda Python can be loaded with one of the following::

    module load Anaconda3/2019.07
    module load Anaconda3/2020.11 
    module load Anaconda3/2021.11
    module load Anaconda3/2022.05
    module load Anaconda3/2022.10

The ``root`` conda environment (the default) provides Python 3 and no extra
modules, it is automatically updated, and not recommended for general use, just
as a base for your own environments.

.. warning::

    Due to Anaconda being installed in a module you must use the ``source`` command instead of ``conda`` 
    when activating or deactivating environments!


Creating a Conda Environment
----------------------------

Every user can create their own environments, and packages shared with the
system-wide environments will not be reinstalled or copied to your file store,
they will be *symlinked*, this reduces the space you need in your ``/users/$USER``
directory to install many different Python environments.

To create a clean environment with just Python 3.8 and numpy you can run::

    conda create -n mynumpy python=3.8 numpy

This will download the latest release of Python 3.8 and numpy, and create an
environment named ``mynumpy``.

Any version of Python or list of packages can be installed::

    conda create -n myscience python=3.5 numpy=1.15.2 scipy

If you wish to modify an existing environment, such as one of the anaconda
installations, you can ``clone`` that environment::

    conda create --clone myscience -n myexperiment

This will create an environment called ``myexperiment`` which has all the
same conda packages as the ``myscience`` environment.

How to avoid large conda environments filling up your home directory
--------------------------------------------------------------------

.. include:: ../../../referenceinfo/imports/software/python/conda_in_fastdata.rst

Installing Packages Inside a Conda Environment
----------------------------------------------

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
------------------------

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

Using Conda and Python in a batch job
-------------------------------------

Create a batch job submission script called ``myscript.slurm`` that is similar to the following:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --ntasks=1
   #SBATCH --time=10:00
   #SBATCH --mem-per-cpu=100

   export SLURM_EXPORT_ENV=ALL
   module load Anaconda3/2022.10

   # We assume that the conda environment 'myexperiment' has already been created
   source activate myexperiment
   srun python mywork.py

Then submit this to Slurm by running:

.. code-block:: bash

   sbatch myscript.slurm


Further Conda Python Learning Resources
---------------------------------------

.. include:: /referenceinfo/imports/software/python/python_learning_resources_import.rst

------------------

Installation notes
------------------

Anaconda 2022.10 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anaconda was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTANACONDA3/easybuild`` with the module loaded.

Anaconda 2022.05 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anaconda was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTANACONDA3/easybuild`` with the module loaded.

Anaconda 2021.11 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anaconda was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTANACONDA3/easybuild`` with the module loaded.

Anaconda 2020.11 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anaconda was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTANACONDA3/easybuild`` with the module loaded.

Anaconda 2019.7 (EasyBuild install):
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Anaconda was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTANACONDA3/easybuild`` with the module loaded.