.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Making software available via the .bashrc file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Software can be made available using your ``.bashrc`` file and adding/editing any 
relevant environment variables. 

.. warning::

    Using your ``.bashrc`` file to make software available on ShARC will not work correctly in 
    ``qsub`` batch jobs unless you amend the bash shebang from ``#!/bin/bash`` to ``#!/bin/bash -i`` 
    due to non-interactive sessions **not** sourcing the ``.bashrc`` file. 

.. caution::

    We do not recommend editing your ``.bashrc`` file as this could result in corrupting your 
    shell environment. If possible make use of the :ref:`modules system <software_installs_modules>`.

Assuming you have installed your software in a folder with the path ``/home/$USER/software/installs/mysoftware`` 
and the software has added a ``bin`` and ``lib`` folder. You would adjust your file to be:

.. code-block:: bash

    export PATH=/home/$USER/software/installs/mysoftware/bin:$PATH
    export LD_LIBRARY_PATH=/home/$USER/software/installs/mysoftware/lib:$LD_LIBRARY_PATH

If you are installing libraries and software that are dependencies, using 64 bit software, 
need to set a variable for a license server/file etc... you may also need to use other environment 
variables pointing at different paths e.g.

.. code-block:: bash

    export LD_LIBRARY_PATH=/home/$USER/software/installs/mysoftware/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/home/$USER/software/installs/mysoftware/lib64:$LD_LIBRARY_PATH

.. code-block:: bash

    export LIBRARY_PATH=/home/$USER/software/installs/mysoftware/lib:$LIBRARY_PATH
    export LIBRARY_PATH=/home/$USER/software/installs/mysoftware/lib64:$LIBRARY_PATH

.. code-block:: bash

    export PKG_CONFIG_PATH=/home/$USER/software/installs/mysoftware/lib/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=/home/$USER/software/installs/mysoftware/lib64/pkgconfig:$PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=/home/$USER/software/installs/mysoftware/share/pkgconfig:$PKG_CONFIG_PATH

.. code-block:: bash

    export ACLOCAL_PATH=/home/$USER/software/installs/mysoftware/share/aclocal:$ACLOCAL_PATH

.. code-block:: bash

    export CMAKE_PREFIX_PATH=/home/$USER/software/installs/mysoftware/:$CMAKE_PREFIX_PATH

.. code-block:: bash

    export CPLUS_INCLUDE_PATH=/home/$USER/software/installs/mysoftware/include:$CPLUS_INCLUDE_PATH
    export CPATH=/home/$USER/software/installs/mysoftware/include:$CPATH

.. code-block:: bash

    export MY_SOFTWARE_LICENSE_PATH=/home/$USER/software/licenses/mysoftware/license.lic