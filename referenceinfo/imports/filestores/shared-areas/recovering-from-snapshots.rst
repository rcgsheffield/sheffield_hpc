Recovering files from snapshots
--------------------------------

.. tabs::

   .. group-tab:: Stanage

    Recovery of files and folders on Stanage is not possible as the Stanage cluster does not currently have snapshots or backups.

    If you need help, please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__.
   
   .. group-tab:: Bessemer

    :ref:`home_dir` and :ref:`shared_dir` are regularly :term:`snapshotted <Snapshotted storage>`.
    See above for details of the snapshot schedules per area.
    A subset of snapshots can be accessed by HPC users from the HPC systems themselves
    by *explicitly* browsing to hidden directories e.g.

    +--------------------------------------------------+----------------------------------+
    | Storage area                                     | Parent directory of snapshots    |
    +==================================================+==================================+
    | :ref:`Home directory <home_dir>`                 | ``$HOME/.snapshot``              |
    +--------------------------------------------------+----------------------------------+
    | A :ref:`Shared (project) directory <shared_dir>` | ``/shared/myproject1/.snapshot`` |
    +--------------------------------------------------+----------------------------------+

    From within per-snapshot directories you can access (read-only) copies of files/directories.
    This allows you to attempt recover any files you might have accidentally modified or deleted recently.

    Note that ``.snapshot`` directories are not visible when listing all hidden items within their parent directories
    (e.g. using ``ls -a $HOME``): 
    you need to explicitly ``cd`` into ``.snapshot`` directories to see/access them.

    If you need help, please contact `research-it@sheffield.ac.uk <research-it@sheffield.ac.uk>`__.