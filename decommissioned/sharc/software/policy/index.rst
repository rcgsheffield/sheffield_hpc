.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc-software-install-guide:

Software install guidelines
===========================

General
-------

- All software will be installed using the environment modules system  
  unless there is a good reason to do otherwise.
- Every install must be documented. Minimum documentation consists of:
   - An install script 
     e.g. :download:`/sharc/software/install_scripts/apps/java/jdk1.8.0_102/binary/install.sh </decommissioned/sharc/software/install_scripts/apps/java/jdk1.8.0_102/binary/install.sh>`.
   - An `Environment Module <http://modules.sourceforge.net/>`__ file (if appropriate)
     e.g. :download:`/sharc/software/modulefiles/apps/java/jdk1.8.0_102/binary </decommissioned/sharc/software/modulefiles/apps/java/jdk1.8.0_102/binary>` 
   - User documentation e.g. :ref:`Java-sharc`.

Community-installed software
----------------------------

Policy and guidelines are to be confirmed.

Centrally-installed software
----------------------------

Process
^^^^^^^

- All updates to the documentation should be made via GitHub Pull Requests and Reviews to allow installs to be audited by other application administrators.

Categories and installation locations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Installs will be split into five **types**
   #. ``apps``: applications
   #. ``libs``: libraries
   #. ``dev``: compilers and development tools
   #. ``mpi``: MPI implementations
   #. ``apptainer``: `Apptainer/Singularity <https://apptainer.org/>`__ container images (plus unpacked NVIDIA drivers for CUDA work)

- Install locations will follow this schema: ::
 
        /usr/local/packages/TYPE/NAME/VERSION/COMPILER-COMPILER_VERSION-OPTIONAL_DETAILS
 
  Examples:

  - R version 3.3.0 compiled with gcc 4.8.2 ::

            /usr/local/packages/apps/R/3.3.0/gcc-4.8.2/

  - R version 3.3.0 compiled with Intel 15.0 ::

            /usr/local/packages/apps/R/3.3.0/intel-15.0/

  - Intel Compiler version 15.1 ::

            /usr/local/packages/dev/intel-15.1
     
  If an application or library, is a binary install, their path will end with ``binary`` rather than a compiler name e.g.
 
  - Mathematica version 10.0.0 ::

            /usr/local/packages/apps/mathematica/10.0.0/binary
 
  If more modules are required, such as OpenMPI version, they will be added to the end of the path. 
  This gives the user an idea of the full environment they are going to be loading. For example:
 
  - Version 4.4.3 of NetCDF library compiled with gcc 4.8.2 using OpenMPI 1.10.1 and HDF5 1.8.16 ::

            /usr/local/packages/lib/netcdf/4.4.3/gcc-4.8.2+openmpi-1.10.1+hdf5-1.8.16
 
  The paths for compilers will obviously be much simpler: ::
 
            /usr/local/packages/type/name/version
            /usr/local/packages/dev/gcc/6.2

- All install scripts should be committed to this documentation's version control repository.

Module files
^^^^^^^^^^^^

- These should have almost-identical names to the corresponding installation directories but with ``packages`` replaced with ``modulesfiles`` e.g. ::

        /usr/local/modulefiles/apps/R/3.3.0/gcc-4.8.2
        /usr/local/modulefiles/apps/R/3.3.0/intel-15.0
        /usr/local/modulefiles/dev/intel/15.1

- Module files should be created for each patch release (if applicable) but 
  if patch releases are installed then there should always be a symlink 
  making it possible to activate the most recent available patch release for a given point release e.g.
  If ``apps/java/1.8u71`` and ``apps/java/1.8u82`` are both module files in ``/usr/local/modulefiles/`` then 
  there should be a symlink from ``/usr/local/modulefiles/apps/java/1.8u71`` pointing at ``/usr/local/modulefiles/apps/java/1.8``.
- All module files should be committed to this documentation's version control repository.

Permissions
^^^^^^^^^^^

- All people able to install software are in the ``app-admins`` Linux group.  
  ``/usr/local/packages`` along with per-application-category subdirectories are writable by the members of ``app-admins``.  
  Install scripts can therefore be run by ``app-admins`` members without the need for privilege escalation and 
  these scripts will be unable to do damage to other parts of the system such as ``/usr/local``.  
  Another benefit of not using ``sudo``/``su`` for installing applications is that 
  there is a record of who last modified each file.  
  Specific requirements:

  - Ensure that all files created by install scripts belong to the ``app-admins`` group unless there is a good reason for doing so (such as restricting access to license files to a certain group of users).
  - Ensure that all files and directories created by install scripts are group-writable unless there is a good reason for doing so (such as restricting access to license files to a certain group of users).

- ``/usr/local/modulefiles`` along with per-application-category subdirectories are writable by the members of ``app-admins``.  

-  To make sure that other admins can modify the files that you create you need to either:

    - at the start of the install process set your ``umask`` to add group-write permissions to all new files: ::
      
            umask 0002

    - or after the install recursively ``chmod`` the directory that you've just added to include group write  e.g. ::
  
            chmod -R g+w /path/to/installed/application

- Note that if you change your ``umask`` setting it will add group write permissions to all new files that you create during your session (which you may not want).  
- Also, some installers may fiddle with file permissions as part of the installation process.
- Some application installers (especially Ansys and some Python packages) create world-writable files, which is a serious security risk.  
- To search an installed application for world-writable files: ::

        find /path/to/installed/application -perm -o+w -! -type l

Sheffield-specific modifications/additions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Any Sheffield-specific modifications/additions (e.g. the ``runabaqus`` etc) 
will have full source code included in the documentation. 

Standard methods of submission (i.e. ones that would likely work on other sites) will also be documented.

Installation media
^^^^^^^^^^^^^^^^^^

Application media used for an install (tar files, sources, binary installers) should be stored in ``/usr/local/media/NAME/VERSION``.  
This aids automated scripted installs and reproducibility.  

``/usr/local/media/protected`` is only accessible by users in the ``app-admins`` group for storing sensitive install media (e.g. to stop licensed install media from being copied).

Universally-useful scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^

Scripts can be stored in ``/usr/local/scripts``.  This is available across all nodes, *including* the login nodes.  
This should only be used for scripts which would be needed by **all** users 
(such as ``quota``, or ``resetenv``).  
This should **not** be used for binaries, or for applications.

Apptainer/Singularity images
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Apptainer/Singularity images are a little different: 
images are to be installed under ``/usr/local/packages/singularity/images`` (naming hierarchy TBC).
Unpacked NVIDIA drivers (for CUDA work) are to be installed under ``/usr/local/packages/singularity/nvidia-driver``.

