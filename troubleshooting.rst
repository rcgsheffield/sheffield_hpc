.. _troubleshooting:

Troubleshooting
===============
In this section, we'll discuss some tips for solving problems with iceberg. It is suggested that you work through some of the ideas here before contacting the service desk for assistance.

I'm a new user and my password is not recognised
------------------------------------------------
When you get a username on the system, the first thing you need to do is to `syncronise your passwords
<https://www.shef.ac.uk/cics/password>`_ which will set your password to be the same as your network password.

Exceeding your disk space quota
-------------------------------
Each user of the system has a fixed amount of disk space available in their home directory. If you exceed this quota, various problems can emerge such as an inability to launch applications and run jobs.
To see if you have exceeded your disk space quota, run the quota command:

.. code-block:: none

       quota

       Size  Used Avail Use% Mounted on
       5.1G  5.1G     0 100% /home/foo11b
        50G     0   50G   0% /data/foo11b

In the above, you can see that the quota was set to 5.1 gigabytes and all of this is in use. Any jobs submitted by this user will likely result in an Eqw status. The recommended action is for the user to delete enough files to allow normal work to continue.

Sometimes, it is not possible to log-in to the system because of a full quota, in which case you need to contact iceberg-admins@lists.shef.ac.uk and ask to the unfrozen.

Windows-style line endings
--------------------------
If you prepare text files such as your job submission script on a Windows machine, you may find that they do not work as intended on the system. A very common example is when a job immediately goes into ``Eqw`` status after you have submitted it.

The reason for this behaviour is that Windows and Unix machines have different conventions for specifying 'end of line' in text files. Windows uses the control characters for 'carriage return' followed by 'linefeed', ``\r\n``, whereas Unix uses just 'linefeed' ``\n``.

The practical upshot of this is that a script prepared in Windows using Notepad looking like this ::

        #!/bin/bash
        echo 'hello world'

will look like the following to programs on a Unix system ::

        #!/bin/bash\r
        echo 'hello world'\r

If you suspect that this is affecting your jobs, run the following command on the system :: 

        dos2unix your_files_filename

error: no DISPLAY variable found with interactive job
-----------------------------------------------------
If you receive the error message ::

        error: no DISPLAY variable found with interactive job

the most likely cause is that you forgot the -X switch when you logged into iceberg. That is, you might have typed ::

        ssh username@iceberg.sheffield.ac.uk

instead of ::

        ssh -X username@iceberg.sheffield.ac.uk

Insufficent memory in an interactive session
--------------------------------------------
By default, an interactive session provides you with 2 Gigabytes of RAM (sometimes called real memory) and 6 Gigabytes of Virtual Memory. You can request more than this when running your ``qsh`` or ``qrsh`` command ::

        qsh -l mem=64G   -l rmem=8G

This asks for 64 Gigabytes of Virtual Memory and 8 Gigabytes of RAM (real memory). Note that you should

* not specify more than 768 Gigabytes of virtual memory (mem) .
* not specify more than 256 GB of RAM (real memory) (rmem)

