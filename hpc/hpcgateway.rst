
.. _hpcgateway:

HPC Gateway Service
=====================

Direct SSH access to the HPC clusters from off campus is not possible without the use of VPN. However
if you are unable to use VPN we also provide an SSH gateway service to allow off-site SSH access to our HPC clusters.

.. note::

  Use of a `VPN connection <https://www.sheffield.ac.uk/it-services/vpn>`_ is the recommended method to use for off-site SSH access to the HPC clusters.


.. note::
  * Access to the HPC SSH gateway service requires that you have an existing :ref:`HPC account <accounts>`.
  * You must additionally request access to the HPC SSH gateway by emailing `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`_ including a justification for your request.
  * If the cluster access can be handled via the usage of the SSL VPN without undue effort, your request will not be granted.

The SSH gateway server, ``hpcgw.shef.ac.uk``, is configured to be a SSH 'jump host' only:
it does not have direct access to HPC filestore or Research Shared areas, and
you cannot run an interactive SSH terminal session directly on the gateway server.
Additionally the HPC gateway server only allow access to the HPC clusters;
you cannot access any other IT Services or departmental servers using this gateway.

Overview of the connection process
----------------------------------

.. image:: /images/hpcgateway-sequence-diag.png
  :width: 75%
  :align: center



Specific usage examples
-----------------------

* Access a HPC cluster via SSH: 

.. tabs::

   .. group-tab:: ShARC

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@sharc.shef.ac.uk

   .. group-tab:: Bessemer

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@bessemer.shef.ac.uk

   .. group-tab:: Stanage

    .. code-block:: console

        ssh -J [username]@hpcgw.shef.ac.uk [username]@stanage.shef.ac.uk

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
