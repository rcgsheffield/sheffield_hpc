.. _ssh_keys:

SSH keys
========

.. warning::

    Please note this is recommended for advanced users only. It is important to **store your SSH keys securely and use passphrases** for added protection. 
    Failure to do so could compromise the security of your account and data. It is because of this why we recommend SSH keys only be used by advanced users,
    who understand the risks and take appropriate measures to secure your SSH keys, such as using **strong passphrases** and secure storage of their keys. 

Generating SSH keys
===================
 
1. On your local machine(laptop/desktop) open a terminal and generate SSH Key pair using the following command:

.. code-block:: bash
    
    ssh-keygen -t rsa -b 4096 -C "<your_email>@<Something>.com"


This should produce a similarout put to below showing where the keys are to be stored and also asking you to enter a passphrase for your keys. **Do not create keys with out a passhphrase**. We can detect this on the HPC and a penalty to your account will be administered

.. code-block:: bash

    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/demo/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:

2. Once the keys have been succesfully created, we need to copy the public key to the HPC. Your public key is the file with the extension ``.pub``

.. code-block:: bash

    scp Path/To/File/id_rsa.pub <your user name>@<ClusterName>.sheffiled.ac.uk:~/.ssh/authorized_keys

3. Add SSH private Key to mobaXterm or SSH-Agent on your local machine. This will vary based on your operating system and whether you are using a GUI ssh client like mobaxterm or ssh on a terminal.

+------------------------------------------------------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+
| Operating System                                     | MobaXterm                                            | SSH Agent                                                                                         |
+======================================================+======================================================+===================================================================================================+
| Windows                                              | Yes                                                  |  Yes                                                                                              |
+------------------------------------------------------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+
| Mac                                                  | No                                                   |  Yes                                                                                              |
+------------------------------------------------------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+
| Linux                                                | No                                                   |  Yes                                                                                              |
+------------------------------------------------------+------------------------------------------------------+---------------------------------------------------------------------------------------------------+



.. tabs::

    .. tab:: MobaXTerm

        For users on windows using mobaxterm you can simply add your private key to any of the profiles you have setted up as shown in the image below. This will open a file explorer window that will allow you to select your private key.

        .. image:: /images/mobaxterm-PrivateSSHKey-setup.png

    .. tab:: SSH-Agent

        Check that you have ssh agent installed and running with the following command.

        .. tabs::

            .. tab:: Windows

                .. code-block:: console

                    tasklist | findstr ssh-agent        

            .. tab:: Mac 

                .. code-block:: console
                    
                    ps aux | grep ssh-agent       

            .. tab:: Linux 

                .. code-block:: console
                    
                    ps aux | grep ssh-agent

        If SSH-Agent is installed and running, you can add the private key with the following command.

        .. code-block:: console
                    
            ssh-add /path/to/private_key/<private_key_filename>

        If SSH-Agent is not installed please follow any relevant guides to install or enable it.
                    

    .. tab:: SSH
        This should work on any operating a system. Just open a teminal and type the following command , making the necesarry edits to add the path of your private key.

        .. code-block:: console
        
            ssh -i /path/to/private_key/<private_key_filename> $YourUsername@$CLUSTER_NAME.shef.ac.uk