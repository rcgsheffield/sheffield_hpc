.. _filestore:

Filestores
==========

Every HPC user has access to *up to* six different storage areas:

* :ref:`home_dir`: per-user :term:`backed-up <Mirrored backups>`, :term:`snapshotted <Snapshotted storage>` storage
* :ref:`data_dir`: additional per-user snapshotted storage (*not on Bessemer*)
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


  <div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#FFFFFF&quot;,&quot;lightbox&quot;:false,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2022-07-15T14:19:22.942Z\&quot; agent=\&quot;5.0 (Windows)\&quot; etag=\&quot;79xMEJmJYfl1YX79xcU0\&quot; version=\&quot;20.1.1\&quot; type=\&quot;device\&quot;&gt;&lt;diagram name=\&quot;Page-1\&quot; id=\&quot;9c096ad6-e400-ecc8-3e38-643d2caac077\&quot;&gt;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&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
  <script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>
  <!--
  This flow diagram can be updated by:
  1. Opening and editing 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in diagrams.net
  2. Updating the version of 'hpc/Sheffield HPC Cluster Storage Selection decision tree.drawio.xml' in this repo by exporting XML of flowchart from diagrams.net
  3. Updating the 'div' above in this file using the HTML export of the flow chart from diagrams.net

  NB this diagrams.net diagram currently uses a remotely hosted version of the diagrams.net JS library (see above) but there's also a copy of that library at _static/js/viewer-static.min.js in case service is ever withdrawn.
  -->

-----

.. _home_dir:

Home directories
----------------
All users have a home directory on each system:

.. tabs::

   .. group-tab:: ShARC

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+================+===============================================+=========================+
    |``/home/$USER``         | NFS  | 10GB           | Yes                                           | No                      |
    +------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.


    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-snapshot-mirror-settings.rst

   .. group-tab:: Bessemer

    :underline-bold:`Home filestore area details`

    +------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +========================+======+================+===============================================+=========================+
    |``/home/$USER``         | NFS  | 100GB          | Yes                                           | No                      |
    +------------------------+------+----------------+-----------------------------------------------+-------------------------+

    Where ``$USER`` is the user's username.

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-snapshot-mirror-settings.rst

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


------

.. _data_dir:

*Data* directories
------------------

ShARC, (:underline-bold:`only`), has access to aan additional larger *data* storage area:

.. tabs::

   .. group-tab:: ShARC

    +----------+------------------------+------+----------------+-----------------------------------------------+-------------------------+
    | System   | Path                   | Type | Quota per user | Shared between system login and worker nodes? | Shared between systems? |
    +==========+========================+======+================+===============================================+=========================+
    | ShARC    | ``/data/yourusername`` | NFS  | 100GB          | Yes                                           | No                      |
    +----------+------------------------+------+----------------+-----------------------------------------------+-------------------------+

    See also: :ref:`quota_check` and * :ref:`exceed_quota`.

    :underline-bold:`Data filestore backups and snapshots details`

    +---------------------------+--------------------+
    | Frequency of snapshotting | Snapshots retained |
    +===========================+====================+
    | Every 4 hours             | 10 most recent     |
    +---------------------------+--------------------+
    | Every night               | Last 7 days        |
    +---------------------------+--------------------+

    +-------------------------------+------------------+
    | Frequency of mirrored backups | Backups retained |
    +===============================+==================+
    | Every 4 hours                 | 6 most recent    |
    +-------------------------------+------------------+
    | Every night                   | 28 most recent   |
    +-------------------------------+------------------+

    See also: :ref:`recovering_snapshots`.

    :underline-bold:`Automounting`


    *Data* directories are **made available to you (mounted) on demand**: 
    if you list the contents of just ``/data`` after first logging on then your ``/data/te1st`` subdirectory (where ``te1st`` is your username) might not be shown.
    However, if you list the contents of ``/data/te1st`` itself or change into that directory
    then its contents will appear.  

    Later on if you list the contents of ``/data`` again 
    you may find that ``/data/te1st`` has disappeared again, as 
    it is automatically *unmounted* following a period of inactivity. 

   .. group-tab:: Bessemer

    .. warning::
      
      The ``/data`` area is not available on Bessemer.

   .. group-tab:: Stanage

    .. warning::
      
      The ``/data`` area is not available on Stanage.

 

-----

.. _fastdata_dir:

*Fastdata* areas
----------------

**Fastdata** areas are **optimised for large file operations**.  
These areas are `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`__ filesystems. 

They are are **faster** than :ref:`home_dir`, :ref:`data_dir` and :ref:`shared_dir` when dealing with larger files but 
are **not performant when reading/writing lots of small files** 
(:ref:`scratch_dir` are ideal for reading/writing lots of small temporary files within jobs).
An example of how slow it can be for large numbers of small files is detailed `here <http://www.walkingrandomly.com/?p=6167>`__.

There are separate ``fastdata`` areas on each cluster:

.. tabs::

   .. group-tab:: ShARC

    :underline-bold:`Fastdata filestore area details`

    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path          | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +===============+========+================+=====================+=========================+===========================+
    | ``/fastdata`` | Lustre | No limits      | 669 TB              | No                      | 100Gb/s (*Omni-Path*)     |
    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-fastdata-managing-import.rst


   .. group-tab:: Bessemer

    :underline-bold:`Fastdata filestore area details`

    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path          | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +===============+========+================+=====================+=========================+===========================+
    | ``/fastdata`` | Lustre | No limits      | 460 TB              | No                      | 25Gb/s Ethernet           |
    +---------------+--------+----------------+---------------------+-------------------------+---------------------------+

    .. include:: /referenceinfo/imports/filestores/shared-areas/sharc-bessemer-fastdata-managing-import.rst
      

   .. group-tab:: Stanage

    :underline-bold:`Fastdata filestore area details`

    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+
    | Path                                  | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
    +=======================================+========+================+=====================+=========================+===========================+
    | ``/mnt/parscratch/``                  | Lustre | No limits      | 2 PiB               | No                      | 100Gb/s (*Omni-Path*)     |
    +---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+


    :underline-bold:`Managing your files in fastdata areas`

    We recommend users create their own personal folder in the ``/fastdata`` area.  As this doesn't exist by default, you can create it with safe permissions by running the command: ::

        mkdir -m 0700 /mnt/parscratch/users/$USER

    By running the command above, your area will only be accessible to you. If desired, you could have a more sophisticated sharing scheme with private and public directories ::

        mkdir -m 0755 /mnt/parscratch/users/$USER
        mkdir /parscratch/users/$USER/public
        mkdir /parscratch/users/$USER/private

        chmod 755 /parscratch/users/$USER
        chmod 755 /parscratch/users/$USER/public
        chmod 700 /parscratch/users/$USER/private

    :underline-bold:`Fastdata filestore backups and snapshots details`

    .. warning:: 

      **Snapshotting is not enabled** for home areas and these areas are **not backed up**.



-----

.. _shared_dir:

*Shared* (project) directories
------------------------------

.. include:: /referenceinfo/imports/filestores/shared-areas/shared-area-general-info.rst

See also: :ref:`recovering_snapshots`.
  
Automounting
^^^^^^^^^^^^

Similar to :ref:`data_dir`, subdirectories beneath ``/shared`` are **mounted on demand** on the HPC systems: 
they may not be visible if you simply list the contents of the ``/shared`` directory but 
will be accessible if you ``cd`` (change directory) into a subdirectory e.g. ``cd /shared/my_group_file_share1``.

Specifics for Bessemer
^^^^^^^^^^^^^^^^^^^^^^

If you need to access a ``/shared`` area on Bessemer please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__ to arrange this.


.. warning::

        * If you access a ``/shared`` directory stored in Sheffield from Bessemer then you may experience slower performance, especially for small files.
        * Network traffic between Bessemer and Sheffield Research Filestore is not encrypted when travelling between Sheffield and Leeds over the JANET network.
        * ``/shared`` areas can be created on Bessemer's filestore system if you need faster access from Bessemer.

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

*Scratch* directories
---------------------

For **jobs that need to read/write lots of small files** the most performant storage will be 
the temporary storage on each node (under the ``/scratch`` directory).

This is because with :ref:`home_dir`, :ref:`data_dir`, :ref:`fastdata_dir` and :ref:`shared_dir`,
each time a file is accessed the filesystem needs to request ownership/permissions information from another server
and for small files these overheads are proportionally high. 

For the ``/scratch`` store, such ownership/permissions metadata is available on the local machine, 
thus it is faster when dealing with small files.

As the ``/scratch`` areas are node-local storage and files/folders are deleted when jobs end:

* any data used by the job must be **copied to** ``/scratch`` when the jobs starts. 
* any output data stored in ``/scratch`` must also be **copied off** to another area before the job finishes.
  (e.g. to :ref:`home_dir` or :ref:`data_dir`).

Further conditions also apply:

* Anything in the ``/scratch`` area may be deleted periodically when the worker-node is **idle**. 
* The ``/scratch`` area is **not backed up**. 
* There are no quotas for ``/scratch`` storage.
* The ``/scratch`` area uses the **ext4** filesystem.

.. danger::

  ``/scratch`` areas are temporary and have no backups. If you forget to copy your output data out of the 
  ``/scratch`` area before your job finishes, your data **cannot** be recovered!

**Where to store data inside** ``/scratch`` **areas**: 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The schedulers automatically create a per-job directory for you under ``/scratch``.
The name of this directory is stored in the ``$TMPDIR`` environment variable e.g. 

On ShARC: ::

    [te1st@sharc-login1 ~]$ qrshx
    [te1st@sharc-node003 ~]$ cd $TMPDIR
    [te1st@sharc-node003 667443.1.all.q]$ pwd
    /scratch/667443.1.all.q

On Bessemer: ::

    [te1st@bessemer-login1 ~]$  srun -c 1 --mem=4G --pty bash -i
    [te1st@bessemer-node001 ~]$ cd $TMPDIR
    [te1st@bessemer-node001 2660172]$ pwd
    /scratch/2660172


The scheduler will then clean up (delete) ``$TMPDIR`` at the end of your job, 
ensuring that the space can be used by other users.

.. warning::

   If using ``qrsh`` on ShARC to start an interactive job then 
   the ``TMPDIR`` environment variable will unfortunately be undefined
   so you will need to manually create a directory under ``/scratch`` (named using your username)
   and this will not be cleaned up when the job ends.

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
| Bessemer | ``/usr/local/community`` | NFS  |                             |                                     |                                         |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+
| ShARC    | ``/usr/local/community`` | NFS  | :ref:`sharc-community`      | :ref:`sharc-software-install-guide` | Also available at ``/usr/local/extras`` |
+----------+--------------------------+------+-----------------------------+-------------------------------------+-----------------------------------------+

Note that:

* Software installation should follow our installation guidelines where provided.
* Software installations must be maintained by a responsible owner.
* Software which is not actively maintained may be removed.

-----

.. _quota_check:

How to check your quota usage
-----------------------------

To find out your storage quota usage for your :ref:`home directory <home_dir>` and :ref:`data directory <data_dir>` (if not on Bessemer) 
you can use the ``quota`` command:

.. code-block:: console

       [foo11b@sharc-node004 binary]$ quota

       Size  Used Avail Use%  Mounted on
       10G    10G    0G 100%  /home/foo11b
       100G     0  100G   0%  /data/foo11b

In the above, you can see that the quota was set to 10 gigabytes and all of this is in use which is likely to cause jobs to fail.

To determine usage in a particular :ref:`shared_dir` you can use the ``df`` command like so: 

.. code-block:: console

    [foo11b@sharc-node004 binary]$ df -h /shared/myproject1
    Filesystem                        Size  Used Avail Use% Mounted on
    172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

To assess what is using up your quota within a given directory, you can make use of the 
:ref:`ncdu module on ShARC <ncdu_sharc>` or the 
:ref:`ncdu module on Bessemer <ncdu_bessemer>`. The **ncdu** utility will give you an 
interactive display of what files/folders are taking up storage in a given directory tree.

-----

.. _exceed_quota:

If you exceed your filesystem quota
-----------------------------------

If you reach your quota for your :ref:`home directory <home_dir>` then
many common programs/commands may cease to work as expected or at all and
you may not be able to log in.

In addition, jobs may fail if you exceed your quota
for your :ref:`data directory <data_dir>` or a :ref:`Shared (project) directory <shared_dir>`.

In order to avoid this situation it is strongly recommended that you:

* :ref:`Check your quota usage <quota_check>` regularly.
* Copy files that do not need to be backed up to a :ref:`Fastdata area <fastdata_dir>`
  or remove them from Bessemer/ShARC completely.

-----

.. _recovering_snapshots:

.. include:: /referenceinfo/imports/filestores/shared-areas/recovering-from-snapshots.rst
