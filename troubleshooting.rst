.. _troubleshooting:

Troubleshooting
===============
In this section, we'll discuss some tips for solving problems with iceberg. It is suggested that you work through some of the ideas here before contacting the service desk for assistance.

Frequently Asked Questions
``````````````````````````

I'm a new user and my password is not recognised
------------------------------------------------
When you get a username on the system, the first thing you need to do is to `syncronise your passwords
<https://www.shef.ac.uk/cics/password>`_ which will set your password to be the same as your network password.

Strange things are happening with my terminal
---------------------------------------------
Symptoms include many of the commands not working and just `bash-4.1$` being displayed instead of your username at the bash prompt.

This may be because you've deleted your `.bashrc` and `.bash_profile` files - these are 'hidden' files which live in your home directory and are used to correctly set up your environment.  If you hit this problem you can run the command `resetenv` which will restore the default files.

I can no longer log onto iceberg
--------------------------------
If you are confident that you have no password or remote-access-client related issues but you still can not log onto iceberg you may be having problems due to exceeding your iceberg filestore quota.
If you exceed your filestore quota in your /home area it is sometimes possible that crucial system files in your home directory gets truncated that effect the subsequent login process.

If this happens, you should immediately email research-it@sheffield.ac.uk and ask to be unfrozen.

I can not log into iceberg via the applications portal
------------------------------------------------------
Most of the time such problems arise due to due to JAVA version issues. As JAVA updates are released regularly, these problems are usually caused by the changes to the JAVA plug-in for the browser.
Follow the trouble-shooting link from the `iceberg browser-access page <http://www.sheffield.ac.uk/cics/research/hpc/using/access/browser>`_ to resolve these problems. There is also a link on that page to test the functionality of your java plug-in. It can also help to try a different browser to see if it makes any difference.
All failing, you may have to fall back to one of the `non-browser access methods <http://www.sheffield.ac.uk/cics/research/hpc/using/access>`_.

My batch job terminates without any messages or warnings
--------------------------------------------------------

When a batch job that is initiated by using the qsub command or runfluent, runansys or runabaqus commands, it gets allocated specific amount of virtual memory and real-time.
If a job exceeds either of these memory or time limits it gets terminated immediately and usually without any warning messages.

It is therefore important to estimate the amount of memory and time that is needed to run your job to completion and specify it at the time of submitting the job to the batch queue.

Please refer to the section on `hitting-limits and estimating-resources <http://www.sheffield.ac.uk/cics/research/hpc/using/requirements>`_ for information on how to avoid these problems.

Exceeding your disk space quota
-------------------------------
Each user of the system has a fixed amount of disk space available in their home directory. If you exceed this quota, various problems can emerge such as an inability to launch applications and run jobs.
To see if you have exceeded your disk space quota, run the quota command:

.. code-block:: none

       quota

       Size  Used Avail Use% Mounted on
       10.1G  5.1G     0 100% /home/foo11b
       100G     0   100G   0% /data/foo11b

In the above, you can see that the quota was set to 10.1 gigabytes and all of this is in use. Any jobs submitted by this user will likely result in an Eqw status. The recommended action is for the user to delete enough files to allow normal work to continue.

Sometimes, it is not possible to log-in to the system because of a full quota, in which case you need to contact research-it@sheffield.ac.uk and ask to the unfrozen.

I am getting warning messages and warning emails from my batch jobs about insufficient memory
---------------------------------------------------------------------------------------------

There are two types of memory resources that can be requested when submitting batch jobs using the qsub command. These are, virtual memory ( -l mem=nnn ) and real memory ( -l rmem=nnn ).
Virtual memory limit specified should always be greater than equal to the real memory limit specification.

If a job exceeds its virtual memory resource it gets terminated. However if a job exceeds its real memory resource it does not get terminated but an email message is sent to the user asking him to specify a larger rmem= parameter the next time, so that the job can run more efficiently.


What is rmem ( real_memory) and mem ( virtual_memory)
-----------------------------------------------------

Running a program always involves loading the program instructions and also its data i.e. all variables and arrays that it uses into the computers "RAM" memory. A program's entire instructions and its entire data, along with any dynamic link libraries it may use, defines the VIRTUAL STORAGE requirements of that program.
If we did not have clever operating systems we would need as much physical memory (RAM) as the virtual-storage requirements of that program.
However, operating systems are clever enough to deal with situations where we have insufficient REAL MEMORY to load all the program instructions and data into the available Real Memory ( i.e. RAM ) . This technique works because hardly any program needs to access all its instructions and its data simultaneously. Therefore the operating system loads into RAM only those bits of the instructions and data that are needed by the program at a given instance. This is called PAGING and it involves copying bits of the programs instructions and data to/from hard-disk to RAM as they are needed.

If the REAL MEMORY (i.e. RAM) allocated to a job is much smaller than the entire memory requirements of a job ( i.e. VIRTUAL MEMORY) then there will be excessive need for 'paging' that will slow the execution of the program considerably due to the relatively slow speeds of transferring information to/from the disk into RAM.

On the other hand if the Real Memory (RAM) allocated to a job is larger than the Virtual Memory requirement of that job then it will result in waste of RAM resources which will be idle duration of that job.

It is therefore crucial to strike a fine balance between the VIRTUAL MEMORY (i.e. mem) and the PHYSICAL MEMORY ( i.e. rmem) allocated to a job. Virtual memory limit defined by the -l mem parameter defines the maximum amount of virtual-memory your job will be allowed to use. If your job's virtual memory requirements exceed this limit during its execution your job will be killed immediately. Real memory limit defined by the -l rmem parameter defines the amount of RAM that will be allocated to your job.

The way we have configured SGE, if your job starts paging excessively your job is not killed but you receive warning messages to increase the RAM allocated to your job next time by means of the rmem parameter.

It is important to make sure that your -l mem value is always greater than your -l rmem value so as not to waste the valuable RAM resources as mentioned earlier.

Insufficient memory in an interactive session
---------------------------------------------
By default, an interactive session provides you with 2 Gigabytes of RAM (sometimes called real memory) and 6 Gigabytes of Virtual Memory. You can request more than this when running your ``qsh`` or ``qrsh`` command ::

        qsh -l mem=64G   -l rmem=8G

This asks for 64 Gigabytes of Virtual Memory and 8 Gigabytes of RAM (real memory). Note that you should

* not specify more than 768 Gigabytes of virtual memory (mem)
* not specify more than 256 GB of RAM (real memory) (rmem)

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


Problems connecting with WinSCP
-------------------------------
Some users have reported issues while connetcing to the system using WinSCP, usually when working from home with a poor connection and when accessing folders with large numbers of files.

In these instances, turning off ``Optimize Connection Buffer Size`` in WinSCP can help:

* In WinSCP, goto the settings for the site (ie. from the menu ``Session->Sites->SiteManager``)
* From the ``Site Manager`` dialog click on the selected session and click edit button
* Click the advanced button
* The Advanced Site Settings dialog opens.
* Click on connection
* Untick the box which says ``Optimize Connection Buffer Size``


Login Nodes RSA Fingerprint
---------------------------

The RSA key fingerprint for Iceberg's login nodes is "de:72:72:e5:5b:fa:0f:96:03:d8:72:9f:02:d6:1d:fd".
