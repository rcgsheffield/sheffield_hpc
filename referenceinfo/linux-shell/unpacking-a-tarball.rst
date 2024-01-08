.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Unpacking a tarball
"""""""""""""""""""

Unpacking a tarball is straightforward and is achieved using the tar command. Typically tarballs will be 
compressed with either GZip (``tar.gz``) or BZip (``tar.bz2``) and can be decompressed into the current 
directory by using the matching tar command arguments.

For GZip compression the format of this command is: 

.. code-block:: console

    [user@node004 [stanage] tarpackages]$ tar -xzf mytarball.tar.gz

For BZip compression the format of this command is: 

.. code-block:: console

    [user@node004 [stanage] tarpackages]$ tar -xjf mytarball.tar.bz2

No example of this process is shown as the commands do not have terminal output unless there is an error.