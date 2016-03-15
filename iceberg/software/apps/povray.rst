povray
======

.. sidebar:: povray

   :Version: 3.7.0
   :URL: http://www.povray.org/

The Persistence of Vision Raytracer is a high-quality, Free Software tool for creating stunning three-dimensional graphics. The source code is available for those wanting to do their own ports.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or :code:`qrsh` command.
The latest version of povray (currently 3.7) is made available with the command ::

        module load apps/gcc/5.2/povray

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/povray/3.7

This command makes the `povray` binary available to your session. It also loads version 5.2 of the gcc compiler environment since gcc 5.2 was used to compile povray 3.7.

You can now run `povray`. For example, to confirm the version loaded ::

    povray --version

and to get help ::

    povray --help

Documentation
-------------
Once you have made `povray` available to the system using the `module` command above, you can read the man pages by typing ::

    man povray

Installation notes
------------------
povray 3.7.0 was installed using gcc 5.2 using the following script 

* `install_povray-3.7.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/povray/0.37/install_povray-3.7.sh>`_

Testing
-------
The test suite was executed ::

    make check

All tests passed.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/povray/3.7`
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/5.2/povray/3.7>`_.
