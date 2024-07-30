.. _filestore:

Filestores
==========

Every HPC user has access to *up to* five different storage areas:

* :ref:`home_dir`: per-user :term:`backed-up <Mirrored backups>`, :term:`snapshotted <Snapshotted storage>` storage
* :ref:`fastdata_dir`: high-performance shared filesystem for temporary data - optimised for reading/writing large files from multiple nodes and threads simultaneously
* :ref:`shared_dir`: per-PI shared storage areas (snapshotted and backed-up) for project data - can be accessed from non-HPC machines too
* :ref:`scratch_dir`: per-node temporary storage - useful for reading/writing lots of small files within *one job*
* :ref:`community_dir`: cluster-wide storage areas to allow users to share software.

The storage areas differ in terms of:

* the amount of space available;
* whether they are available from multiple nodes;
* whether they are shared between clusters;
* whether the underlying storage system is performant if reading/writing large files;
* whether the underlying storage system is performant if reading/writing small files;
* frequency of :term:`storage snapshotting <Snapshotted storage>`, 
  whether storage is :term:`mirrored <Mirrored backups>` 
  and the maximum duration data can be retained for;
* whether they handle permissions like a typical Linux filesystem.

At present none provide *encryption at rest*.

-----

Choosing the correct filestore
------------------------------

To make a quick assessment of what storage area is likely to best fulfil your needs, please take a look at the provided decision tree below:

.. warning::

  This decision tree only provides a quick assessment, please check the full details of each filestore before committing to using them for your work.

.. raw:: html
    :file: ../images/Sheffield-HPC-Cluster-Storage-Selection-decision-tree.drawio.svg

..
  This flow diagram can be updated by:
  1. Opening and editing 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in diagrams.net
  2. Updating the version of 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in this repo by exporting XML of flowchart from diagrams.net
  3. Updating the SVG above in this file using the SVG export of the flow chart from diagrams.net

-----

.. _home_dir:

Home directories
----------------
All users have a home directory on each system:

.. tabs::

  .. group-tab:: Stanage

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user       | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+======================+===============================================+=========================+
    | ``/users/$USER``       | NFS  | 50 GB or 300000 files| Yes                                           | No                      |
    +------------------------+------+----------------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    See also: :ref:`quota_check` and * :ref:`exceed_quota`.

    :underline-bold:`Home filestore backups and snapshots details`

    .. warning:: 

      **Snapshotting is not enabled** for home areas and these areas are **not backed up**.

  .. group-tab:: Bessemer

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+================+===============================================+=========================+
    |``/home/$USER``         | NFS  | 100GB          | Yes                                           | No                      |
    +------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-snapshot-mirror-settings.rst


.. note::

  As you can see in the above tabs the full path to your home directory is different depending on the cluster you are on:

  +-------------------+------------------------+
  | Cluster           | Path                   |
  +===================+========================+
  | Stanage           |``/users/$USER``        |
  +-------------------+------------------------+
  | Bessemer          |``/home/$USER``         |
  +-------------------+------------------------+ 

  To ensure that your code is compatible with both clusters, we suggest using the symbols "~" or "$HOME" to represent the home directory. This approach ensures that the correct path is used regardless of the cluster you are working on, making your code more portable and agnostic to the specific cluster environment.

  .. tabs::

   .. group-tab:: Stanage

      .. code-block:: console
        :emphasize-lines: 1,3

        $ echo $HOME
        /users/te1st
        $ echo ~
        /users/te1st

   .. group-tab:: Bessemer

      .. code-block:: console
        :emphasize-lines: 1,3

        $ echo $HOME
        /home/te1st
        $ echo ~
        /home/te1st


------

.. _fastdata_dir:

*Fastdata* areas
----------------

**Fastdata** areas are **optimised for large file operations**.  
These areas are `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`__ filesystems. 

They are **faster** than :ref:`home_dir` and :ref:`shared_dir` when dealing with larger files but 
are **not performant when reading/writing lots of small files** 
(:ref:`scratch_dir` are ideal for reading/writing lots of small temporary files within jobs).
An example of how slow it can be for large numbers of small files is detailed `here <http://www.walkingrandomly.com/?p=6167>`__.

There are separate ``fastdata`` areas on each cluster:

.. tabs::

   .. group-tab:: Stanage

    :underline-bold:`Fastdata filestore area details`

    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path                                  | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +=======================================+========+================+=====================+=========================+===========================+
    | ``/mnt/parscratch/``                  | Lustre | No limits      | 2 PiB               | No                      | 100Gb/s (*Omni-Path*)     |
    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+


    :underline-bold:`Managing your files in fastdata areas`

    We recommend users create their own personal folder in the ``/fastdata`` area.  As this doesn't exist by default, you can create it with safe permissions by running the command: ::

        mkdir /mnt/parscratch/users/$USER
        chmod 700 /mnt/parscratch/users/$USER

    By running the command above, your area will only be accessible to you. If desired, you could have a more sophisticated sharing scheme with private and fully public directories: ::

        mkdir /mnt/parscratch/users/$USER
        mkdir /mnt/parscratch/users/$USER/public
        mkdir /mnt/parscratch/users/$USER/private

        chmod 755 /mnt/parscratch/users/$USER
        chmod 755 /mnt/parscratch/users/$USER/public
        chmod 700 /mnt/parscratch/users/$USER/private

    Note however that the ``public`` folder in this instance will be readable to **all users**!

    ..
      Comment: There is a need for 755 on a truely public directory here rather than 705 due to the nature of the inherited effective permissions.
      These effective permissions are determined based on the first class the user falls within in the order of user, group then others. Thus 705 would 
      have the group's "0" at a higher priority than the other's "5" resulting in blocked access.

      Selecting 705 would allow everyone but the chosen group access.
      Selecting 755 would allow everyone access including the chosen group.

    :underline-bold:`Fastdata filestore backups and snapshots details`

    .. warning:: 

      **Snapshotting is not enabled** for home areas and these areas are **not backed up**.


    :underline-bold:`File locking`

    As of September 2020 POSIX file locking is enabled on all Lustre filesystems. 
    Prior to this the lack of file locking support on the University's Lustre filesystems caused problems for certain workflows/applications
    (e.g. for programs that create/use SQLite databases).


    :underline-bold:`User Quota management`

    .. warning::

        **There are no automated quota controls in the Stanage fastdata areas** and the Stanage fastdata area currently has no automatic file deletion process.

        We reserve the right to prevent unfair use of this area by users and will manually assess user's usage and establish a dialogue
        with users who are using unfair amounts of this area on a regular basis.

        We also reserve the right to take measures to ensure the continuing functionality of this area which could include scheduled removal of user's files 
        (after informing the user of the scheduled removal).

   .. group-tab:: Bessemer

    :underline-bold:`Fastdata filestore area details`

    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path          | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +===============+========+================+=====================+=========================+===========================+
    | ``/fastdata`` | Lustre | No limits      | 460 TB              | No                      | 25Gb/s Ethernet           |
    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-fastdata-managing-import.rst


-----

.. _shared_dir:

*Shared* (project) directories
------------------------------

.. include:: /referenceinfo/imports/filestores/shared-areas/shared-area-general-info.rst

See also: :ref:`recovering_snapshots`.
  
Automounting
^^^^^^^^^^^^

Subdirectories beneath ``/shared`` are **mounted on demand** on the HPC systems: 
they may not be visible if you simply list the contents of the ``/shared`` directory but 
will be accessible if you ``cd`` (change directory) into a subdirectory e.g. ``cd /shared/my_group_file_share1``.

Specifics for each Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^

As our HPC cluster are each hosted in different datacentres the policy, configuration and accessibility of the shared areas varies. The infomation for each cluster is shown below:


.. tabs::


   .. group-tab:: Stanage

      :underline-bold:`Shared research area mount availability`

      On the Stanage cluster, shared research areas can be made available **on all login nodes only, upon request**.  This is because:
      
      * The HPC nodes are hosted within a datacentre in Manchester distant from the shared research area filestores hosted within the University's Sheffield datacentres.
      * Network traffic between Stanage and the Sheffield Research Filestore is not encrypted when travelling between Sheffield and Manchester over the dedicated leased line network link.
      * The leased line network link has 10Gb/s of bidirectional transfer available.


      :underline-bold:`Shared research area performance`

      * If you access a ``/shared`` directory stored in Sheffield from Stanage then you may experience slower performance, especially for small files.
      * The comparatively slower network link for Stanage than Bessemer could result in very poor performance if mounted on all worker nodes. This is why shared research areas are only made available on login nodes.
      * Stanage does not have a local shared research area filestore, thus no local shared research areas can be made.

      If you need to access a ``/shared`` area on Stanage please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__ to arrange this.

   .. group-tab:: Bessemer

      :underline-bold:`Shared research area mount availability`

      On the Bessemer cluster shared research areas can be made available **on all HPC nodes upon request**.  This is because:
      
      * The HPC nodes are hosted within a datacentre in Leeds distant from the shared research area filestores hosted within the University's Sheffield datacentres.
      * Network traffic between Bessemer and the Sheffield Research Filestore is not encrypted when travelling between Sheffield and Leeds over the JANET network.


      :underline-bold:`Shared research area performance`

      * If you access a ``/shared`` directory stored in Sheffield from Bessemer then you may experience slower performance, especially for small files.

      If file store performance is a concern, ``/shared`` areas can be created on Bessemer's local shared research area filestores system to improve performance for file access on the Bessemer HPC cluster. Please note that access 
      to a Bessemer local shared research area filestore area from a Sheffield based machine will have a similar performance decrease.

      If you need to access a ``/shared`` area on Bessemer please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__ to arrange this.


.. _shared_dir_perms:

.. include:: /referenceinfo/imports/filestores/shared-areas/permissions-behaviour.rst

Further information
^^^^^^^^^^^^^^^^^^^

The documentation for the ``/shared`` storage service includes information on:

* `how access/permissions are managed <https://www.sheffield.ac.uk/it-services/research-storage/access-rights>`__
* `how to create folders with associated permissions <https://www.sheffield.ac.uk/it-services/research-storage/create-folders>`__ 
  within ``/shared`` storage areas

-----

.. _scratch_dir:

*Scratch*  directories
------------------------------

For **jobs that need to read/write lots of small files** the most performant storage will be 
the temporary storage on each node.

This is because with :ref:`home_dir`, :ref:`fastdata_dir` and :ref:`shared_dir`,
each time a file is accessed the filesystem needs to request ownership/permissions information from another server
and for small files these overheads are proportionally high. 

For the local temporary store, such ownership/permissions metadata is available on the local machine, 
thus it is faster when dealing with small files.

As the local temporary storage areas are node-local storage and files/folders are deleted when jobs end:

* any data used by the job must be **copied to** the local temporary store when the jobs starts. 
* any output data stored in the local temporary store must also be **copied off** to another area before the job finishes.
  (e.g. to :ref:`home_dir`).

Further conditions also apply:

* Anything in the local temporary store area may be deleted periodically when the worker-node is **idle**. 
* The local temporary store area is **not backed up**. 
* There are no quotas for local temporary store storage.
* The local temporary store area uses the **ext4** filesystem.

.. danger::

  The local temporary store areas are temporary and have no backups. If you forget to copy your output data out of the 
  local temporary store area before your job finishes, your data **cannot** be recovered!

Specifics for each Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. group-tab:: Stanage

    The scheduler will automatically create a per-job directory for you under ``/tmp``.
    The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 
    
    .. code-block:: console

      [te1st@login1 [stanage] ~]$   srun -c 1 --mem=4G --pty bash -i
      [te1st@node001 [stanage] ~]$  cd $TMPDIR
      [te1st@node001 [stanage] ~]$  pwd
      /tmp/job.2660172

    The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
    ensuring that the space can be used by other users.

   .. group-tab:: Bessemer

    The scheduler will automatically create a per-job directory for you under ``/scratch``.
    The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 
    
    .. code-block:: console

      [te1st@bessemer-login1 ~]$  srun -c 1 --mem=4G --pty bash -i
      [te1st@bessemer-node001 ~]$ cd $TMPDIR
      [te1st@bessemer-node001 2660172]$ pwd
      /scratch/2660172

    The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
    ensuring that the space can be used by other users.


-----

.. _community_dir:

*Community* areas for software
------------------------------

Most data that researchers want to share with their collaborators at the University should reside in :ref:`shared_dir`.
However, as mentioned in :ref:`shared_dir_perms`, these areas may not be ideal for storing executable software/scripts
due to the way permissions are handled beneath ``/shared``.

Also, users may want to install software on the clusters that they want to be accessible by all cluster users.

To address these two needs users can request the creation of a new directory beneath of the three directories listed below
and if their request is granted they will be given write access to this area:

+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| System   | Path                     | Type | Software install guidelines | Public index of areas               | Notes                                   |
+==========+==========================+======+=============================+=====================================+=========================================+
| Stanage  | N/A                      | N/A  |                             |                                     |                                         |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| Bessemer | ``/usr/local/community`` | NFS  |                             |                                     |                                         |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+

Note that:

* Software installation should follow our installation guidelines where provided.
* Software installations must be maintained by a responsible owner.
* Software which is not actively maintained may be removed.

-----

.. _quota_check:

How to check your quota usage
-----------------------------

To find out your storage quota usage for your :ref:`home directory <home_dir>` 
you can use the ``quota`` command:

.. tabs::

   .. group-tab:: Stanage

      .. code-block:: console

          [te1st@login1 [stanage] ~]$ quota -u -s
              Filesystem   space   quota   limit   grace   files   quota   limit   grace
          storage:/export/users
                           3289M  51200M  76800M            321k*   300k    350k   none 
      
      An asterisk (*) after your space or files usage indicates that you've exceeded a 'soft quota'. You're then given a grace period of several days to reduce your usage below this limit.
      Failing to do so will prevent you from using additional space or creating new files. Additionally, there is a hard limit for space and files that can never be exceeded, even temporarily (i.e. it has no grace period).

      In the above example we can see that the user has exceeded their soft quota for files ('*') but not their hard limit for files.  However, the grace period field reads 'none', 
      which means the grace period for exceeding the soft quota has already expired.  The user must remove/move some files from their home directory before they can create/add any more files.
      Also, the user is a long way from exceeding their space soft quota.

      .. tip::
      
              To assess what is using up your quota within a given directory, you can make use of the :ref:`ncdu module on Stanage <ncdu_stanage>`. 
              The ncdu utility will give you an interactive display of what files/folders are taking up storage in a given directory tree.


   .. group-tab:: Bessemer

      .. code-block:: console

            [te1st@bessemer-node004 binary]$ quota

            Size  Used Avail Use%  Mounted on
            100G  100G    0G 100%  /home/te1st

      In the above, you can see that the quota was set to 100 gigabytes and all of this is in use which is likely to cause jobs to fail.

      To determine usage in a particular :ref:`shared_dir` you can use the ``df`` command like so: 

      .. code-block:: console

          [te1st@bessemer-node004 binary]$ df -h /shared/myproject1
          Filesystem                        Size  Used Avail Use% Mounted on
          172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

      .. tip::
      
              To assess what is using up your quota within a given directory, you can make use of the 
              :ref:`ncdu module on Bessemer <ncdu_bessemer>`. The **ncdu** utility will give you an 
              interactive display of what files/folders are taking up storage in a given directory tree.


-----

.. _exceed_quota:

If you exceed your filesystem quota
-----------------------------------

If you reach your quota for your :ref:`home directory <home_dir>` then
many common programs/commands may cease to work as expected or at all and
you may not be able to log in.

In addition, jobs may fail if you exceed your quota with a job making use of a :ref:`Shared (project) directory <shared_dir>`.

In order to avoid this situation it is strongly recommended that you:

* :ref:`Check your quota usage <quota_check>` regularly.
* Copy files that do not need to be backed up to a :ref:`Fastdata area <fastdata_dir>`
  or remove them from the clusters completely.

-----

.. _recovering_snapshots:

.. include:: /referenceinfo/imports/filestores/shared-areas/recovering-from-snapshots.rst
