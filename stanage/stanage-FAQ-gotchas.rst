.. _stanage-FAQ-gotchas:

Stanage FAQ and Gotchas
=======================

This section contains important information about the usage of the Stanage cluster and any significant changes
from expected behaviour on previous University of Sheffield HPC clusters.

-----

Your first connection to Stanage requires the VPN
-------------------------------------------------

Connections to the Stanage cluster without the VPN enabled require the use of :ref:`TOTP MFA <stanage-totp-setup>`. As this requires setup, your first 
connection to the cluster must take place with the VPN connected (**including on campus access from devices on wired ethernet**).

Click on the following link for the instructions to set up: :ref:`TOTP MFA <stanage-totp-setup>`.

-----

Resetting Stanage TOTP multifactor authentication  
-------------------------------------------------

If you need to add your TOTP multifactor authentication to another phone you can show your QR Code again by logging into the cluster and running the commands: ::

    flight start
    flight mfa show

If you need to reset your TOTP multifactor authentication as you have lost a device which had the TOTP account on it, you can generate a new seed key and matching QR code with: ::

    flight start
    flight mfa generate --force

-----

DUO authentication
------------------

As DUO authentication is not yet implemented on Stanage, users should be aware that where you may normally be prompted by DUO 
MFA this may not occur. This may change in future however the current MFA in use is :ref:`TOTP based <stanage-totp-setup>`. 

-----

Graphical applications
----------------------

At present, we only provide very limited support for running graphical sessions on Stanage.
At this point in time we recommend that users needing graphical access to Stanage use ShARC or Bessemer instead. 
Mechanisms for facilitating graphical access to Stanage are in development.

-----

Poor performance with OpenMPI 4.1.1
-----------------------------------

Current installations of OpenMPI 4.1.1 have poor performance over Omnipath which is still under investigation. 
These versions of OpenMPI will be in use for the ``foss-2021`` Easybuild toolchain and should be avoided.

-----

Shared research area directories
--------------------------------

Shared research areas are available on the Stanage cluster :underline-bold:`upon request`. For details on this please see our page on :ref:`shared_dir`.



