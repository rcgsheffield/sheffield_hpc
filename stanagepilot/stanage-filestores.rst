.. _stanage-filestores:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Filestores
==========

On the Stanage cluster, every HPC user has access to *up to* 3 different storage areas:

* :ref:`stanage_home_dir`: per-user storage with no backups.
* :ref:`stanage_fastdata_dir`: per-user `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`__  storage with no backups.
* :ref:`stanage_scratch_dir` : per node, node-local storage with no backups.

-----

.. _stanage_home_dir:

Home directories
----------------
All users have a home directory on Stanage. This area is seperate from the other clusters 

+----------+------------------------+------+----------------------+-----------------------------------------------+-------------------------+
| System   | Path                   | Type | Quota per user       | Shared between system login and worker nodes? | Shared between systems? |
+==========+========================+======+======================+===============================================+=========================+
| Stanage  | ``/users/$USER``       | NFS  | 50 GB or 300000 files| Yes                                           | No                      |
+----------+------------------------+------+----------------------+-----------------------------------------------+-------------------------+

Where ``$USER`` is the user's username.

See also: :ref:`stanage_quota_check` and * :ref:`stanage_exceed_quota`.

Snapshotting and mirrored backups
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Snapshotting is not enabled** for home areas and
these areas are **not backed up**.

-----

.. _stanage_fastdata_dir:

*Fastdata* areas
----------------

**Fastdata** areas are **optimised for large file operations**.  
These areas are `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`__ filesystems. 

They are are **faster** than :ref:`stanage_home_dir` and :ref:`stanage_shared_dir` when dealing with larger files but 
are **not performant when reading/writing lots of small files** 
(:ref:`stanage_scratch_dir` are ideal for reading/writing lots of small temporary files within jobs).
An example of how slow it can be for large numbers of small files is detailed `here <http://www.walkingrandomly.com/?p=6167>`__.

+----------+---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+
| System   | Path                                  | Type   | Quota per user | Filesystem capacity | Shared between systems? | Network bandwith per link |
+==========+=======================================+========+================+=====================+=========================+===========================+
| Stanage  | ``/mnt/parscratch/users/$USER``       | Lustre | No limits      | 2 PiB               | No                      | 100Gb/s (*Omni-Path*)     |
+----------+---------------------------------------+--------+----------------+---------------------+-------------------------+---------------------------+

Where ``$USER`` is the user's username.

.. tip::

    This folder doesn't exist by default, you can create it with safe permissions by running the command: 
    ``mkdir -m 0700 /mnt/parscratch/users/$USER``

Snapshotting and mirrored backups
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Snapshotting is not enabled** for fastdata areas and
these areas are **not backed up**.

-----

.. _stanage_shared_dir:

*Shared* (project) directories
------------------------------

Shared project storage areas are not yet available on the Stanage cluster.

-----

.. _stanage_scratch_dir:

*Scratch* directories
---------------------

For **jobs that need to read/write lots of small files** the most performant storage will be 
the temporary storage on each node (under the ``/tmp`` directory).

This is because with :ref:`stanage_home_dir`, :ref:`stanage_fastdata_dir` and :ref:`stanage_shared_dir`,
each time a file is accessed the filesystem needs to request ownership/permissions information from another server
and for small files these overheads are proportionally high. 

For the scratch storage area, such ownership/permissions metadata is available on the local machine, 
thus it is faster when dealing with small files.

Each user is encouraged to use ``/tmp/users/$USER`` (where ``$USER`` is the user's username) for node-local storage. 

.. tip::

    This folder doesn't exist by default, you can create it with safe permissions by running the command: 
    ``mkdir -m 700 -p /tmp/users/$USER``

    **You should run this command in each batch submission script prior to using this directory!**

Further conditions also apply:

* Anything in the ``/tmp/users/$USER`` area may be deleted periodically when the worker-node is **idle** or rebooted. 
* The ``/tmp/users/$USER`` area is **not backed up**. 
* There are no quotas for ``/tmp/users/$USER`` storage.
* The ``/tmp/users/$USER`` area uses the **ext4** filesystem.

.. danger::

  ``/tmp/users/$USER`` area is temporary and has no backups. If you forget to copy your output data out of the 
  ``/tmp/users/$USER`` area before your job finishes, your data **cannot** be recovered!

-----

.. _stanage_quota_check:

How to check your quota usage
-----------------------------

To find out your storage quota usage for your :ref:`home directory <stanage_home_dir>`
you can use the ``quota`` command with the ``-u`` (your user) and ``-s`` (human readable) :

.. code-block:: console

    [user@login1 [stanage] ~] quota -u -s
        Filesystem   space   quota   limit   grace   files   quota   limit   grace
    storage:/export/users
                     3289M  51200M  76800M            154k    300k    350k 


To determine usage in a particular :ref:`stanage_shared_dir` you can use the ``df`` command like so: 

.. code-block:: console

    [user@login1 [stanage] ~]  df -h /shared/myproject1
    Filesystem                        Size  Used Avail Use% Mounted on
    172.X.X.X:/myproject1/myproject1   10T  9.1T  985G  91% /shared/myproject1

To assess what is using up your quota within a given directory, you can make use of the 
:ref:`ncdu module on Stanage <ncdu_stanage>` or the 

The **ncdu** utility will give you an 
interactive display of what files/folders are taking up storage in a given directory tree.

-----

.. _stanage_exceed_quota:

If you exceed your filesystem quota
-----------------------------------

If you reach your quota for your :ref:`home directory <stanage_home_dir>` then
many common programs/commands may cease to work as expected or at all and
you may not be able to log in.

In addition, jobs may fail if you exceed your quota
for your :ref:`Shared (project) directory <stanage_shared_dir>`.

In order to avoid this situation it is strongly recommended that you:

* :ref:`Check your quota usage <stanage_quota_check>` regularly.
* Copy files that do not need to be backed up to a :ref:`Fastdata area <stanage_fastdata_dir>`
  or remove them from Stanage completely.