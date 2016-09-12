.. _getting-started:

Getting Started
===============

If you have not used a High Performance Computing (HPC) cluster, Linux or
even a command line before this is the place to start. This guide will get you 
set up using iceberg in the easiest way that fits your requirements.

Getting an Account
##################

Before you can start using iceberg you need to register for an account.
Accounts are availible for staff by emailing `helpdesk@sheffield.ac.uk <helpdesk@sheffield.ac.uk>`_.

The following categories of students can also have an account on iceberg with 
the permission of their supervisors:

* Research Postgraduates
* Taught Postgraduates - project work
* Undergraduates 3rd & 4th year  - project work

Student's supervisors can request an account for the student by emailing
`helpdesk@sheffield.ac.uk <helpdesk@sheffield.ac.uk>`_.

.. note::

    Once you have obtained your iceberg username, you need to initialize your 
    iceberg password to be the same as your normal password by using the CICS
    `synchronize passwords system <https://www.shef.ac.uk/cics/password>`_.

.. _connecting:

Connecting to iceberg (Terminal)
################################

Accessing iceberg through an ssh terminal is easy and the most flexible way of 
using iceberg, as it is the native way of interfacing with the linux cluster. 
It also allows you to access iceberg from any remote location without having to setup VPN
connections.  

Rest of this page summarizes the recommended methods of accessing iceberg from commonly used platforms. 
A more comprehensive guide to accessing iceberg and transfering files is located at 
`http://www.sheffield.ac.uk/cics/research/hpc/using/access <http://www.sheffield.ac.uk/cics/research/hpc/using/access>`_

Windows
```````

Download and install the *Installer edition* of `mobaxterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_.

After starting MobaXterm you should see something like this:

.. image:: /images/mobaxterm-welcome.png
   :width: 50%
   :align: center

Click *Start local terminal* and if you see something like the the following then please continue to the :ref:`ssh` section.

.. image:: /images/mobaxterm-terminal.png
   :width: 50%
   :align: center


Mac OS/X and Linux
``````````````````

Linux and Mac OS/X both have a terminal emulator program pre-installed.

Open a terminal and then go to :ref:`ssh`.

.. _ssh:

Connect to iceberg
``````````````````

Once you have a terminal open run the following command::

    ssh -X <username>@iceberg.shef.ac.uk

where you replace `<username>` with your CICS username.

This should give you a prompt resembling the one below::

    [te1st@iceberg-login2 ~]$ 

at this prompt type::

    qsh

like this::

    [te1st@iceberg-login2 ~]$ qsh
    Your job 135355 ("INTERACTIVE") has been submitted
    waiting for interactive job to be scheduled ....
    Your interactive job 135355 has been successfully scheduled.

which will pop up another terminal window, which supports graphical applications.

.. note::

    Iceberg is a compute cluster. When you login to the cluster you reach one 
    of two login nodes. You **should not** run applications on the login nodes.
    Running qsh gives you an interactive terminal on one of the many worker nodes
    in the cluster.

    If you only need terminal based (CLI) applications you can run the qrsh command.
    Which will give you a shell on a worker node, but without graphical application
    (X server) support.


.. raw:: html

   <p>
    This video shows the connection process using mobaxterm, and then connection 
    and running matlab from a <cite>qsh</cite> terminal.
   </p>

   <video style="margin-left: auto; margin-right:auto; display: block;" width=70% controls>
       <source src="http://rcg.group.shef.ac.uk/tutorial_videos/mobaxterm-login-matlab-demo.webm" type="video/webm" />
       <source src="http://rcg.group.shef.ac.uk/tutorial_videos/mobaxterm-login-matlab-demo.mp4" type="video/mp4" />
   </video>


What Next?
``````````

Now you have connected to iceberg, you can look at how to submit jobs with :ref:`sge-queue` or look at :ref:`software`.
