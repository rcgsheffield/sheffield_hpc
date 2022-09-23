.. _maple_sharc:

Maple
=====

.. sidebar:: Maple

   :Latest Version:  2022
   :URL: http://www.maplesoft.com/products/maple/

Scientific Computing and Visualisation

Interactive Usage
-----------------
After connecting to sharc (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` command.

The latest version of Maple (currently 2022) is made available with the command ::

        module load apps/maple

Alternatively, you can load a specific version with ::

        module load apps/maple/2022/binary

You can then run the graphical version of Maple by entering ``xmaple`` or the command line version by entering ``maple``.

Batch usage
-----------
It is not possible to run Maple worksheets in batch mode. Instead, you must convert your worksheet to a pure text file that contains a set of maple input commands. You can do this in Maple by opening your worksheet and clicking on **File->Export As->Maple Input**. The result will have the file extension .mpl

An example Sun Grid Engine submission script that makes use of a .mpl file called, for example, **mycode.mpl** is ::

    #!/bin/bash
    # Request 4 gigabytes of real memory
    #$ -l rmem=4G

    module load apps/maple/2022

    maple < mycode.mpl

For general information on how to submit batch jobs refer to :ref:`submit_batch_sharc`.

Tutorials
---------
* `High Performance Computing with Maple <https://rse.shef.ac.uk/blog/hpc-maple-1/>`_ A tutorial from the Sheffield Research Software Engineering group on how to use Maple in a High Performance Computing environment

Installation notes
------------------
These are primarily for administrators of the system.

**Maple 2022**

* Run the installer **Maple2022.1LinuxX64Installer.run** and follow instructions.
* Choose Install folder `/usr/local/packages/apps/maple/2022/binary`
* Do not configure MATLAB
* Choose a network license. Details on IT Services internal wiki.
* Uncheck 'Enable periodic checking for Maple 2022 updates'
* Check 'Check for updates now'

The module file is :download:`/usr/local/modulefiles/apps/maple/2022/binary </sharc/software/modulefiles/apps/maple/2022/binary>`.

