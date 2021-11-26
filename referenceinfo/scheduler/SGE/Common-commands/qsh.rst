.. _qsh:

qsh
===

``qsh`` is a scheduler command that requests an interactive X-windows session on a worker node. The resulting terminal is not user-friendly and we recommend that you use our :ref:`qrshx` command instead.

Examples
--------
Request an interactive X-Windows session that provides the default amount of memory resources 

.. code-block:: console
    
    [te1st@sharc-login1 ~]$ qsh

Request an interactive X-Windows session that provides 10 Gigabytes of real memory 

.. code-block:: console

    [te1st@sharc-login1 ~]$ qsh -l rmem=10G 

Request an interactive X-Windows session that provides 10 Gigabytes of real memory and 4 CPU cores 

.. code-block:: console

   [te1st@sharc-login1 ~]$ qsh -l rmem=10G  -pe openmp 4
