:underline-bold:`Managing your files in fastdata areas`

We recommend users create their own personal folder in the ``/fastdata`` area.  As this doesn't exist by default, you can create it with safe permissions by running the command: ::

    mkdir /fastdata/$USER
    chmod 700 /fastdata/$USER

By running the command above, your area will only be accessible to you. If desired, you could have a more sophisticated sharing scheme with private and fully public directories: ::

    mkdir /fastdata/$USER
    mkdir /fastdata/$USER/public
    mkdir /fastdata/$USER/private

    chmod 755 /fastdata/$USER
    chmod 755 /fastdata/$USER/public
    chmod 700 /fastdata/$USER/private

Note however that the ``public`` folder in this instance will be readable to **all users**!

..
    Comment: There is a need for 755 on a truely public directory here rather than 705 due to the nature of the inherited effective permissions.
    These effective permissions are determined based on the first class the user falls within in the order of user, group then others. Thus 705 would 
    have the group's "0" at a higher priority than the other's "5" resulting in blocked access.

    Selecting 705 would allow everyone but the chosen group access.
    Selecting 755 would allow everyone access including the chosen group.

:underline-bold:`Fastdata filestore backups and snapshots details`

.. warning:: 

    **Snapshotting is not enabled** for fastdata areas and these areas are **not backed up**.


:underline-bold:`Automatic file deletion`

.. warning::

    **There are no quota controls in fastdata areas** but 
    **older files** are **automatically deleted**: 
    a report of files older than 60 days is regularly generated, 
    the owners of these files are then notified by email then 
    a week after the email(s) are sent the identified files are deleted. 

    We reserve the right to change this policy without warning in order to ensure efficient running of the service.

    It is important to therefore not use *fastdata* areas for long-term storage and 
    **copy important data** from these areas to areas suitable for longer-term storage (:ref:`home_dir` or :ref:`shared_dir`).

You can use the ``lfs``  command to find out which files in a *fastdata* directory are older than a certain number of days and hence approaching the time of deletion. 
For example, if your username is ``te1st`` then you can find files 50 or more days old using: ::

    lfs find -ctime +50 /fastdata/te1st



:underline-bold:`File locking`

As of September 2020 POSIX file locking is enabled on all Lustre filesystems. 
Prior to this the lack of file locking support on the University's Lustre filesystems caused problems for certain workflows/applications
(e.g. for programs that create/use SQLite databases).
