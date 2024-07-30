.. _connecting:

Connecting to a cluster using SSH
=================================


.. hint::

    Usernames to connect with all HPC services will be the same as those you use to login to MUSE :underline-bold:`not` the prefix on your email address.


The most versatile way to **run commands and submit jobs** on one of the clusters is to
use a mechanism called `SSH <https://en.wikipedia.org/wiki/Secure_Shell>`__,
which is a common way of remotely logging in to computers
running the Linux operating system.

To connect to another machine using SSH you need to
have a SSH *client* program installed on your machine.
macOS and Linux come with a command-line (text-only) SSH client pre-installed.
On Windows there are various SSH clients you can use,
including *Windows Terminal*.

.. warning::

    The `University Connect for China (UCC) <https://www.sheffield.ac.uk/it-services/university-connect-china>`_ is not the same service as the SSL VPN service and will not grant access to the HPC clusters.
    Users of the UCC must disconnect the UCC and connect to the SSL VPN in order to connect to the HPC clusters.


.. warning::

    Eduroam no longer grants direct access to the clusters. If using Eduroam, you must keep the  `VPN <https://www.sheffield.ac.uk/it-services/vpn>`_ 
    connected at all times while using the clusters.

Valid methods of connecting to the University clusters using SSH (or the related protocols SCP and SFTP) include:

* Connecting while in a campus building using wired ethernet;
* Connecting while on campus using Eduroam or off campus *after* `establishing a VPN connection (required) <https://www.sheffield.ac.uk/it-services/vpn>`_;
* Connecting while off campus without a VPN connection using the HPC SSH gateway.


Connecting using a password or SSH public key authentication will determine whether Multifactor Authentication (MFA) will be mandatory during the login process.
The authentication requirements per cluster are summarised below: 

+----------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+
| Cluster  | From campus or via VPN                               | From off campus and without a VPN connection                                                      |
+==========+======================================================+===================================================================================================+
| Bessemer | Password + DUO MFA **or** public key                 | Not permitted (unless using the :ref:`HPC SSH gateway service <hpcgw_summary>`)                   |
+----------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+
| Stanage  | Password/public key + TOTP MFA **or** VPN + password | Not permitted (unless using the :ref:`HPC SSH gateway service <hpcgw_summary>`)                   |
+----------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+

.. hint::

    On our Stanage cluster: VPN + Password is needed to setup :ref:`TOTP MFA <mfa-totp-reference-info>`.


Connecting with a Password or SSH keys
---------------------------------------

.. tabs:: 
    
    .. tab:: With a Password 
        If connecting using your password, MFA will be mandatory. Depending on the cluster, the type of MFA
        may be standard University `DUO MFA <https://sites.google.com/sheffield.ac.uk/mfa/home>`__, or :ref:`TOTP MFA <mfa-totp-reference-info>`.

        .. tabs::

            .. group-tab:: Stanage

                On the Stanage cluster, when you connect you will be prompted for your password and a verification code. 
                Enter your password and the current TOTP code for your verification code. This process should look like the following in a terminal:

                .. code-block:: console

                    ssh te1st@stanage.shef.ac.uk
                    Password: 
                    Verification code: 
                    Last login: Wed Apr 12 17:09:24 2023 from r.x.y.z
                    *****************************************************************************
                    *                           Stanage HPC cluster                             *
                    *                       The University Of Sheffield                         *
                    *                       https://docs.hpc.shef.ac.uk                         *
                    *                                                                           *
                    *               Unauthorised use of this system is prohibited.              *
                    *****************************************************************************
                    [te1st@login1 [stanage] ~]$

                If you have not setup your Stanage TOTP MFA, please follow the steps published at: :ref:`stanage-totp-setup`
            
            .. group-tab:: Bessemer

                On the Bessemer cluster, when you connect you will be prompted to via a push notification to your DUO device to approve access 
                or must enter a one-time code from your University provided hardware token which is associated with your DUO account.

                .. code-block:: console

                    ssh te1st@bessemer.shef.ac.uk
                    Password: 
                    Verification code: 
                    Last login: Wed Apr 12 17:09:24 2023 from r.x.y.z
                    *****************************************************************************
                    *                           Bessemer HPC cluster                             *
                    *                       The University Of Sheffield                         *
                    *                       https://docs.hpc.shef.ac.uk                         *
                    *                                                                           *
                    *               Unauthorised use of this system is prohibited.              *
                    *****************************************************************************
                    [te1st@bessemer-login1 ~]$

                If you have not setup your University DUO MFA, please follow the steps published at: https://www.sheffield.ac.uk/it-services/mfa/set-mfa

            
            In addition, if you do not have MFA enabled on your account then you will not be able to login from off campus without using the VPN.

    .. tab::  With SSH keys

        If connecting using SSH public keys, the following policy applies around their use:

            :underline-bold:`Policy on the use of SSH public key authentication:`
                                  
            * All access to TUOS HPC systems via SSH public/private keypairs should use private keys that were encrypted with a passphrase :underline-bold:`at creation time`.
            * All SSH private keys used to access TUOS HPC systems must be never be decrypted and stored as plaintext :underline-bold:`on any computer, at any time`.
            * Public key access should be from single-user machines (not shared machines) without good reason.
            * SSH agent forwarding should not be used without good reason.
            * Unencrypted private keys should not be stored on TUOS HPC systems.

        To discuss exceptions to this policy please contact research-it@sheffield.ac.uk


.. _ssh:

Establishing a SSH connection
-----------------------------

.. Hint::

    Usernames to connect with all HPC services will be the same as those you use to login to MUSE :underline-bold:`not` the prefix on your email address.


Once you have a terminal open run the following command to
log in to a cluster:

.. tabs::

    .. tab:: Windows/Linux

        .. code-block:: console

            ssh -X YOUR_USERNAME@CLUSTER_NAME.shef.ac.uk

    .. tab:: macOS

        .. code-block:: console
        
            ssh -X YOUR_USERNAME@CLUSTER_NAME.shef.ac.uk

        .. note::

            If this fails then:

            * Check that your `XQuartz <https://www.xquartz.org/>`_ is up to date then try again *or*
            * Try again with ``-Y`` instead of ``-X``

Here you need to:

* replace ``YOUR_USERNAME`` with your IT Services username (e.g. ``te1st``)
* replace ``CLUSTER_NAME`` with ``stanage`` or ``bessemer``.


After typing in this command hit enter to start connecting at which point you will be prompted 
for your username, password and then with a Duo or TOTP MFA prompt. 

This should give you a session resembling the one below: 


.. tabs::

  .. group-tab:: Stanage

    .. code-block:: console

        [te1st@login1 [stanage] ~]$

    At this prompt if you would like an interactive session you can type:

    .. code-block:: console

        srun --pty bash -i

    Like this: 

    .. code-block:: console

        [te1st@login1 [stanage] ~]$ srun --pty bash -i


    Which will start an interactive session, which supports graphical applications resembling the below: 

    .. code-block:: console

        [te1st@node001 [stanage] ~]$

  .. group-tab:: Bessemer

    .. code-block:: console

        [te1st@bessemer-login1 ~]$

    At this prompt if you would like an interactive session you can type:

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
    Running the interactive job command, ``srun --pty bash -i`` (Stanage & Bessemer), gives you an interactive terminal
    on one of the many worker nodes in the clusters.
    
Running commands from a terminal (from the command-line) may initially be
unfamiliar to Windows users but this is the recommended approach for
running commands on Sheffield HPC clusters as
it is the idiomatic way of interfacing with the Linux clusters.

Suggested SSH clients
---------------------

SSH client software on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We recommend the use of Windows Terminal on Windows systems and users will find Windows Terminal available on the University's managed desktops by default.

- :ref:`Setting up Profiles in Windows Terminal <terminal_connecting_profile_setup>`.

For personal systems you can download and install the *Installer edition* of `MobaXterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_.

- :ref:`Setting up Profiles in MobaXterm <mobaxterm_connecting_profile_setup>`.

SSH client software on Mac OS/X and Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Linux and macOS (OS X) both typically come with a command-line SSH client pre-installed.

If you are using macOS and want to be able to run graphical applications on the clusters then
you need to install the latest version of the `XQuartz <https://www.xquartz.org/>`_ *X Windows server*.

Open a terminal (e.g. *Gnome Terminal* on Linux or *Terminal* on macOS) and then go to :ref:`ssh`.


---------

.. _hpcgw_summary:

What if I cannot use the VPN or I need a persistent long term connection
---------------------------------------------------------------------------

Direct SSH access to the HPC clusters from off campus is not possible without the use of VPN. However
if you are unable to use VPN we also provide an SSH gateway service to allow off-site SSH access to our HPC clusters.

.. note::
  * Access to the HPC SSH gateway service requires that you have an existing :ref:`HPC account <accounts>`.
  * You must additionally request access to the HPC SSH gateway by emailing `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`_ including a justification for your request.
  * If the cluster access can be handled via the usage of the SSL VPN without undue effort, your request will not be granted.

For more information see :ref:`HPC Gateway Service Details <hpcgateway>`.



What Next?
----------

Now you have connected to a cluster,
you can look at how to submit jobs on the :ref:`job_submission_control` page or
look at the software installed on
:ref:`Stanage <stanage-software>` and :ref:`Bessemer <bessemer-software>`. 
