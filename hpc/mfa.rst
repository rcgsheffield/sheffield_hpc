.. _mfa:

Tips for working with MFA
=========================

Here are some techniques you can use to reduce the number of times that you need to reauthenticate to our HPC systems.  

Reuse SSH connections
---------------------

Many SSH clients can reuse existing SSH sessions for new connections without the need to reconnect.  Some 
clients also allow sessions to persist temporarily after you have closed all your terminal windows to allow
you to easily reconnect for a short time without having to reauthenticate.

SSH clients
^^^^^^^^^^^

SSH has a built in functionality to reuse existing connections for new sessions.  You can enable this feature by adding the following config
to your `~/.ssh/config` file on your local PC:

.. tabs::

   .. group-tab:: Stanage
      .. code-block:: bash

        Host stanage.shef.ac.uk
        ControlMaster auto
        ControlPath ~/.ssh/sockets/%r@%h-%p
        ControlPersist 600

   .. group-tab:: Bessemer
      .. code-block:: bash

        Host bessemer.shef.ac.uk
        ControlMaster auto
        ControlPath ~/.ssh/sockets/%r@%h-%p
        ControlPersist 600

 

You will need to create the directory ``~/.ssh/sockets`` before running ssh.  The ``ControlPersist`` option allows you to specify how long (in seconds) your SSH connection
should persist after you have closed all your existing sessions.  During this time you can start a new session without re-authenticating.

.. danger::

    If you configure your SSH client to maintain connections ensure that your client PC is kept locked whenever
    you leave it unattended.  

.. warning::

    If you are temporarily disconnected from the network you may find that your SSH session does not immediately detect the failure.  You can delete the
    control socket created in `~/.ssh/sockets` in order to clear the session and reconnect.  You should not use this option when running SSH commands on remote systems.



Putty
^^^^^
You can configure Putty to ``Share SSH connections if possible`` via the ``SSH`` option in the ``Connection Category`` when configuring a new connection.

As long as your existing connection remains active you can start new sessions without re-authenticating by using ``Duplicate Session`` command to start new sessions.

Other applications which use Putty for SSH connections can also re-use your existing connection without needing to reauthenticate.


.. warning::

    If you perform a large file transfer over a shared session you may find that other sessions sharing the same connection become less responsive.


TMUX/screen
-----------

`TMUX <https://github.com/tmux/tmux/wiki>`_ and `screen <https://www.gnu.org/software/screen/manual/screen.html>`_ are available on the HPC login nodes and 
can be used to run multiple shell sessions within a single SSH session. 

For examples of using TMUX to manage multiple sessions see the following RSE blog post: `tmux: remote terminal management and multiplexing <https://rse.shef.ac.uk/blog/tmux-intro/>`_ 
 

Transferring files
------------------

If you need to transfer data from your local PC to a research shared directory you can directly access the data from your local PC without using MFA, instead of transferring 
the files via the HPC.  

For more info on how to do this see our `Research Storage documentation <https://www.sheffield.ac.uk/it-services/research-storage/using-research-storage>`_ .
