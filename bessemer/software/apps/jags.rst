.. _jags_bessemer:
.. |softwarename| replace:: JAGS
.. |currentver| replace:: 4.3.0
.. |ebtoolchain| replace:: foss-2020a

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: http://mcmc-jags.sourceforge.net/

|softwarename| is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical 
models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.  JAGS was written with three aims in mind:

* To have a cross-platform engine for the BUGS language.
* To be extensible, allowing users to write their own functions, distributions and samplers.
* To be a platform for experimentation with ideas in Bayesian modeling.

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load JAGS/4.3.0-foss-2020a

After this the |softwarename| command can be run from the terminal prompt:

.. code-block:: console

    $ jags
    Welcome to JAGS 4.3.0 on Thu Mar 24 15:43:13 2022
    JAGS is free software and comes with ABSOLUTELY NO WARRANTY
    Loading module: basemod: ok
    Loading module: bugs: ok
    . 


The rjags and runjags interfaces in R
-------------------------------------
`rjags <https://cran.r-project.org/web/packages/rjags/index.html>`_ and 
`runjags <https://cran.r-project.org/web/packages/runjags/index.html>`_ 
are CRAN packages that provide an R interface to JAGS. They are not installed in R by default.

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst
    
Run the following module commands :

.. code-block:: console

    $ module load JAGS/4.3.0-foss-2020a
    $ module load R/4.0.0-foss-2020a


Launch R by typing ``R`` and pressing return. Within R, execute the following commands ::

    install.packages('rjags')
    install.packages('runjags')

and follow the on-screen inctructions. Answer ``y`` to any questions about the creation of 
a personal library should they be asked.

The packages will be stored in a directory called `R` within your home directory.

You should only need to run the ``install.packages`` commands **once**. When you log 
into the system in future, you will only need to run the ``module`` commands above to make JAGS available to the system.

You load the rjags packages the same as you would any other R package ::

    library('rjags')
    library('runjags')

.. warning::

    If you received an error message such as :

    .. code-block:: console

        Error : .onLoad failed in loadNamespace() for 'rjags', details:
        call: dyn.load(file, DLLpath = DLLpath, ...)
        error: unable to load shared object '/home/te1st/R/x86_64-unknown-linux-gnu-library/3.2/rjags/libs/rjags.so':
        libjags.so.3: cannot open shared object file: No such file or directory
        Error: package or namespace load failed for 'rjags'

    The most likely cause is that you forget to load the necessary modules before starting R.


Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 4.3.0 was installed using Easybuild 4.4.0, build details can be found 
in ``/usr/local/packages/live/eb/JAGS/4.3.0-foss-2020a/easybuild``