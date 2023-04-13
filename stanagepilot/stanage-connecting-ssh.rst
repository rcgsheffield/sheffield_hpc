.. _stanage-connecting-ssh:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Connecting with SSH
===================

The Stanage cluster has slightly different SSH configuration compared to other University of Sheffield HPC clusters: 

* When making direct SSH connections :underline-bold:`without the VPN connected` Stanage makes use of :ref:`TOTP multifactor authentication <mfa-totp-reference-info>` rather than the more commonly used DUO multifactor authentication.

* When connecting to Stanage via SSH :underline-bold:`with the VPN connected`, no further multifactor authentication will be required as connecting with the VPN already required.


Users are :underline-bold:`strongly encouraged to connect to the Stanage cluster without the VPN connected while on campus using a wired connection` as this will provide a quicker more direct connection. 

Users should only make use of the VPN when their connectivity :underline-bold:`is not` provided by a wired connection in a campus building.

The following section describes the two different methods for connecting with SSH to the Stanage cluster, with or without VPN.

.. Hint::

    Usernames to connect with all HPC services will be the same as those you use to login to MUSE :underline-bold:`not` the prefix on your email address.

.. tabs::

   .. group-tab:: Connecting using SSH without VPN

        .. include:: /referenceinfo/imports/mfa/setup-stanage-totp.rst

        

   .. group-tab:: Connecting using SSH with VPN

        First `setup and connect to the SSL VPN <https://students.sheffield.ac.uk/it-services/get-connected/vpn#set-up-and-connect-to-vpn>`_.

        Now connect with a client of choice or via the command line: ::

            ssh -X $USER@stanage.shef.ac.uk

        .. include:: /referenceinfo/imports/stanage/ssh-host-keys.rst


You can now launch an interactive session on Stanage using the following command: ::

    srun --mem=XXG --pty bash -i

where XX is the memory request for the session (default is 2Gb).



