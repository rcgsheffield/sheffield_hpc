.. _PLUMED_bessemer:
.. |softwarename| replace:: PLUMED
.. |currentver| replace:: 2.6.2
.. |ebtoolchain| replace:: intel-2020b

|softwarename|
==========================================================================================================

.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: https://www.plumed.org/

|softwarename| is an open-source, community-developed library that provides a wide range of different 
methods, which include:

* enhanced-sampling algorithms
* free-energy methods
* tools to analyze the vast amounts of data produced by molecular dynamics (MD) simulations.

These techniques can be used in combination with a large toolbox of collective variables that describe 
complex processes in physics, chemistry, material science, and biology.

========

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load PLUMED/2.6.2-intel-2020b

After this the |softwarename| command can be run from the terminal prompt with the ``plumed`` command.

Further documentation on the usage of |softwarename| can be found at the following link: 
https://www.plumed.org/doc-v2.6/user-doc/html/index.html

========

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 2.6.2 was installed using Easybuild 4.4.0, build details can be found 
in ``/usr/local/packages/live/eb/PLUMED/2.6.2-intel-2020b/easybuild``