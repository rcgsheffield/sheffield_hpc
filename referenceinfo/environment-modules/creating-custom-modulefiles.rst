.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Making software available via a custom module file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you wish to use the :ref:`modules system <software_installs_modules>` with personal 
module files you can add a directory called modules to your home directory 
``mkdir $HOME/modules`` and populate this with your own module files.

To make these available automatically you can then add the ``module use $HOME/modules`` 
command to your ``.bashrc`` file.

You can generate a basic module file using the basic TCL directives to ``set`` variables, 
export these to your shell with ``setenv`` and prepend paths to your existing environment 
variables with ``prepend-path``.


.. warning::

    Module files are **not aware of bash shell variables unless you import them** from the env array 
    and set a TCL variable based on them.
    
    e.g. the following example imports our **shell environment** ``HOME`` variable and sets the **TCL** 
    ``HOME`` variable with it. The **TCL** ``HOME`` variable is used to set the **TCL variable** ``MY_PROGRAM_DIR`` 
    (the software's installation directory). The **TCL** ``MY_PROGRAM_DIR`` variable is then used to add the program's 
    ``bin`` directory to your **shell environment** ``PATH`` variable with the ``prepend-path`` directive.

    .. code-block:: TCL

        set             HOME                $::env(HOME)
        set             MY_PROGRAM_DIR      $HOME/software/installs/my_new_program
        prepend-path    PATH                $MY_PROGRAM_DIR/bin


Much like using a ``.bashrc`` file with the export command, we can add the required variables and directives 
to a custom module file. For example, if called ``CustomModule`` and saved in ``$HOME/modules/`` may 
look something like:

.. code-block:: TCL

    #%Module1.0#####################################################################
    ##
    ## My newly installed program module file
    ##

    ## Module file logging - this is TUoS cluster specific!
    source /usr/local/etc/module_logging.tcl
    ##

    proc ModulesHelp { } {
            puts stderr "Makes my newly installed program available."
    }

    module-whatis   "Makes my newly installed program available."

    ## Load any dependencies
    
    module load GCC/10.2
    module load CMake/3.18.4-GCCcore-10.2.0

    ## Set a program root directory TCL variable MY_PROGRAM_DIR to simplify prepend-path directives.
    ## **Reminder** setting an environment variable with setenv does not set the equivalent TCL variable!
    ## **Reminder** setting a TCL variable does not set the equivalent shell environment variable either!
    ## Note no trailing slash is required for MY_PROGRAM_DIR as we are using a / on the prepend-path directives.

    set             MY_PROGRAM_DIR              /home/my_username/software/installs/my_new_program
    setenv          MY_PROGRAM_DIR              $MY_PROGRAM_DIR
    setenv          MY_SOFTWARE_LICENSE_PATH    /home/my_username/software/licenses/mysoftware/license.lic

    prepend-path    PATH               $MY_PROGRAM_DIR/bin
    prepend-path    LIBRARY_PATH       $MY_PROGRAM_DIR/lib
    prepend-path    LD_LIBRARY_PATH    $MY_PROGRAM_DIR/lib
    prepend-path    PKG_CONFIG_PATH    $MY_PROGRAM_DIR/lib/pkgconfig
    prepend-path    CMAKE_PREFIX_PATH  $MY_PROGRAM_DIR

.. hint::

    If you get warnings about missing file paths please ensure the file path exists and/or you have not made a mistake 
    when defining your TCL variables. (Remember the difference between ``set`` and ``setenv`` directives and that one 
    does not set the other.)

If the module use command (``module use $HOME/modules``) is applied in your ``.bashrc`` file you could now load this module by running:

.. code-block:: console

    $ module load CustomModule

And unload with:

.. code-block:: console

    $ module unload CustomModule


Modulefiles make it easy to add many versions of the same software easily via duplication and simple editing 
without the risk of permanently corrupting your shell environment. Further info on the modules system can be 
found on the :ref:`modules page <env_modules>`.
