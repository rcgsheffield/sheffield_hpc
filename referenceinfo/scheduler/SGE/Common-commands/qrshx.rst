.. _qrshx:

qrshx
=====

``qrshx`` is a scheduler command that requests an interactive session on a worker node. The resulting session will support graphical applications. You will usually run this command from a login node.

Examples
--------
Request an interactive X-Windows session that provides the default amount of memory resources and launch the ``gedit`` text editor: 

.. code-block:: console

    [te1st@sharc-login1 ~]$ qrshx
    [te1st@sharc-node001 ~]$ gedit

Request an interactive X-Windows session that provides 10 Gigabytes of real memory and launch the latest version of MATLAB: 

.. code-block:: console

    [te1st@sharc-login1 ~]$ qrshx -l rmem=10G
    [te1st@sharc-node001 ~]$ module load apps/matlab
    [te1st@sharc-node001 ~]$ matlab

Request an interactive X-Windows session that provides 10 Gigabytes of real memory and 4 CPU cores: 

.. code-block:: console

    [te1st@sharc-login1 ~]$ qrshx -l rmem=10G -pe openmp 4

Sysadmin notes
--------------
``qrshx`` not a standard SGE command; it was specific to the University of Sheffield's clusters.

On ShARC ``qrshx`` resides at ``/usr/local/scripts/qrshx`` and has `this content <https://gist.github.com/willfurnass/10277756070c4f374e6149a281324841>`_.
