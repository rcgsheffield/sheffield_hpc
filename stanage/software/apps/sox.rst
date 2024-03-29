.. _SoX_stanage:
.. |softwarename| replace:: SoX
.. |currentver| replace:: 14.4.2
.. |ebtoolchain| replace:: foss-2019b

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: http://sox.sourceforge.net/

|softwarename| is a cross-platform (Windows, Linux, MacOS X, etc.) command line utility that can convert various 
formats of computer audio files in to other formats. It can also apply various effects to these sound files, and, 
as an added bonus, SoX can play and record audio files on most platforms.

========

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load SoX/14.4.2-GCC-8.3.0

After this the |softwarename| command can be run from the terminal prompt with the ``sox`` command.

Further documentation on the usage of |softwarename| can be found at the following link: 
http://sox.sourceforge.net/Docs/Documentation

========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. SoX has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELSOX`` with a given module loaded.