.. _connecting:

Connecting to a cluster using myApps (web browser)
==================================================

In order to access ShARC and Bessemer you must set up a `VPN and MFA <https://www.sheffield.ac.uk/it-services/vpn>`_. 
Also see section **Whether/how you can connect** below. 

The web browser method of access to ShARC and Bessemer is provided by the Secure Global Desktop Client. This method works well 
for most browsers on all the common computing platforms (Linux, Windows, Mac), however we recommend Internet Explorer or Firefox.

To login to ShARC or Bessemer click the following link: `Connect via myAPPs Portal <https://myapps.shef.ac.uk/sgd/index.jsp?langSelected=en>`_

.. note::

    If you are logging in for the first time, select Client Options on the myApps Portal page (bottom right) and 
    then click option 1 to download and install the client for your system (Windows, Mac, or Linux).

    Alternatively you can choose to use the HTML5 option to run myApps entirely within your browser.

Enter your username and password on the myApps Portal login page.

Once you have managed to login, you will see a window with applications on the left hand panel.

There are icons for ShARC Applications & Bessemer Applications respectively.

For each of these you can select a HPC interactive job or a HPC terminal (where HPC choice is ShARC & Bessemer).
The interactive job is equivalent to a ``qsh``/``qrshx`` or ``srun`` session on a worker node.
The terminal is equivalent to a login node session from which you can use ``qsh``/``qrshx``, ``qrsh``, ``qsh-vis`` or ``srun`` respectively.


Connecting to a cluster using SSH
=================================

The most versatile way to **run commands and submit jobs** on one of the clusters is to
use a mechanism called `SSH <https://en.wikipedia.org/wiki/Secure_Shell>`__,
which is a common way of remotely logging in to computers
running the Linux operating system.

To connect to another machine using SSH you need to
have a SSH *client* program installed on your machine.
macOS and Linux come with a command-line (text-only) SSH client pre-installed.
On Windows there are various graphical SSH clients you can use,
including *MobaXTerm*.

**Whether/how you can connect** to a University cluster using SSH (or the related protocols SCP and SFTP) **depends on**:

* Where you are connecting from:

  * on campus using wired ethernet;
  * on campus using Eduroam *after* `establishing a VPN connection (required) <https://www.sheffield.ac.uk/it-services/vpn>`_;
  * off campus *after* `establishing a VPN connection (required) <https://www.sheffield.ac.uk/it-services/vpn>`_;
  * off campus without a VPN connection using the HPC SSH gateway.

.. warning::

    The `University Connect for China (UCC) <https://www.sheffield.ac.uk/it-services/university-connect-china>`_ is not the same service as the SSL VPN service and will not grant access to the HPC clusters.
    Users of the UCC must disconnect the UCC and connect to the SSL VPN in order to connect to the HPC clusters.


.. warning::

    Eduroam no longer grants direct access to the clusters. If using Eduroam, you must keep the  `VPN <https://www.sheffield.ac.uk/it-services/vpn>`_ 
    connected at all times while using the clusters.

* Whether `Multifactor Authentication (MFA) <https://sites.google.com/sheffield.ac.uk/mfa/home>`__  has been enabled on your University account.

  MFA is :underline-bold:`now mandatory` for connecting to the clusters while using a password. 
  
  You will be prompted to enter a one-time code or send a push notification to your MFA device
  after entering your username and password.

  In addition, if you do not have MFA enabled on your account then you will not be able to login from off campus without using the VPN.

* Whether you want to use password-based authentication or 'public-key'-based authentication.

**Authentication requirements per cluster**:

+----------+---------------------------------------+---------------------------------------------------------------------------------------------------+
| Cluster  | From campus or via VPN                | From off campus and without a VPN connection                                                      |
+==========+=======================================+===================================================================================================+
| Bessemer | Password + MFA **or** public key      | Not permitted (unless using the :ref:`HPC SSH gateway service <hpcgw_summary>`)                   |
+----------+---------------------------------------+---------------------------------------------------------------------------------------------------+
| ShARC    | Password + MFA **or** public key      | Not permitted (unless using the :ref:`HPC SSH gateway service <hpcgw_summary>`)                   |
+----------+---------------------------------------+---------------------------------------------------------------------------------------------------+


SSH client software on Windows
------------------------------

Download and install the *Installer edition* of `MobaXterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_.

After starting MobaXterm you should see something like this:

.. image:: /images/mobaxterm-welcome.png
   :width: 100%
   :align: center

Create a session profile for your login for each cluster by clicking *Session* in the top left, and then *SSH*. 

Enter the details for the cluster in the *Remote host* box, either ``bessemer.shef.ac.uk`` or ``sharc.shef.ac.uk``. 
Then click the *Specify Username* checkmark and enter your username.
Please ensure that the checkmark for *X11 Forwarding* is ticked or GUI applications will be unable to open 
and that *Use SCP protocol* is also ticked then click *OK* to save your session profile.
You should add a session for each cluster.

You can now double click on this session profile to start connecting at which point you will be prompted for your username, password and then with a Duo MFA prompt.  
Please enter these details and your terminal will connect as shown below.

You **may** be asked to submit your username and password with a second MFA prompt in order for the file browser to work correctly. On a successful 
login you should be presented with a screen like the below:

.. image:: /images/mobaxterm-terminal.png
   :width: 100%
   :align: center

|br|
Running commands from a terminal (from the command-line) may initially be
unfamiliar to Windows users but this is the recommended approach for
running commands on Bessemer or ShARC as
it is the idiomatic way of interfacing with the Linux clusters.

SSH client software on Mac OS/X and Linux
-----------------------------------------

Linux and macOS (OS X) both typically come with a command-line SSH client pre-installed.

If you are using macOS and want to be able to run graphical applications on the clusters then
you need to install the latest version of the `XQuartz <https://www.xquartz.org/>`_ *X Windows server*.

Open a terminal (e.g. *Gnome Terminal* on Linux or *Terminal* on macOS) and then go to :ref:`ssh`.

.. _ssh:

Establishing a SSH connection
-----------------------------

Once you have a terminal open run the following command to
log in to a cluster: ::

    ssh -X $USER@$CLUSTER_NAME.shef.ac.uk

Here you need to:

* replace ``$USER`` with your IT Services username (e.g. ``te1st``)
* replace ``$CLUSTER_NAME`` with ``bessemer`` or ``sharc``.

.. note::

    **macOS users**: if this fails then:

    * Check that your `XQuartz <https://www.xquartz.org/>`_ is up to date then try again *or*
    * Try again with ``-Y`` instead of ``-X``

After typing in this command hit enter to start connecting at which point you will be prompted 
for your username, password and then with a Duo MFA prompt. 

This should give you a prompt resembling the one below: 

For the ShARC cluster
^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    [te1st@sharc-login1 ~]$

At this prompt type: 

.. code-block:: console

    qrshx

Like this: 

.. code-block:: console

    [te1st@sharc-login1 ~]$ qrshx


Which will start an interactive session, which supports graphical applications resembling the below: 

.. code-block:: console

    [te1st@sharc-node001 ~]$ 

For the Bessemer cluster
^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    [te1st@bessemer-login1 ~]$

At this prompt type: 

.. code-block:: console

    srun --pty bash -i

Like this: 

.. code-block:: console

    [te1st@bessemer-login1 ~]$ srun --pty bash -i


Which will start an interactive session, which supports graphical applications resembling the below: 

.. code-block:: console

    [te1st@bessemer-node001 ~]$ 



.. note::

    When you login to a cluster you reach one of two login nodes.
    You **should not** run applications on the login nodes.
    Running the interactive job command gives you an interactive terminal
    on one of the many worker nodes in the clusters.


---------

.. _hpcgw_summary:

What if I cannot use the VPN or I need a persistent long term connection
---------------------------------------------------------------------------

Direct SSH access to the HPC clusters from off campus is not possible without the use of VPN. However
if you are unable to use VPN we also provide an SSH gateway service to allow off-site SSH access to our HPC clusters.

.. note::
  * Access to the HPC SSH gateway service requires that you have an existing :ref:`HPC account <accounts>`.
  * You must additionally request access to the HPC SSH gateway by emailing `it-servicedesk@sheffield.ac.uk <it-servicedesk@sheffield.ac.uk>`_ including a justification for your request.
  * If the cluster access can be handled via the usage of the SSL VPN without undue effort, your request will not be granted.

For more information see :ref:`HPC Gateway Service Details <hpcgateway>`.



What Next?
----------

Now you have connected to a cluster,
you can look at how to submit jobs on the :ref:`job_submission_control` page or
look at the software installed on
:ref:`Bessemer <bessemer-software>` and
:ref:`ShARC <sharc-software>`
