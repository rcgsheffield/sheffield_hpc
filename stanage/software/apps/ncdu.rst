.. |softwarename| replace:: ncdu
.. |currentver| replace:: 1.18
.. |ebtoolchain| replace:: GCCcore-12.3.0

.. _ncdu_stanage:

|softwarename|
==========================================================================================================


.. sidebar:: |softwarename|

   :Latest Version:  |currentver|
   :Dependencies: |ebtoolchain| (see Easybuild for details.)
   :URL: https://dev.yorhel.nl/ncdu

|softwarename| is a disk usage analyzer with an ncurses interface. It is designed to find space hogs on a remote server where you don’t have an entire graphical setup available.
Ncdu aims to be fast, simple and easy to use, and should be able to run in any minimal POSIX-like environment with ncurses installed.

--------

Interactive usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

A version of |softwarename| is made available with one of the following commands:

.. code-block:: console

        module load ncdu/1.18-GCC-12.3.0
        module load ncdu/1.17-GCC-11.3.0
        module load ncdu/1.15.1-GCCcore-9.3.0

After this any of the |softwarename| commands can be run from the terminal prompt. The available 
commands can be obtained using:

.. code-block:: console

	$ ncdu --help

|softwarename| is an excellent tool for determining what files and folders are consuming your storage 
quota in the file storage areas. The example command below instructs ncdu to scan your home 
directory and will then show an interactive summary of storage usage by file and folder.

.. code-block:: console

   $ ncdu $HOME

Screenshots of the program in use can be found on the following page: https://dev.yorhel.nl/ncdu/scr

--------

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELNCDU`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^

Testing has been conducted by running an interactive session and scanning a directory with success.

--------


