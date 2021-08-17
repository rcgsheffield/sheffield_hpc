.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

The .bashrc file and its purpose
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. caution::
    Editing the ``.bashrc`` file can lead to a corrupted shell environment which can leave 
    you unable to login or run programs. 

    Please take care if editing this file and consider using the 
    :ref:`modules system <software_installs_modules>` to add directories to the ``PATH`` and 
    ``LD_LIBRARY_PATH`` to avoid inadvertent mistakes.
    
    If you find your shell environment is behaving oddly, programs are no longer available and 
    you suspect you may have corrupted your shell environment by editing the ``.bashrc`` file you 
    can reset it with the command ``resetenv`` or ``/usr/local/scripts/resetenv`` then 
    logging out and back in.


The ``.bashrc`` file is a hidden script file located in a user's home directory which runs 
when the user logs in using the bash shell. The contents of ``.bashrc`` can be changed to define 
functions, command aliases, and customize the bash shell to the user's liking.

As this file is executed when the user logs in, it can be customised to add additional directories 
to the ``PATH`` and ``LD_LIBRARY_PATH`` in order to make software available to the shell.

Adding a directory such as a personal installation directory with executables and libraries can be 
achieved as below: 

.. code-block:: bash

    export PATH=$HOME/software/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/software/lib:$LD_LIBRARY_PATH

.. note::
    The code above adds the personal directory to the front of each list - the order of the directories 
    in each list is important as the highest priority for the list is read from left to right.

    This means that in the above case, the personal installations take priority and the shell will 
    preferentially run the binaries from the personal installations if there are multiple locations 
    with the same named executable or library.
