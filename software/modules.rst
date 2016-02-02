.. _modules_usage:

Modules on Iceberg
==================



In general the software available on iceberg is loaded and unloaded via the use
of the modules system [#env-modules]_.

Modules make it easy for us to install many versions of different applications, compilers and libraries side by side and allow users to setup the computing environment to include exactly what they need.

.. note::
    Modules are not available on the login node. You must move to a worker node using either ``qrsh`` or ``qsh`` (see :ref:`getting-started`) before any of the following commands will work.

Available modules can be listed using the following command::

    module avail

Modules have names that look like ``apps/python/2.7``. To load this module, you'd do::

    module load apps/python/2.7

You can unload this module with::

    module unload apps/python/2.7

It is possible to load multiple modules at once, to create your own environment
with just the software you need. For example, perhaps you want to use version 4.8.2 of the gcc compiler along with MATLAB 2014a ::

    module load compilers/gcc/4.8.2
    module load apps/matlab/2014a

Confirm that you have loaded these modules wih ::

   module list

Remove the MATLAB module with ::

    module unload apps/matlab/2014a

Remove all modules to return to the base environment ::

    module purge

Module Command Reference
########################
Here is a list of the most useful module commands. For full details, type ``man module`` at an iceberg command prompt.

* ``module list`` – lists currently loaded modules
* ``module avail`` – lists all available modules
* ``module load modulename`` – loads module modulename
* ``module unload modulename`` – unloads module modulename
* ``module switch oldmodulename newmodulename`` – switches between two modules
* ``module initadd modulename`` – run this command once to automatically ensure that a module is loaded when you log in. (It creates a .modules file in your home dir which acts as your personal configuration.)
* ``module show modulename`` - Shows how loading modulename will affect your environment
* ``module purge`` – unload all modules
* ``module help modulename`` – may show longer description of the module if present in the modulefile
* ``man module`` – detailed explanation of the above commands and others

.. [#env-modules] http://modules.sourceforge.net/
