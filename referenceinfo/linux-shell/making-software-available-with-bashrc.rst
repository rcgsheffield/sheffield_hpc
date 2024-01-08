.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Making software available via the .bashrc file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Software can be made available using your ``.bashrc`` file and adding/editing any 
relevant environment variables. 

.. caution::

    We do not recommend editing your ``.bashrc`` file as this could result in corrupting your 
    shell environment. If possible make use of the :ref:`modules system <software_installs_modules>`.

Assuming you have installed your software in a folder with the path ``$HOME/software/installs/mysoftware`` 
and the software has added a ``bin`` and ``lib`` folder. You would adjust your file to be:

.. code-block:: bash

    export PATH=$HOME/software/installs/mysoftware/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/software/installs/mysoftware/lib:$LD_LIBRARY_PATH

If you are installing libraries and software that are dependencies, using 64 bit software, 
need to set a variable for a license server/file etc... you may also need to use other environment 
variables pointing at different paths e.g.

.. code-block:: bash

    export LD_LIBRARY_PATH=$HOME/software/installs/mysoftware/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/software/installs/mysoftware/lib64:$LD_LIBRARY_PATH

.. code-block:: bash

    export LIBRARY_PATH=$HOME/software/installs/mysoftware/lib:$LIBRARY_PATH
    export LIBRARY_PATH=$HOME/software/installs/mysoftware/lib64:$LIBRARY_PATH

.. code-block:: bash

    export PKG_CONFIG_PATH=$HOME/software/installs/mysoftware/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$HOME/software/installs/mysoftware/lib64/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=$HOME/software/installs/mysoftware/share/pkgconfig:$PKG_CONFIG_PATH

.. code-block:: bash

    export ACLOCAL_PATH=$HOME/software/installs/mysoftware/share/aclocal:$ACLOCAL_PATH

.. code-block:: bash

    export CMAKE_PREFIX_PATH=$HOME/software/installs/mysoftware/:$CMAKE_PREFIX_PATH

.. code-block:: bash

    export CPLUS_INCLUDE_PATH=$HOME/software/installs/mysoftware/include:$CPLUS_INCLUDE_PATH
    export CPATH=$HOME/software/installs/mysoftware/include:$CPATH

.. code-block:: bash

    export MY_SOFTWARE_LICENSE_PATH=$HOME/software/licenses/mysoftware/license.lic