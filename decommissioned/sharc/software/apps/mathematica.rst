.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Mathematica
===========

.. sidebar:: Wolfram Mathematica

   :Dependencies: None
   :URL: http://www.wolfram.com/mathematica/
   :Latest version: 12.0.0

Mathematica is a technical computing environment and programming language with strong symbolic and numerical abilities.

Single Core Interactive Usage
-----------------------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with ``qrshx``.

Mathematica can be loaded with ::

        module load apps/mathematica/12.0.0/binary

Mathematica can then be started with the ``mathematica`` command ::

        mathematica

Multicore Interactive Usage
---------------------------
Mathematica has extensive parallel functionality. To use it, you should request a parallel interactive session. For example, to request 4 cores ::

    qrshx -pe smp 2

Load and launch Mathematica ::

    module load apps/mathematica/12.0.0/binary
    mathematica

In Mathematica, time how long it takes to calculate the first 20 million primes on 1 CPU core ::

    AbsoluteTiming[primelist = Table[Prime[k], {k, 1, 20000000}];]

Now, let's launch 2 ParallelKernels and redo the calculation in parallel ::

    LaunchKernels[2]
    AbsoluteTiming[primelist =
    ParallelTable[Prime[k], {k, 1, 20000000},
    Method -> "CoarsestGrained"];]

This illustrates a couple of points:-

* You should always request the same number of kernels as you requested in your ``qrshx`` command (in this case, 2).
* N kernels doesn't always translate to N times faster.

Batch Submission
----------------
Unfortunately, it is not possible to run Mathematica notebook .nb files directly in batch.  Instead, you need to create a simple text file that contains all of the Mathematica commands you want to execute.  Typically, such files are given the extension .m.  Let’s run the following simple Mathematica script as a batch job. ::

  (*Find out what version of Mathematica this machine is running*)
  Print["Mathematica version is " <> $Version]

  (*Find out the name of the machine we are running on*)
  Print["The machine name is " <> $MachineName]

  (*Do a calculation*)
  Print["The result of the integral is "]
  Print [ Integrate[Sin[x]^2, x]]

Copy and paste the above into a text file called `very_simple_mathematica.m`

An example batch submission script for this file is ::

  #!/bin/bash
  # Request 4 gigabytes of real memory
  #$ -l rmem=4G

  module load apps/mathematica/12.0.0/binary

  math -script very_simple_mathematica.m

Copy and paste the above into a file called `run_job.sh` and submit with ::

  qsub run_job.sh

Once the job has successfully completed, the output will be in a file named like `run_job.sh.o396699`. The number at the end refers to the job-ID given to this job by the system and will be different for you. The contents of this file is ::

  more run_job.sh.o396699

  Mathematica version is 10.2.0 for Linux x86 (64-bit) (July 28, 2015)
  The machine name is node131
  The result of the integral is
  x/2 - Sin[2*x]/4

Installation notes
------------------
These are primarily for administrators of the system. 
Download the Mathematica package, Mathematica_12.0.0_LINUX.sh, from Wolfram.

**For Version 12.0.0** ::

    mkdir -p /usr/local/packages/apps/mathematica/12.0.0/binary
    chmod +x ./Mathematica_12.0.0_LINUX.sh
    ./Mathematica_12.0.0_LINUX.sh

The installer is interactive. Here's the session output ::

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                       Wolfram Mathematica 12 Installer
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  Copyright (c) 1988-2019 Wolfram Research, Inc. All rights reserved.

  WARNING: Wolfram Mathematica is protected by copyright law and international treaties. Unauthorized reproduction or distribution may result in severe civil and criminal penalties and will be
  prosecuted to the maximum extent possible under law.

  Enter the installation directory, or press ENTER to select /usr/local/Wolfram/Mathematica/12.0.0:
  > /usr/local/packages/apps/mathematica/12.0.0/binary

  Now installing...

  Installation complete.


Remove the ``playerpass`` file ::

  rm /usr/local/packages/apps/mathematica/12.0.0/binary/Configuration/Licensing/playerpass

Install the University network license ``mathpass`` file at ``/usr/local/packages6/apps/mathematica/12.0.0/Configuration/Licensing``. Mathpass contains the following ::

  !mathlm.sheffield.ac.uk

Modulefiles
-----------
* The :download:`12.0.0 module file </decommissioned/sharc/software/modulefiles/apps/mathematica/12.0.0/binary>`.

