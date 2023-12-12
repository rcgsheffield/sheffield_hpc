.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. |softwarename| replace:: ncdu
.. |currentver| replace:: 1.15.1

.. _ncdu_sharc:

|softwarename|
==========================================================================================================


.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: Base OS provided.
   :URL: https://dev.yorhel.nl/ncdu

|softwarename| is a disk usage analyzer with an ncurses interface. It is designed to find space hogs on a remote server where you don’t have an entire graphical setup available.
Ncdu aims to be fast, simple and easy to use, and should be able to run in any minimal POSIX-like environment with ncurses installed.

--------

Interactive usage
-----------------

After connecting to ShARC (see :ref:`ssh`), start an :ref:`interactive graphical session <submit_interactive_sharc>` 
with the ``qrshx`` command.

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load utils/ncdu/1.15.1/binary


After this any of the |softwarename| commands can be run from the terminal prompt. The available 
commands can be obtained using:

.. code-block:: console

	$ ncdu --help

|softwarename| is an excellent tool for determining what files and folders are consuming your storage 
quota in the file storage areas. The example command below instructs ncdu to scan your home 
directory and will then show an interactive summary of storage usage by file and folder.

.. code-block:: console

   $ ncdu $HOME

Screenshots of the program in use can be found on the following page: https://dev.yorhel.nl/ncdu/scr

--------

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 1.15.1 was installed using provided binaries at https://dev.yorhel.nl/download/ (ncdu-linux-x86_64-1.15.1.tar.gz).


--------

Testing
^^^^^^^

Testing has been conducted by running an interactive session and scanning a directory with success.

--------

Modulefiles
^^^^^^^^^^^

The module file is on the system at 
:download:`/usr/local/modulefiles/utils/ncdu/1.15.1/binary </decommissioned/sharc/software/modulefiles/utils/ncdu/1.15.1/binary>`.


