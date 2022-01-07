.. _FAQs:

Frequently Asked Questions
==========================
In this section, we'll discuss some tips for solving problems with Bessemer and ShARC.
It is suggested that you work through some of the ideas here before contacting the IT Services Helpdesk for assistance.


Strange things are happening with my terminal
---------------------------------------------
Symptoms include many of the commands not working and just ``bash-4.1$`` being displayed instead of your username at the bash prompt.

This may be because you've deleted your ``.bashrc`` and ``.bash_profile`` files - these are 'hidden' files which live in your home directory and are used to correctly set up your environment.  If you hit this problem you can run the command ``resetenv`` which will restore the default files.

I can no longer log in
----------------------
If you are confident that you have no password or remote-access-client related issues but you still can not log onto a cluster you may be having problems due to exceeding your cluster filestore quota.
If you exceed your filestore quota in your ``/home`` area it is sometimes possible that crucial system files in your home directory gets truncated that effect the subsequent login process.

You may have inadvertently corrupted your shell environment if you have been installing software or making changes in your .bashrc file - please attempt to resolve this first by resetting your environment with the following command, replacing the variables appropriately: ``ssh -t $USER@$CLUSTER.shef.ac.uk 'resetenv -f'``

If this does not resolve your issue and you suspect your ``/home`` area is full , you should immediately email ``research-it@sheffield.ac.uk`` and ask to be unfrozen.

I can not log into a cluster via the MyApps applications portal
---------------------------------------------------------------
Most of the time such problems arise due to due to Java version issues. As Java updates are released regularly, these problems are usually caused by the changes to the Java plug-in for the browser.
Follow the trouble-shooting link from the `browser-access page <https://www.sheffield.ac.uk/it-services/research/hpc/using/access/browser>`_ to resolve these problems. There is also a link on that page to test the functionality of your java plug-in. It can also help to try a different browser to see if it makes any difference.
All failing, you may have to fall back to one of the `non-browser access methods <https://www.sheffield.ac.uk/it-services/research/hpc/using/access>`_.

I cannot see my folders in /data or /shared
-------------------------------------------
Some directories such as ``/data/<your username>`` or ``/shared/<your project/`` are made available **on-demand**:.
For example, if your username is `ab1def` and you look in `/data` straight after logging in, you may not see `/data/ab1def`.
The directory is there, it has just not been made available (via a process called **mounting**) to you automatically.
When you attempt to do something with the directory such as ``ls /data/ab1def`` or ``cd /data/ab1def``, the directory will be mounted automatically and will appear to you.
The directory will be automatically unmounted after a period of inactivity.

My batch job terminates without any messages or warnings
--------------------------------------------------------

When a batch job that is initiated by using the ``qsub`` command or ``runfluent``, ``runansys`` or ``runabaqus`` commands, it gets allocated specific amount of real memory and run-time.
If a job exceeds either the real memory or time limits it gets terminated immediately and usually without any warning messages.

It is therefore important to estimate the amount of memory and time that is needed to run your job to completion and specify it at the time of submitting the job to the batch queue.

..
   Please refer to the section on `hitting-limits and estimating-resources <https://www.shef.ac.uk/it-services/research/hpc/iceberg/requirements>`_ for information on how to avoid these problems.

Exceeding your disk space quota
-------------------------------
Each user of the system has a fixed amount of disk space available in their home directory.
If you exceed this quota, various problems can emerge such as an inability to launch applications and run jobs.
To see if you have exceeded your disk space quota, run the ``quota`` command:

.. code-block:: console

       [foo11b@sharc-node004 binary]$ quota

       Size  Used Avail Use%  Mounted on
       10G    10G    0G 100%  /home/foo11b
       100G     0  100G   0%  /data/foo11b

In the above, you can see that the quota was set to 10 gigabytes and all of this is in use.
Any jobs submitted by this user will likely result in an ``Eqw`` status.
The recommended action is for the user to delete enough files to allow normal work to continue.

To assess what is using up your quota within a given directory, you can make use of the 
:ref:`ncdu module on ShARC <ncdu_sharc>` or the 
:ref:`ncdu module on Bessemer <ncdu_bessemer>`. The **ncdu** utility will give you an 
interactive display of what files/folders are taking up storage in a given directory tree.

Sometimes, it is not possible to log in to the system because of a full quota,
in which case you need to contact ``research-it@sheffield.ac.uk`` and ask to the unfrozen.

I am getting warning messages and warning emails from my batch jobs about insufficient memory
---------------------------------------------------------------------------------------------

If a job exceeds its real memory resource it gets terminated. You can use the ``rmem=`` parameter to increase the amount of real memory that your job requests.

.. _real-vs-virt-mem:

What are the rmem (real memory) and (deprecated) mem (virtual memory) options?
------------------------------------------------------------------------------

.. warning::

   The following is most likely only of interest when revisiting job submission scripts and documentation created before
   26 June 2017 as now users only need to request real memory (``rmem``) and jobs are only killed if they exceed their ``rmem`` quota
   (whereas prior to that date jobs could request and be policed using virtual memory ``mem`` requests).

Running a program always involves loading the program instructions and also its data (i.e. all variables and arrays that it uses) into the computer's memory.
A program's entire instructions and its entire data, along with any dynamically-linked libraries it may use, defines the **virtual storage** requirements of that program.
If we did not have clever operating systems we would need as much physical memory (RAM) as the virtual storage requirements of that program.
However, operating systems are clever enough to deal with situations where we have insufficient **real memory** (physical memory, typically called RAM) to
load all the program instructions and data into the available RAM.
This technique works because hardly any program needs to access all its instructions and its data simultaneously.
Therefore the operating system loads into RAM only those bits (**pages**) of the instructions and data that are needed by the program at a given instance.
This is called **paging** and it involves copying bits of the programs instructions and data to/from hard-disk to RAM as they are needed.

If the real memory (i.e. RAM) allocated to a job is much smaller than the entire memory requirements of a job ( i.e. virtual memory)
then there will be excessive need for paging that will slow the execution of the program considerably due to
the relatively slow speeds of transferring information to/from the disk into RAM.

On the other hand if the RAM allocated to a job is larger than the virtual memory requirement of that job then
it will result in waste of RAM resources which will be idle duration of that job.

* The virtual memory limit defined by the ``-l mem`` cluster scheduler parameter defines the maximum amount of virtual memory your job will be allowed to use. **This option is now deprecated** - you can continue to submit jobs requesting virtual memory, however the scheduler **no longer applies any limits to this resource**.
* The real memory limit is defined by the ``-l rmem`` cluster scheduler parameter and defines the amount of RAM that will be allocated to your job.  The job scheduler will terminate jobs which exceed their real memory resource request.

.. note::

   As mentioned above, jobs now need to just request real memory and are policed using real memory usage.  The reasons for this are:

   * For best performance it is preferable to request as much real memory as the virtual memory storage requirements of a program as paging impacts on performance and memory is (relatively) cheap.
   * Real memory is more tangible to newer users.

Insufficient memory in an interactive session
---------------------------------------------
By default, an interactive session provides you with 2 Gigabytes of RAM (sometimes called real memory).
You can request more than this when running your ``qrshx``/``qsh``/``qrsh`` command e.g.: ::

        qrshx -l rmem=8G

This asks for 8 Gigabytes of RAM (real memory). Note that you should:

* not specify more than 256 GB of RAM (real memory) (``rmem``)

'Illegal Instruction' errors
----------------------------

If your program fails with an **Illegal Instruction** error then it may have been compiled using (and optimised for) one type of processor but is running on another.

If you get this error **after copying compiled programs onto a cluster** then you may need to recompile them on on the cluster or recompile them elsewhere without aggressively optimising for processor architecture.

If however you get this error when **running programs on the cluster that you have also compiled on the cluster** then you may have compiled on one processor type and be running on a different type.
You may not consistently get the *illegal instruction* error here as the scheduler may allocate you a different type of processor every time you run your program.
you can either recompile your program without optimisations for processor architecture or force your job to run on the type of processor it was compiled on using the ``-l arch=`` ``qsub``/``qrsh``/``qsh`` parameter e.g.

* ``-l arch=intel*`` to avoid being allocated one of the few AMD-powered nodes
* ``-l arch=intel-x5650`` to use the Intel Westmere CPU architecture
* ``-l arch=intel-e5-26[567]0`` to use the Intel Sandy Bridge CPU architecture

If you know the node that a program was compiled on but do not know the CPU architecture of that node then you can discover it using the following command (substituting in the relevant node name): ::

        qhost | egrep '(ARCH|node116)'

.. _windows_eol_issues:

Windows-style line endings
--------------------------
If you prepare text files such as your job submission script on a Windows machine, you may find that they do not work as intended on the system. A very common example is when a job immediately goes into ``Eqw`` status after you have submitted it and you are presented with an error message containing: ::

        failed searching requested shell because:

The reason for this behaviour is that Windows and Unix machines have different conventions for specifying 'end of line' in text files. Windows uses the control characters for 'carriage return' followed by 'linefeed', ``\r\n``, whereas Unix uses just 'linefeed' ``\n``.

The practical upshot of this is that a script prepared in Windows using Notepad looking like this: ::

        #!/bin/bash
        echo 'hello world'

will look like the following to programs on a Unix system: ::

        #!/bin/bash\r
        echo 'hello world'\r

If you suspect that this is affecting your jobs, run the following command on the system: ::

        dos2unix your_files_filename

You can / should set your text editor to use Linux endings to avoid this issue.

error: no DISPLAY variable found with interactive job
-----------------------------------------------------
If you receive the error message: ::

        error: no DISPLAY variable found with interactive job

the most likely cause is that you forgot the ``-X`` switch when you logged into the cluster. That is, you might have typed: ::

        ssh username@clustername.sheffield.ac.uk

instead of: ::

        ssh -X username@clustername.sheffield.ac.uk

macOS users might also encounter this issue if their `XQuartz <https://www.xquartz.org/>`_ is not up to date.

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

Strange fonts or errors re missing fonts when trying to start a graphical application
-------------------------------------------------------------------------------------

Certain programs require esoteric fonts to be installed on the machine running the X server (i.e. your local machine).
Example of such programs are ``qmon``, a graphical interface to the Grid Engine scheduling software, and the Ansys software.
If you try to run ``qmon`` or Ansys **on a Linux machine** and see strange symbols instead of the Latin alphabet or get an error message that includes: ::

        X Error of failed request: BadName (named color or font does not exist)

then you should try running the following **on your own machine**: ::

        for i in 75dpi 100dpi; do
            sudo apt-get install xfonts-75dpi
            pushd /usr/share/fonts/X11/$i/
            sudo mkfontdir
            popd
            xset fp+ /usr/share/fonts/X11/$i
        done

Note that these instructions are Ubuntu/Debian-specific; on other systems package names and paths may differ.

Next, try :ref:`connecting to a cluster <connecting>` using ``ssh -X clustername``, start a graphical session then try running ``qmon``/Ansys again.
If you can now run ``qmon``/Ansys without problems
then you need to add two lines to the ``.xinitrc`` file in your home directory **on your own machine**
so this solution will continue to work following a reboot of your machine: ::

        FontPath /usr/share/fonts/X11/100dpi
        FontPath /usr/share/fonts/X11/75dpi

Can I run programs that need to be able to talk to an audio device?
-------------------------------------------------------------------

On ShARC all worker nodes have a dummy sound device installed
(which is provided by a kernel module called `snd_dummy <https://www.alsa-project.org/main/index.php/Matrix:Module-dummy>`__).

This may be useful if you wish to run a program that expects to be able to output audio (and crashes if no sound device is found)
but you don't actually want to monitor that audio output.

Login node RSA/ECDSA/ED25519 fingerprints
-----------------------------------------

The RSA, ECDSA and ED25519 fingerprints for ShARC's login nodes are: ::

   SHA256:NVb+eAG6sMFQEbVXeF5a+x5ALHhTqtYqdV6g31Kn6vE (RSA)
   SHA256:WJYHPbMKrWud4flwhIbrfTB1SR4pprGhx4Vu88LhP58 (ECDSA)
   SHA256:l8imoZMnO+fHGle6zWi/pf4eyiVsEYYscKsl1ellrnE (ED25519)

The RSA, ECDSA and ED25519 fingerprints for Bessemer's login nodes are: ::

   SHA256:AqxYHUlW3r+vrmwS0g0Eru9u4ZujcFCRJajkTRdcAfA (RSA)
   SHA256:eG/eFhOXyKS77WCsMmkDwZSV4t7y/D8zBFHt1mFP280 (ECDSA)
   SHA256:TVzevzGC2uz8r1Z16MB9C9xEQpm7DAJC4tcSvYSD36k (ED25519)

Issue when running multiple MPI jobs in sequence
------------------------------------------------

If you have multiple ``mpirun`` commands in a single batch job submission script,
you may find that one or more of these may fail after
complaining about not being able to communicate with the ``orted`` daemon on other nodes.
This appears to be something to do with multiple ``mpirun`` commands being called quickly in succession,
and connections not being pulled down and new connections established quickly enough.

Putting a sleep of e.g. 5s between ``mpirun`` commands seems to help here. i.e. ::

  mpirun program1
  sleep 5s
  mpirun program2

.. _unnamed_groups:

Warning about 'groups: cannot find name for group ID xxxxx'
-----------------------------------------------------------

You may occasionally see warnings like the above e.g. when running a :ref:`Singularity <singularity_sharc>` container or when running the standard ``groups`` Linux utility.
These warnings can be ignored.

The scheduler, Son of Grid Engine, dynamically creates a Unix group per job to
keep track of resources (files and process) associated with that job.
These groups have numeric IDs but no names, which can result in harmless warning messages in certain circumstances.

See ``man 8 pam_sge-qrsh-setup`` for the details of how and why Grid Engine creates these groups.

Using 'sudo' to install software on the clusters
------------------------------------------------

HPC users do not have sufficient access privileges to use sudo to install software (in /usr/local). Users can however install applications in their /home or /data directories.
The webpage `Installing Applications on Bessemer and ShARC <https://www.sheffield.ac.uk/it-services/research/hpc/using/install>`_ provides guidance on how to do this.
