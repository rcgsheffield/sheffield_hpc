.. _env_modules:

Activating software using Environment Modules
=============================================

Overview and rationale
----------------------

'Environment Modules' are the mechanism by which much of the software is made available to the users of the Bessemer and ShARC clusters.

To make a particular piece of software available a user will *load* a module e.g. 
on ShARC, you can load a particular version of the '``scotch``' library (version 6.0.4, built using the GCC 6.2 compiler and with support for parallel execution using OpenMPI 2.0.1) with: ::

    module load libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1

This command manipulates `environment variables <https://en.wikipedia.org/wiki/Environment_variable>`_ to make this piece of software available.  
If you then want to switch to using a different version of ``scotch`` (should another be installed on the cluster you are using) then you can run: ::

    module unload libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1
    
then load the other.  

You may wonder why modules are necessary: why not just install packages provided by the vender of the operating system installed on the cluster?
In shared high-performance computing environments such as Bessemer and ShARC:

* users typically want control over the version of applications that is used (e.g. to give greater confidence that results of numerical simulations can be reproduced);
* users may want to use applications built using compiler X rather than compiler Y as compiler X might generate faster code and/or more accurate numerical results in certain situations;
* users may want a version of an application built with support for particular parallelisation mechanisms such as MPI for distributing work between machines (ShARC only), OpenMP for distributing work between CPU cores or CUDA for parallelisation on GPUs);
* users may want an application built with support for a particular library.

There is therefore a need to maintain multiple versions of the same applications on Bessemer and ShARC.
Module files allow users to select and use the versions they need for their research.

If you switch to using a cluster other than Bessemer or ShARC then you will likely find that environment modules are used there too.  
Modules are not the only way of managing software on clusters: increasingly common approaches include:

* the :ref:`Conda <sharc-python-conda>` package manager (Python-centric but can manage software written in any language; can be used on Bessemer and ShARC);
* :ref:`Singularity <singularity_sharc>`, a means for deploying software in `containers <https://en.wikipedia.org/wiki/Operating-system-level_virtualization>`__ (similar to `Docker <https://www.docker.com/>`__; can be used on ShARC).

Basic guide
-----------

You can list all (loaded and unloaded) modules on Bessemer or ShARC using: ::

    module avail

You can then load a module using e.g.: ::

    module load libs/geos/3.6.1/gcc-4.9.4

.. note::
    Modules are not available on login nodes. You must start an interactive job on a worker node using ``qrshx``, ``qsh`` or ``qrsh`` (see :ref:`getting-started`) before any of the following commands will work.

You can then load further modules e.g.::

    module load libs/gdal/2.2.0/gcc/gcc-4.9.4

Confirm which modules you have loaded using: ::

   module list

If you want to stop using a module (by undoing the changes that loading that module made to your environment): ::

    module unload libs/gdal/2.2.0/gcc/gcc-4.9.4

or to unload all loaded modules: ::

    module purge

To learn more about what software is available on the system and discover the names of module files, you can view the online documentation for 

* :ref:`software on Bessemer <bessemer-software>`
* :ref:`software on ShARC <sharc-software>`


The name of a Module should tell you:
 
* the type of software (application, library, development tool (e.g. compiler), parallel computing software);
* the name and version of the software;
* the name and version of compiler that the software was built using (if applicable; not all installed software was installed from source);
* the name and version of used libraries that distinguish the different installs of a given piece of software (e.g. the version of OpenMPI an application was built with).

Note that the module naming convention differs between Bessemer and ShARC.

Some other things to be aware of:

* You can load and unload modules in both interactive and batch jobs;
* Modules may themselves load other modules.  If this is the case for a given module then it is typically noted in our documentation for the corresponding software;
* Available applications and application versions may differ between Bessemer and ShARC;
* The order in which you load modules may be significant (e.g. if module A sets ``SOME_ENV_VAR=apple`` and module B sets ``SOME_ENV_VAR=pear``);
* Some related module files have been set up so that they are mutually exclusive e.g. on ShARC the modules ``dev/NAG/6.0`` and ``dev/NAG/6.1`` cannot be loaded simultaneously (as users should never want to have both loaded).

.. _search_env_modules:

Searching for Modules
----------------------

You can search for a module using: ::

    module avail |& grep -i somename

Where you replace **somename** with the string you wish to search for.

You may wish to setup a bash alias in your ``$HOME/.bashrc`` file with this as a short cut e.g. : ::

    alias modulefind="module avail |& grep -i"

After sourcing ``$HOME/.bashrc`` this command can then be called like so: 

.. code-block:: console

    $ source $HOME/.bashrc
    $ modulefind intel
    CFITSIO/3.45-intel-2018b
    FDS/6.7.5-intel-2020a
    intel/2018b
    intel/2019a
    intel/2019b
    intel/2020a
    VASP/5.4.1-intel-2019b
    VASP/5.4.4-intel-2019b


Behind the scenes
-----------------

Let's look at what happens when you load an enviroment.  
You can run the following example on ShARC (regardless of whether the ``dev/NAG/6.1`` module file loaded): ::

    $ module show dev/NAG/6.1
    -------------------------------------------------------------------
    /usr/local/modulefiles/dev/NAG/6.1:

    module-whatis	 Makes the NAG Fortran Compiler v6.1 available 
    conflict	 dev/NAG 
    prepend-path	 PATH /usr/local/packages/dev/NAG/6.1/bin 
    prepend-path	 MANPATH /usr/local/packages/dev/NAG/6.1/man 
    setenv		 NAG_KUSARI_FILE /usr/local/packages/dev/NAG/license.lic 

Here we see:

* The full path to the file that contains the definition of this module;
* A line briefly describing the purpose of the module (which could have been viewed separately using ``module whatis dev/NAG/6.1``);
* An instruction not to load any other module files that start with ``dev/NAG`` as they will cause a conflict;
* A directory is prepended to the standard ``PATH`` variable: this ensures that executables relating to ``dev/NAG/6.1`` are preferentially used unrelated executables in ``PATH`` directories that share the same filenames.  **Note that this directory is specific to this version (6.1) of the application we want to use**;
* A directory is prepended to the standard ``MANPATH`` variable to ensure that the documentation (`man pages <https://en.wikipedia.org/wiki/Man_page>`__) that the vendor bundled with the application can be found;
* An application-specific environment variable, ``NAG_KUSARI_FILE``, is set (here to ensure that the application can find a license file).

If you run the '``env``' command before and after loading a module you can see the effect of these changes.

Convenient ways to set up your environment for different projects
-----------------------------------------------------------------

If you regularly need to activate multiple modules whilst working on a given project 
it may be tempting to add the necessary ``module load`` commands to a shell startup script 
(e.g. the ``.bashrc`` script in your home directory).  
However, this is a **Bad Idea** for several reasons:

* Over time you will forget what is in your ``.bashrc`` and may forget that your workflow is dependent on modules loaded by the script;
* Your ``.bashrc`` script may not be managed using version control (e.g. `Git <https://git-scm.com/>`__) or, 
  if it is, it is unlikely to be in the same repository as your project scripts/code;
* If someone asks you in three months' time what version of an application you used to run a simulation will you be able to tell them?

A better approach is to create a module-loading script *inside* the directory containing your project's other scripts
then ``source`` (run) this script.

For example, you could have project scripts stored in a directory called ``/home/te1st/proj1``.

You could create a script in that directory called ``setup_env.sh`` containing: ::

    module load compilers/pgi/13.1
    module load mpi/pgi/openmpi/1.6.4

then if you want to load these modules **in an interactive session or in a batch job** you could run: ::

    source /home/te1st/proj1/setup_env.sh

If you want to run the job on both Bessemer and ShARC (which provide different software / module files) 
you could adapt your script to load different modules depending on which cluster you are using: ::

    if [[ -n "$SGE_CLUSTER_NAME" ]]; then
        # On ShARC:
        module load some/module
        module load another/module
    else
        # On Bessemer
        module load different/module
    fi

Managing your environment this way is more likely to result in reproducible research, 
particularly if changes to the content of ``/home/te1st/proj1`` are tracked using Git or another version control tool

Managing your own module files
------------------------------

Modules are a great way of loading/unloading software installed in non-standard places.  
You may therefore want to use them to manage software installed in 

* your home directory
* a directory shared by your research group

If you want your own Modules, you typically need to create a hierarchy of directories and files.  Within a base directory the relative path to a given module file determines the name you need to use to load it.  See the ``/usr/local/modulefiles`` directories on Bessemer and ShARC to:

* see the files that provide all cluster-wide modules and 
* get an understanding of the (`Tcl <https://www.tcl.tk/>`__) syntax and structure of module files.  

A tutorial on how to write module files is not provided here (but may be in future).

Once you've created a set of module files within a directory you can make the module system aware of them by running: ::

    module use /the/path/to/my/modules

The next time you run ``module avail`` you will see that your modules are listed alongside the cluster-wide modules.

If you no longer want to to have access to your own module files then you can run: ::

    module unuse /the/path/to/my/modules

Module Command Reference
------------------------
Here is a list of the most useful ``module`` commands. For full details, type ``man module`` at the command prompt on one of the clusters.

* ``module list`` – lists currently loaded modules
* ``module avail`` – lists all available modules
* ``module load modulename`` – loads module ``modulename``
* ``module unload modulename`` – unloads module ``modulename``
* ``module switch oldmodulename newmodulename`` – switches between two modules
* ``module show modulename`` - Shows how loading ``modulename`` will affect your environment
* ``module purge`` – unload all modules
* ``module help modulename`` – may show longer description of the module if present in the modulefile
* ``man module`` – detailed explanation of the above commands and others

More information on the Environment Modules software can be found on the `project's site <http://modules.sourceforge.net/>`_.
