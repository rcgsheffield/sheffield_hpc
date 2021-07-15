Bedtools
========

.. sidebar:: Bedtools

   :Versions:  2.29.2
   :Dependencies: GCC/9.3.0, XZ/5.2.5-GCCcore-9.3.0, zlib/1.2.11-GCCcore-9.3.0, bzip2/1.0.8-GCCcore-9.3.0, BamTools/2.5.1-GCC-9.3.0
   :URL: https://bedtools.readthedocs.org/en/latest/

Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks.

Interactive usage
-----------------
After connecting to Bessemer (see :ref:`ssh`),  start an interactive session with the :code:`srun --pty bash -i` command.

The latest version of bedtools (currently version 2.29.2) is made available with the command:

.. code-block:: none

        module load BEDTools/2.29.2-GCC-9.3.0


After this any of the bedtools commands can be run from the prompt.



Installation notes
------------------
Bedtools was installed using Easybuild 4.3.1, build details can be found in ``/usr/local/packages/live/eb/BEDTools/2.29.2-GCC-9.3.0/easybuild/``


Testing
-------
See: https://github.com/rcgsheffield/sheffield_hpc/issues/1157

Modulefile
----------
The module file is on the system at :download:`/usr/local/modulefiles/live/eb/all/BEDTools/2.29.2-GCC-9.3.0 </bessemer/software/modulefiles/BEDTools/2.29.2-GCC-9.3.0>`.
