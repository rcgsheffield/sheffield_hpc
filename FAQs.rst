.. _FAQs:

Frequently Asked Questions
==========================
In this section, we'll discuss some tips for solving problems with Bessemer and ShARC.
It is suggested that you work through some of the ideas here before contacting the IT Services Helpdesk for assistance.

------

Strange things are happening with my terminal or my terminal seems broken
-------------------------------------------------------------------------

Symptoms include many of the commands not working and just ``bash-4.1$`` or ``sh-4.2$`` being displayed instead of your username at the bash prompt.

This may be because you've deleted your ``.bashrc`` and ``.bash_profile`` files - these are 'hidden' files which live in your home directory and are used to correctly set up your shell environment.
If you hit this problem you can run the command ``resetenv`` which will restore the default files, then you should logout and log back in.

------

I can no longer log in
----------------------

If you are confident that you have no password entry issues, have already requested and been granted a HPC account and are connected to the VPN but you still can not log onto a cluster,
you may have inadvertently corrupted your shell environment if you have been installing software or making changes in your .bashrc file. Please attempt to resolve this first by resetting
your environment with the following command, replacing the variables appropriately: ``ssh -t $USER@$CLUSTER.shef.ac.uk 'resetenv -f'``

Alternatively, you may be having problems due to exceeding your cluster filestore quota. If you exceed your filestore quota in your ``/home`` area it is sometimes possible that crucial
files in your home directory get truncated which effect or prevent the login process.

If the ``resetenv -f`` command does not resolve your issue and you suspect your ``/home`` area is full , you should contact ``research-it@sheffield.ac.uk`` and ask to be unfrozen
providing your username and a list files or folders which can be removed or temporarily moved to your ``/data`` area.

------

I can not log into a cluster via the MyApps applications portal
---------------------------------------------------------------

Most of the time such problems arise due to Java version issues. As Java updates are released regularly, these problems are usually caused by the changes to the Java plug-in for the browser.

Most users can swap to using the HTML5 client to resolve these problems via the **"Client Options"** link at the bottom right of the login window and then clicking the **"To use the HTML5 Client login"** link.

It can also help to try a different browser to see if it makes any difference.
All failing, you may have to fall back to one of the `non-browser access methods <https://docs.hpc.shef.ac.uk/en/latest/hpc/connecting.html#connecting-to-a-cluster-using-ssh>`_.

------


.. _man_pages:

How do I find out more about the commands available on the clusters with man pages?
-----------------------------------------------------------------------------------

Man pages (manuals) are installed by default alongside commands/software on unix-like operating systems such as those found on the clusters.

To view the man page (official manual) for a command, you can use the command:


.. code-block:: console

        man <command_name>


You can navigate man pages using (the same keyboard shorcuts as **less**):

        * **Space** to advance one page
        * **d** to advance half a page
        * **b** to go back one page
        * **u** to go back half a page
        * **/** starts search mode, after which you enter a search term

Whilst in search mode press **n** for next occurrence and **N** for previous occurrence.

You can also press **h** when viewing man pages to show help.

Documentation for less is available on the system using the command:

.. code-block:: console

        man less


If you don't know the specific command name then you can use **apropos** which searches all names of man pages and their one line descriptions:

.. code-block:: console

        apropos <search_term>

To list all avaiable command man pages:

.. code-block:: console

        apropos .

------





I cannot see my folders in /data or /shared
-------------------------------------------

Some directories such as ``/data/<your username>`` or ``/shared/<your project/`` are only made available **on-demand**:.
For example, if your username is `te1st` and you look in ``/data`` straight after logging in, you may not see ``/data/te1st`` in your terminal or MobaXterm file browser.

The directory is there, it has just not been made available (via a process called **mounting**) to you automatically yet.

When you attempt to do something with the directory such as ``ls /data/te1st`` or ``cd /data/te1st`` in the terminal, the directory will be mounted automatically and will appear to you.

If you are in MobaXterm, you should attempt to navigate to the folder with using the file browser path entry / display box, then hit the refresh button.


.. warning::

        Directories will be automatically unmounted after a period of inactivity.

------

I've loaded software but it isn't working
-----------------------------------------

This usually means that you are on a `login node <https://docs.hpc.shef.ac.uk/en/latest/hpc/what-is-hpc.html#login-nodes>`_. You will need to start an interactive session after which you will be able to load cluster software.

.. tabs::

   .. group-tab:: Stanage

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: Bessemer

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: ShARC

    .. code-block:: console

        qrshx

------

My batch job terminates without any messages or warnings
--------------------------------------------------------

When a batch job is initiated by using the ``qsub`` or ``sbatch`` commands, it gets allocated specific amount of real memory and run time that you request, or small default values.
If a job exceeds either the real memory or time limits it gets terminated immediately and usually without any warning messages.

It is therefore important to estimate the amount of memory and time that is needed to run your job to completion and specify it at the time of submitting the job to the batch queue.

Please refer to our :ref:`Choosing appropriate compute resources page <Choosing-appropriate-compute-resources>` for information on how to assess sensible resource amounts and avoid these problems.

.. tip::

        If you are confident that the scheduler is not terminating your job, but your job is prematurely stopping, please check if you have attempted to exceed your disk space quota, instructions for this are seen below.

------

I've submitted a job but it's not running
-----------------------------------------

I submitted a job and after several days it is still waiting in the queue. How can I resolve this?
There are a multitude of factors which could be causing your job to queue for a long time or to not run at all.
Occasionally parts of the system may be in a maintenance period or may be utlised to capacity.
A few things to consider which would cause your job to not run at all:

* Did you request an acceptable amount of memory for a given node? (e.g. on Bessemer, 192GB or less.)
* Did you request too much memory in the wrong parallel environment? (e.g on ShARC, OpenMP `-l rmem=16G` with 16 cores would request 16*16=256G exceeding node memory.)
* Did you request too many cores in the wrong parallel environment? (e.g on ShARC,  `-pe openmp 40` would request 40 cores, exceeding a single node's core count.)
* Did you request too much time? (e.g for ShARC, more than 96 hours or on Bessemer, more than 168 hrs.)

Following are ways to fix too much time requested


.. tabs::

   .. group-tab:: Stanage
        The maximum run time for Bessemer is 168 hours.

        You can get an estimate for when your job will run on Bessemer using:

        .. code-block:: console

                squeue --start -j <jobid>

        You can reduce the runtime using:

        .. code-block:: console

                scontrol update jobid=<job_id> TimeLimit=<new_timelimit>

        then to verify the time change type:

        .. code-block:: console

                squeue -j <jobid> --long

        Alternatively, delete the job using scancel and re-submit with the new max runtime

   .. group-tab:: Bessemer

        The maximum run time for Bessemer is 168 hours.

        You can get an estimate for when your job will run on Bessemer using:

        .. code-block:: console

                squeue --start -j <jobid>

        You can reduce the runtime using:

        .. code-block:: console

                scontrol update jobid=<job_id> TimeLimit=<new_timelimit>

        then to verify the time change type:

        .. code-block:: console

                squeue -j <jobid> --long

        Alternatively, delete the job using scancel and re-submit with the new max runtime

   .. group-tab:: ShARC

        The maximum run time for ShARC is 96 hours.

        You can check if a job will ever run on ShARC using:

        .. code-block:: console

                qalter -w v <job_id>

        However, please be aware this can result in false positives as noted `here <https://rse.shef.ac.uk/blog/sge-job-validation-2/>`_

        You can reduce the runtime using:

        .. code-block:: console

                qalter <job_id> -l h_rt=96:00:00

        then to verify the time change (which will be shown in seconds) type:

        .. code-block:: console

                qstat -r

        Alternatively, delete the job using qdel and re-submit with the new max runtime.


------

"No space left on device" errors and jobs prematurely stopping
--------------------------------------------------------------

Each user of the system has a fixed amount of disk space available in their home directory. If you see an error in your job's logs indicating "No space left on device"
it is likely that your quota has ran out.

If you attempt to exceed this quota, various problems can emerge such as an inability to launch applications or run jobs, the inability to login or abruptly terminated jobs
as programs or executables are now unable to write to your ``/home`` folder.
To see if you are attempting to exceed your disk space quota, run the ``quota`` command:

.. code-block:: console

       [te1st@sharc-node004 ~]$ quota

       Size  Used Avail Use%  Mounted on
       10G    10G    0G 100%  /home/te1st
       100G     0  100G   0%  /data/te1st

In the above, you can see that the quota is 10 gigabytes and all of this is currently in use.
Any jobs submitted by this user will likely result in an ``Eqw`` status.
The recommended action is for the user to delete enough files, or move enough files to another filestore to allow normal work to continue.

To assess what is using up your quota within a given directory, you can make use of the :ref:`ncdu module on Stanage <ncdu_stanage>`, the 
:ref:`ncdu module on Bessemer <ncdu_bessemer>` or the :ref:`ncdu module on ShARC <ncdu_sharc>` . The **ncdu** utility will give you an
interactive display of which files or folders are taking up storage in a given directory tree.

Sometimes, it is not possible to log in to the system because of a full quota. In this situation you should contact ``research-it@sheffield.ac.uk``
to ask for assistance, providing your username and a list files or folders which can be removed or temporarily moved to your ``/data`` area.

------

I am getting warning messages and warning emails from my batch jobs about insufficient memory
---------------------------------------------------------------------------------------------

If a job exceeds its real memory resource it gets terminated.

These errors on ShARC will be noted in the job record or sent via email and will resemble: ::

        failed qmaster enforced h_rt, h_cpu, or h_vmem limit because:
        job 1345678.1 died through signal KILL (9)

.. tip::

        This error from ShARC can also indicate the job has ran out of time (**h_rt**).


These errors on Bessemer will be noted in the job record or sent via email with a subject line resembling: ::

        Slurm Job_id=12345678 Name=job.sh Failed, Run time 00:11:06, OUT_OF_MEMORY


To query if your job has been killed due to insufficient memory please see the cluster specific "**Investigating finished jobs**" sections on our  :ref:`Job Submission and Control page <job_submission_control>`.

To request more memory and for information on how to assess sensible resource amounts please refer to our :ref:`Choosing appropriate compute resources page <Choosing-appropriate-compute-resources>`.


.. _real-vs-virt-mem:

------

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

.. hint::

   As mentioned above, jobs now need to just request real memory and are policed using real memory usage.  The reasons for this are:

   * For best performance it is preferable to request as much real memory as the virtual memory storage requirements of a program as paging impacts on performance and memory is (relatively) cheap.
   * Real memory is more tangible to newer users.

------

Insufficient memory in an interactive session
---------------------------------------------

By default, an interactive session provides you with 2 Gigabytes of RAM (sometimes called real memory).
You can request more than this when running your ``qrshx``, ``qsh``, ``qrsh`` or ``srun`` command.

.. tabs::

   .. group-tab:: Stanage

        .. code-block:: console

                $ srun --mem=8G --pty bash -i

   .. group-tab:: Bessemer

        .. code-block:: console

                $ srun --mem=8G --pty bash -i

   .. group-tab:: ShARC

        .. code-block:: console

                $ qrshx -l rmem=8G

This asks for 8 Gigabytes of RAM (real memory).

.. hint::

        You cannot request more memory than a single node possesses and the larger the memory request, the less likely the interactive session request is to succeed.
        Please see the cluster specific "**Interactive jobs**" sections on our  :ref:`Job Submission and Control page <job_submission_control>`.

------

'Illegal Instruction' errors
----------------------------

If your program fails with an **Illegal Instruction** error then it may have been compiled using (and optimised for) one type of processor but is running on another.

If you get this error **after copying compiled programs onto a cluster** then you may need to recompile them on on the cluster or recompile them elsewhere without aggressively optimising for processor architecture.

If however you get this error when **running programs on the cluster that you have also compiled on the cluster** then you may have compiled on one processor type and be running on a different type.
You may not consistently get the *illegal instruction* error here as the scheduler may allocate you a different type of processor every time you run your program.
You can either recompile your program without optimisations for processor architecture or force your job to run on the type of processor it was compiled on using the ``-l arch=`` ``qsub``/``qrsh``/``qsh`` parameter e.g.

* ``-l arch=intel*`` to avoid being allocated one of the few AMD-powered nodes
* ``-l arch=intel-x5650`` to use the Intel Westmere CPU architecture
* ``-l arch=intel-e5-26[567]0`` to use the Intel Sandy Bridge CPU architecture

If you know the node that a program was compiled on but do not know the CPU architecture of that node then you can discover it using the following command (substituting in the relevant node name): ::

        qhost | egrep '(ARCH|node116)'

.. _windows_eol_issues:

------

"failed: No such file or directory" or "failed searching requested shell" errors
--------------------------------------------------------------------------------

If you prepare text files such as your job submission script on a Windows machine, you may find that they do not work as intended on the HPC systems.
A very common example is when a job immediately goes into ``Eqw`` status after you have submitted it and when you query the job with ``qacct`` you
are presented with an error message containing: ::

        failed searching requested shell because:

Or if you query the ``Eqw`` job with ``qstat`` ::

        failed: No such file or directory

The reason for this behaviour is that Windows and Unix machines have different conventions for specifying 'end of line' in text files. Windows uses the
control characters for 'carriage return' followed by 'linefeed', ``\r\n``, whereas Unix uses just 'linefeed' ``\n``.

This means a script prepared in Windows using Notepad whichs looks like this: ::

        #!/bin/bash
        echo 'hello world'

will look like the following to programs on a Unix system: ::

        #!/bin/bash\r\n
        echo 'hello world'\r\n

If you suspect that this is affecting your jobs, run the following command on the system: ::

        dos2unix your_files_filename

You should set your text editor to use Linux endings to avoid this issue.

------

error: no DISPLAY variable found with interactive job
-----------------------------------------------------

If you receive the error message: ::

        error: no DISPLAY variable found with interactive job

the most likely cause is that you forgot the ``-X`` switch when you logged into the cluster. That is, you might have typed: ::

        ssh username@clustername.shef.ac.uk

instead of: ::

        ssh -X username@clustername.shef.ac.uk

macOS users might also encounter this issue if their `XQuartz <https://www.xquartz.org/>`_ is not up to date.

macOS users should also try ``-Y`` if ``-X`` is not working:

::

        ssh -Y username@clustername.shef.ac.uk

------

Problems connecting with WinSCP
-------------------------------

Some users have reported issues while connecting to the system using WinSCP, usually when working from home with a poor connection and when accessing folders with large numbers of files.

In these instances, turning off ``Optimize Connection Buffer Size`` in WinSCP can help:

* In WinSCP, goto the settings for the site (ie. from the menu ``Session->Sites->SiteManager``)
* From the ``Site Manager`` dialog click on the selected session and click edit button
* Click the advanced button
* The Advanced Site Settings dialog opens.
* Click on connection
* Untick the box which says ``Optimize Connection Buffer Size``

------

Problems connecting with Filezilla due to MFA
---------------------------------------------

Due to the change to the use of MFA (multi-factor authentication) two simple changes are needed to connect using Filezilla to the HPC clusters.

*  Change the logon type to interactive login.
*  Limit the number of simultaneous connections to 1.

Detailed instructions are contained in the following link: https://unm-student.custhelp.com/app/answers/detail/a_id/7857/~/filezilla-ftp-configuration-for-duo-mfa-protected-linux-servers

------

Strange fonts or errors re missing fonts when trying to start a graphical application
-------------------------------------------------------------------------------------

Certain programs require esoteric fonts to be installed on the machine running the X server (i.e. your local machine).
Example of such programs are ``qmon``, a graphical interface to the Grid Engine scheduling software, and the ANSYS software.
If you try to run ``qmon`` or ANSYS software **on a Linux machine** and see strange symbols instead of the Latin alphabet or get an error message that includes: ::

        X Error of failed request: BadName (named color or font does not exist)

Then you should try running the following **on your own machine**: ::

        for i in 75dpi 100dpi; do
            sudo apt-get install xfonts-75dpi
            pushd /usr/share/fonts/X11/$i/
            sudo mkfontdir
            popd
            xset fp+ /usr/share/fonts/X11/$i
        done

.. warning::

        Note that these instructions are Ubuntu/Debian-specific; on other systems package names, paths and commands may differ.

Next, try :ref:`connecting to a cluster <connecting>` using ``ssh -X clustername.shef.ac.uk``, start a graphical session then try running ``qmon`` or ANSYS software again.

If you can now run ``qmon`` or ANSYS software without problems then you need to add two lines to the ``.xinitrc`` file in your home directory **on your own machine**
so this solution will continue to work following a reboot of your machine: ::

        FontPath /usr/share/fonts/X11/100dpi
        FontPath /usr/share/fonts/X11/75dpi

------

Can I run programs that need to be able to talk to an audio device?
-------------------------------------------------------------------

On ShARC all worker nodes have a dummy sound device installed
(which is provided by a kernel module called `snd_dummy <https://www.alsa-project.org/main/index.php/Matrix:Module-dummy>`__).

This may be useful if you wish to run a program that expects to be able to output audio (and crashes if no sound device is found)
but you don't actually want to monitor that audio output.

------

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

The RSA, ECDSA and ED25519 fingerprints for Stanage's login nodes are: ::

   SHA256:mFfJmZHH0SUogoUhTtlatoZLEacfGAlj0cTrnInO5z0 (RSA)
   SHA256:4HdvK3C1KDm+JG1TzxQKxezMz5ojEORynHUqF9tQfoI (ECDSA)
   SHA256:aaTv+0TEc0nj7WR2ZuBYWFDD+QqzOKJpMjEFKBx6pQU (ED25519)

------

I have a new account, how do I transfer data from my old account
----------------------------------------------------------------

Please note that the below guide assumes that both accounts are still be active. If you have lost access to the old account in the last few weeks then get in touch with us via research-it@sheffield.ac.uk and we may be able to help transfer files across.

To transfer data between your old account and your new account you could make use of either `SCP <https://docs.hpc.shef.ac.uk/en/latest/hpc/transferring-files.html#using-scp-in-the-terminal>`__ or `rsync <https://docs.hpc.shef.ac.uk/en/latest/hpc/transferring-files.html#using-rsync>`__. We encourage users to use rsync as it preserves timestamps and permisions. Follow the following workflow to carry out the transfer.

* Log into your new username in the cluster you want to copy to and create a folder named "OldUserAccount".

.. code-block:: bash

        mkdir OldUserAccount

* Log into your old account and run the rsync command. Here we show two examples.

1. You want to copy the files to the new account on the same cluster node(e.g old account on Bessemer to new account on Bessemer), here we are only going to use the "avP" options as we dont need to compress the data.

.. code-block:: bash

        rsync -avP /Path/To/File_Or_Directory $Your_New_UserName@$HOSTNAME:/home/$Your_New_UserName/OldUserAccount

2. You want to copy your files to the new account on a different cluster node(e.g old account on Bessemer to new account on ShARC/Stanage), here we are going to use the option "avzP" as we are going to transfer data over the internet, and it will be faster if it is compressed.

.. code-block:: bash

        rsync -avzP /Path/To/File_Or_Directory $Your_New_UserName@$clustername.shef.ac.uk:/home/$Your_New_UserName/OldUserAccount

------

Issue when running multiple MPI jobs in sequence
------------------------------------------------

If you have multiple ``mpirun`` commands in a single batch job submission script,
you may find that one or more of these may fail after
complaining about not being able to communicate with the ``orted`` daemon on other nodes.
This appears to be something to do with multiple ``mpirun`` commands being called quickly in succession,
and connections not being pulled down and new connections established quickly enough.

Putting a sleep of e.g. 5s between ``mpirun`` commands seems to help here. i.e.

.. code-block:: console

  mpirun program1
  sleep 5s
  mpirun program2

------

.. _unnamed_groups:

Warning about 'groups: cannot find name for group ID xxxxx'
-----------------------------------------------------------

You may occasionally see warnings like the above e.g. when running an :ref:`Apptainer/Singularity <apptainer_sharc>` container or when running the standard ``groups`` Linux utility.
These warnings can be ignored.

The scheduler, Son of Grid Engine, dynamically creates a Unix group per job to
keep track of resources (files and process) associated with that job.
These groups have numeric IDs but no names, which can result in harmless warning messages in certain circumstances.

See ``man 8 pam_sge-qrsh-setup`` for the details of how and why Grid Engine creates these groups.

------

Using 'sudo' to install software on the clusters
------------------------------------------------

HPC users do not have sufficient access privileges to use sudo to install software (in ``/usr/local``) and permission to use sudo will not be granted to non-system administrators.
Users can however install applications in their ``/home`` or ``/data`` directories.

The webpage `Installing Applications on Bessemer and ShARC <https://docs.hpc.shef.ac.uk/en/latest/hpc/installing-software.html>`_ provides guidance on how to do this.

Is data encrypted at rest on HPC storage areas?
-----------------------------------------------

At present, no HPC storage areas on any of our clusters encrypt data at rest.

Are the HPC clusters certified to standards such as Cyber Essentials, Cyber Essentials Plus or ISO 27001?
---------------------------------------------------------------------------------------------------------

Due to the complexity of the multi-user High Performance Computing service,
the service is not currently certified as being compliant with the
Cyber Essentials, Cyber Essentials Plus or ISO 27001 schemes/standards.
This is unlikely to change in future.


Can I use VSCode on the HPC clusters?
---------------------------------------------------------------------------------------------------------

Usage restrictions
^^^^^^^^^^^^^^^^^^

.. caution::

        The usage of VSCode on the Sheffield HPC clusters is partially restricted. Usage of the **Visual Studio Code Remote - SSH**
        and **Visual Studio Code Remote Explorer** extensions to run VSCode on the HPC clusters is not permitted.

The **Visual Studio Code Remote - SSH** and **Visual Studio Code Remote Explorer** extensions use SSH to download a copy of VSCode
to the cluster then start VSCode on the login nodes and forward back the interface to you. This means the VSCode and all
dependent processes you run in the terminal are run on the login nodes. Not only does this tend to spawn lots of processes
(which might hit our 100 processes per user limit on the login nodes which will lock you out of the cluster) it also fails
to clean up processes correctly when the SSH connection is eventually terminated. This results in orphaned processes using
high CPU, wasting resources. Furthermore, some users also try to use large amounts of CPU by running code / debugging on
the login nodes which unfairly impacts other users as well.

.. hint::

        As documented elsewhere in this site, if you are doing anything that will require a lot of CPU or memory you should use a worker node.

Permitted alternative methods for running VSCode are detailed below in the ideal order of preference
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the first instance, we recommend a workflow where version control with Github (or similar) is used alongside VSCode where scripts/code are
synchronised between machines (e.g. your local machine and the HPC cluster) using conventional Git sync commands. Users are free to use the
VSCode terminal on the local machine to SSH to the clusters and execute commands where necessary.

If this is not possible then VSCode can be ran on a worker node and forwarded back to your local machine in a web browser
via our VSCode Remote HPC script, (from `Github <https://github.com/rcgsheffield/vscoderemote_sheffield_hpc>`_). Details for its use
are included on the linked Github page.

If neither of these options are feasible, then running VSCode on a local machine in concert with
`an SSHFS mount of the desired folders <https://linuxize.com/post/how-to-use-sshfs-to-mount-remote-directories-over-ssh/>`_
from the HPC clusters to the local filesystem is possible but discouraged due to the likelihood of poor performance from machines remote
from the clusters. By mounting the folder from the HPC cluster to a local filesystem folder, users can edit files on the cluster with VSCode
as if they were normal local machine files.

-----

.. _srun_vs_mpirun_mpiexec:

Launching MPI tasks with srun versus mpirun or mpiexec
------------------------------------------------------

On ShARC we recommend launching MPI tasks from batch jobs
using the ``mpirun`` (or ``mpiexec``) program that comes with the MPI implementation you are using.
These MPI implementations *should* able to launch tasks on the primary node of the job and on remote nodes allocated to the job
in such a way that all consumed resources are tracked by the SGE job scheduler on ShARC;
this is the case for the :ref:`administrator-provided versions of OpenMPI and Intel MPI on ShARC <sharc-parallel>`;
no extra configuration is required by the end user.

On Bessemer and Stanage we recommend launching MPI tasks from batch jobs
using Slurm's ``srun`` command.
This only works if the MPI implmentation you are using is
built against a version of the PMI2 or PMI-X library
that is compatible with the PMI2 or PMI-X library used by the Slurm job scheduler.
This is the case for the administrator-provided versions of OpenMPI and Intel MPI on Bessemer and Stanage;
again, no extra configuration is required by the end user.

On Bessemer and Stanage in batch scripts you should use the ``--export=ALL`` option with the ``srun`` command, 
which tells Slurm to export all of the current shell environment variables to the job environment.

.. code-block:: console

        srun --export=ALL my_program

This is important because many applications and libraries rely on environment variables to locate their dependencies, such as shared libraries.

Take, for instance, if we were to submit this :ref:`OpenMPI non-interactive hello world job <batch_openmpi_stanage>` without the ``--export=ALL`` option, i.e:

.. code-block:: console
       :emphasize-lines: 5
        
        #!/bin/bash
        #SBATCH --nodes=1
        #SBATCH --ntasks-per-node=8
        module load OpenMPI/4.1.4-GCC-12.2.0
        srun hello

On the Stanage cluster, we would encounter an error message containing:

.. code-block:: console

        [node140.pri.stanage.alces.network:12429] PMIX ERROR: NOT-FOUND in file client/pmix_client.c at line 562

While loading the OpenMPI module will set the variable ``SLURM_MPI_TYPE=pmix_v4``, 
when ``srun`` is initiated it creates a new environment. Since we haven't instructed it to export the environment variables to this new environment,
it will not be able to locate ``SLURM_MPI_TYPE``, even if it's available in the current shell environment.

For those more familiar with the use of ``mpirun`` and ``mpiexec``:
``srun`` can here be thought to be functionally equivalent to ``mpirun`` and ``mpiexec``,
although it takes different arguments and can also be used for starting interactive sessions on Slurm clusters.

.. _ansys_license_restrictions:

Are there any license restrictions for ANSYS?
----------------------------------------------

ANSYS users are subject to a per user limit of 400 concurrent cores via a maximum check out limit of 400 ANSYS multi-core licenses. There are no limitations on 
the number of ANSYS applications users can open however:

* Multi-core licenses are checked out per application;
* when more than 4 cores are used concurrently;
* with the number required equal to the number of cores in use greater than 4. 

This restriction applies on an individual user basis across all applications and devices concurrently, including personal machines, managed desktop machines and the HPC clusters.

As a result of the above anyone on HPC, personal PCs or managed PCs using more than 4 cores per application open will 
require a number of ANSYS multi-core licenses equivalent to the number of cores they are using minus 4,
but cannot use more than 400 at once.

.. table:: **Example of license usage by a user**
   
   ==============================================       ===========================             
   User using ANSYS                                     Multi-core licenses in use
   ==============================================       ===========================
   On a desktop open using 4 cores                      4  - 4 = 0
   On another desktop using 6 cores                     6  - 4 = 2
   A job on ShARC using 12 cores                        12 - 4 = 8
   A job on Stanage using 20 cores                      20 - 4 = 16
   Another job on Stanage using 30 cores                30 - 4 = 26     
   **Total**                                            **52**
   ==============================================       =========================== 

|br|


