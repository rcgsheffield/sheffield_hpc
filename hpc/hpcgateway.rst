
.. _hpcgateway:

HPC Gateway Service
=====================

.. caution::

  The HPC Gateway service :underline-bold:`is not required to access the Stanage cluster, or any Sheffield University HPC clusters`. Use of a
  `VPN connection <https://www.sheffield.ac.uk/it-services/vpn>`_ is the recommended method to use for off-site SSH access to the HPC clusters.

  Access to the HPC clusters via the HPC gateway service  will only be granted to users who are unable use the VPN with a valid reason.

Service description
-------------------

The HPC Gateway service is provided to give access to the Sheffield University HPC clusters from off campus where usage of the VPN is not possible.
This access is provided by a SSH gateway server which is configured to function as a SSH ‘jump host’ only. :underline-bold:`It only allows SSH jump host connections to the HPC clusters.`

:underline-bold:`It cannot:`

* Access HPC filestores directly.
* Access research shared areas directly.
* Allow connections to other IT Services or departmental servers.
* Run an interactive SSH terminal session on the gateway server. 




Access conditions
-----------------

* Access to the HPC SSH gateway service requires that you have an existing :ref:`HPC account <accounts>`.
* Access requests for the HPC SSH gateway service require a **valid justification**. If usage of the SSL VPN without undue effort is possible for HPC access, your request will be denied. 
* Access to the HPC SSH gateway service is on a case by case basis, upon request, via emailing `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`_.


Overview of the connection process
----------------------------------

.. image:: /images/hpcgateway-sequence-diag.png
  :width: 75%
  :align: center



Specific usage examples
-----------------------

* Access a HPC cluster via SSH: 

.. tabs::

   .. group-tab:: Stanage

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@stanage.shef.ac.uk
        
   .. group-tab:: Bessemer

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@bessemer.shef.ac.uk

   .. group-tab:: ShARC

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@sharc.shef.ac.uk


* Transfer a file using SCP: 

.. code-block:: console

    scp -J [username]@hpcgw.shef.ac.uk [source path] [destination path]

* Transfer files using Rsync: 

.. code-block:: console

    rsync -av -e 'ssh -J [username]@hpcgw.shef.ac.uk' [source path] [destination path]


* Using WinSCP: 

.. code-block:: console

    New Session -> Advanced -> Connection -> Tunnel
    Select 'Connect through SSH tunnel'
    Hostname: 'hpcgw.shef.ac.uk'
    Port number: '22'

.. image:: /images/SSHgatewayWinSCP.png
   :width: 75%
   :align: center

* Configure MobaXterm: ::

    Edit 'Session Settings':
    Set 'SSH Use 2-factor authentication for SSH gateways'

.. image:: /images/SSHgatewayMobaXtermSettings.png
   :width: 75%
   :align: center

* Create a new session using MobaXterm: ::

    Select 'Network settings' tab within SSH Session settings
    Select 'Connect through SSH gateway (jump host)
    Gateway SSH server: 'hpcgw.shef.ac.uk'
    Port: '22'

.. image:: /images/SSHgatewayMobaXtermSession.png
   :width: 75%
   :align: center

* When prompted to enter your Duo two-factor code either input a 6 digit code from your Duo device or enter '1' for a push notification to be sent to your device.
