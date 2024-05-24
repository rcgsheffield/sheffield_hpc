.. _mfa:

Tips for working with MFA
=========================

Here are some techniques you can use to reduce the number of times that you need to reauthenticate to our HPC systems.

.. include:: /referenceinfo/imports/staying_connected.rst


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
