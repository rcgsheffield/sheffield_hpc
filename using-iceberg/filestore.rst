.. _filestore:

Filestore on Iceberg
====================

Every user on the system has access to three different types of filestore. They differ in terms of the amount of space available, the speed of the underlying storage system, frequency of backup and the time that the data can be left there.

Here are the current details of filestore available to each user.

Home directory
--------------
All users have a home directory in the location ``/home/username``. The filestore quota is **10 GB** per user.

**Backup policy:** ``/home`` has backup snapshots taken every 4 hours and we keep the 10 most recent. ``/home`` also has daily snapshots taken each night, and we keep 28 days worth, mirrored onto a separate storage system.

The filesystem is NFS.

Data directory
--------------
Every user has access to a much larger data-storage area provided at the location ``/data/username``.

The quota for this area is **100 GB** per user.

**Backup policy:** ``/data`` has snapshots taken every 4 hours and we keep the 10 most recent. ``/data`` also has daily snapshots taken each night, and we keep 7 days worth, but this is not mirrored.

The filesystem is NFS.

Fastdata directory
------------------
All users also have access to a large fast-access data storage area under ``/fastdata``.

In order to avoid interference from other users' files it is **vitally important** that you store your files in a directory created and named the same as your username. e.g. ::

    mkdir /fastdata/yourusername

By default the directory you create will have world-read access - if you want to restrict read access to just your account then run ::

    chmod 700 /fastdata/yourusername

after creating the directory. A more sophisticated sharing scheme would have private and public directories ::

    mkdir /fastdata/yourusername
    mkdir /fastdata/yourusername/public
    mkdir /fastdata/yourusername/private

    chmod 755 /fastdata/yourusername
    chmod 755 /fastdata/yourusername/public
    chmod 700 /fastdata/yourusername/private

The fastdata area provides **260 Terabytes** of storage in total and takes advantage of the internal infiniband network for fast access to data.

Although ``/fastdata`` is available on all the worker nodes, only by accessing from the Intel-based nodes ensures that you can benefit from these speed improvements.

**There are no quota controls on the** ``/fastdata`` **area** but **files older than 3 months will be automatically deleted without warning.** We reserve the right to change this policy without warning in order to ensure efficient running of the service.

You can use the ``lfs``  command to find out which files under /fastdata are older than a certain number of days and hence approaching the time of deletion. For example, to find files 50 or more days old ::

    lfs find -ctime +50 /fastdata/yourusername

``/fastdata`` uses the `Lustre <https://en.wikipedia.org/wiki/Lustre_(file_system)>`_ filesystem. This does not support POSIX locking which can cause issues for some applications.

The shared directory
--------------------
If you have purchased extra filestore from CiCS, it will be mounted on Iceberg in a subdirectory of ``/shared``. This is an NFS filesystem and uses Windows-style ACLS.

Determining your current filestore allocation
---------------------------------------------
To find out your current filestore quota allocation and usage type ``quota``.

If you exceed your file storage allocation
------------------------------------------
As soon as the quota is exceeded your account becomes frozen. In order to avoid this situation it is strongly recommended that you

* Use the ``quota`` command to check your usage regularly.
* Copy files that do not need to be backed to the  ``/data/username`` area, or remove them from iceberg completely.

Efficiency considerations - The /scratch areas
----------------------------------------------

For jobs requiring a lot of Input and Output (I/O), it may sometimes be necessary to store copies of the data on the actual compute node on which your job is running. For this, you can create temporary areas of storage under the directory ``/scratch``. **The** ``/scratch`` **area is local to each worker node** and is not visible to the other worker nodes or to the head-nodes. Therefore any data created by jobs should be transfered to either your ``/data`` or ``/home`` area before the job finishes if you wish to keep them.

The next best I/O performance that requires the minimum amount of work is achieved by keeping your data in the ``/fastdata`` area and running your jobs on the new intel nodes by specifying ``-l arch=intel`` in your job submission script.

These methods provide much faster access to data than the network attached storage on either ``/home`` or ``/data`` areas, but you must remember to copy important data back onto your ``/home`` area.

If you decide to use the ``/scratch`` area we recommend that under ``/scratch`` you create a directory with the same name as your username and work under that directory to avoid the possibility of clashing with other users.

Anything under the ``/scratch`` is deleted periodically when the worker-node is idle, whereas files on the ``/fastdata`` area will be deleted only when they are 3 months old.

``\scratch`` uses the ext4 filesystem.

Recovering snapshots
--------------------
We take regular back-ups of your ``/home`` and ``/data`` directories and it is possible to directly access a limited subset of them.

There are 7 days worth of snapshots available in your ``/home`` and ``/data`` directories in a hidden directory called ``.snapshot``. You need to explicitly ``cd`` into this directory to get at the files::

    cd /home/YOURUSERNAME/.snapshot

The files are read-only. This allows you to attempt recover any files you might have accidentally deleted recently.

This does not apply for ``/fastdata`` for which we take no back-ups.
