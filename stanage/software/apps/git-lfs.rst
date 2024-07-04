.. _git-lfs_stanage:

.. |softwarename| replace:: Git LFS
.. |currentver| replace:: 3.4.0

|softwarename|
================================================================================

.. sidebar:: |softwarename|

   :Latest version: |currentver|
   :URL: https://git-lfs.github.com
   
Git Large File Storage (LFS) replaces large files such as audio
samples, videos, datasets, and graphics with text pointers inside Git, while 
storing the file contents on a remote server like GitHub.com

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

The latest versions of |softwarename| is made available with the command:

.. code-block:: console
        
    module load git-lfs/3.4.0
    module load git-lfs/3.2.0
        

You can now run the ``git lfs`` command:

Examples
--------

To get started with Git LFS, the following commands can be used.


Choose the type of files you want to track, for examples all ISO
images, with git lfs track:

.. code-block:: 

    git lfs track "*.iso"

The above stores this information in gitattributes files, so that
file needs to be added to the repository:

.. code-block:: 

    git add .gitattributes

Commit, push and work with the files normally:

.. code-block:: 

    git add file.iso
    git commit -m "Add disk image"
    git push




Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTGITMINLFS`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted with the above examples.
