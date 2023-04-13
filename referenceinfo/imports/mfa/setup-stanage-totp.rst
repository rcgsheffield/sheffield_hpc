To connect without VPN, you must first setup TOTP multifactor authentication on the cluster. To do so you must first connect with the VPN to run the setup steps below (see the other tab).

Log into Stanage and run the following setup steps for TOTP multifactor authentication :underline-bold:`on a login node`: ::

    flight start
    flight mfa generate

This will generate a QR Code: 

.. figure:: /images/mfa/totp_console_qr_code_mfa-screenshot_1.png
   :width: 50%
   :align: center
   :alt: Example generated TOTP QR Code.

   Example generated TOTP QR Code.


This can be scanned with your DUO app or any Authenticator app which supports TOTP. We recommend that you use the DUO app and you can scan the QR code via the **"Add"** account and **"Use QR Code"** buttons in the DUO app as shown below:

.. figure:: /images/mfa/duo_mfa-screenshot_1.png
   :width: 50%
   :align: center
   :alt: Screenshots of account adding process for the TOTP accounts via QR Code scanning.

   Screenshots of account adding process for the TOTP accounts via QR Code scanning.

Make sure when adding the new account to the DUO app that you name it sensibly, e.g. 'Stanage - My Username'.

Now you can disconnect the VPN and connect to Stanage normally. 

.. include:: /referenceinfo/imports/stanage/ssh-host-keys.rst

When you connect you will be prompted for your password and a verification code. Enter your password and the current TOTP code for your verification code. 
This process should look like the following in a terminal: 

.. code-block:: console

    ssh test@stanage.shef.ac.uk
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
    [test@login1 [stanage] ~]$

    