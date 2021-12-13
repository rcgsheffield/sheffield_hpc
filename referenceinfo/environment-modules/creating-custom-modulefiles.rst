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

You can generate a basic module file using the basic TCL commands to ``set`` variables, 
export these to your shell with ``setenv`` and prepend paths to your existing environment 
variables with ``prepend-path``.


.. warning::

    Module files are not aware of bash variables unless you import them from the env array 
    and set a variable based on them, e.g. 

    .. code-block:: TCL

        set             HOME                $::env(HOME)
        set             MY_PROGRAM_DIR      $HOME/software/installs/my_new_program
        prepend-path    PATH                $MY_PROGRAM_DIR/bin


Much like using a ``.bashrc`` file we  add the required variables to a custom module file 
which if called ``CustomModule`` and saved in ``/home/myusername/modules/`` may look something like:

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
    
    module load dev/gcc/8.2
    module load dev/cmake/3.17.1/gcc-8.2

    ## Set a program root directory variable - note that this is does not set the environment variable.
    ## Note no trailing slash.
    set             MY_PROGRAM_DIR              /home/my_username/software/installs/my_new_program
    setenv          MY_PROGRAM_DIR              $MY_PROGRAM_DIR
    setenv          MY_SOFTWARE_LICENSE_PATH    /home/my_username/software/licenses/mysoftware/license.lic

    prepend-path    PATH               $MY_PROGRAM_DIR/bin
    prepend-path    LIBRARY_PATH       $MY_PROGRAM_DIR/lib
    prepend-path    LD_LIBRARY_PATH    $MY_PROGRAM_DIR/lib
    prepend-path    PKG_CONFIG_PATH    $MY_PROGRAM_DIR/lib/pkgconfig
    prepend-path    CMAKE_PREFIX_PATH  $MY_PROGRAM_DIR


If the module set command is applied in your ``.bashrc`` file you could now load this module by running:

.. code-block:: console

    $ module load CustomModule

And unload with:

.. code-block:: console

    $ module unload CustomModule


Modulefiles make it easy to add many versions of the same software easily via duplication and simple editing 
without the risk of permanently corrupting your shell environment. Further info on the modules system can be 
found on the :ref:`modules page <env_modules>`.
