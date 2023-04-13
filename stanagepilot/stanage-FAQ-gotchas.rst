.. _stanage-FAQ-gotchas:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

FAQ and Gotchas
===============

This section contains the answers to and frequently asked questions about the pilot usage phase of the Stanage 
cluster as well as any significant deviations from expected behaviour from previous University of Sheffield HPC clusters.

Connection to Stanage requires the VPN
--------------------------------------

A connection to the Sheffield SSL VPN must be active at all times (including on campus access from devices on wired ethernet) 
in order to use Stanage. This may change in future, possibly during the pilot phase.


DUO authentication
------------------

As DUO authentication is not yet fully implemented on Stanage, users should be aware that where you may normally be prompted by DUO 
MFA this may not occur. This may change in future, possibly during the pilot phase.

Poor performance with OpenMPI 4.1.1
-----------------------------------

Current installations of OpenMPI 4.1.1 have poor performance over Omnipath which is still under investigation. 
These versions of OpenMPI will be in use for the ``foss-2021`` Easybuild toolchain.


Shared (project) directories
----------------------------

Shared project storage areas are not yet available on the Stanage cluster.

Resetting Stanage TOTP multifactor authentication  
-------------------------------------------------

If you need to add your TOTP multifactor authentication to another phone you can show your QR Code again by logging into the cluster and running the commands: ::

    flight start
    flight mfa show

If you need to reset your TOTP multifactor authentication as you have lost a device which had the TOTP account on it, you can generate a new seed key and matching QR code with: ::

    flight start
    flight mfa generate --force

