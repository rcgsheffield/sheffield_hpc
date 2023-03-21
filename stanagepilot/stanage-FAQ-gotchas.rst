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

Poor performance with OpenMPI 4.1 and above
-------------------------------------------

Current installations of OpenMPI 4.1 and above have poor performance over Omnipath which is still under investigation. 
These versions of OpenMPI will be in use for the ``foss-2021`` and above Easybuild toolchains.


Shared (project) directories
----------------------------

Shared project storage areas are not yet available on the Stanage cluster.