.. _bclr:

bclr
====

.. sidebar:: bclr

   :Latest version: UNKNOWN
   :URL: http://crd.lbl.gov/departments/computer-science/CLaSS/research/BLCR/

Future Technologies Group researchers are developing a hybrid kernel/user implementation of checkpoint/restart. Their goal is to provide a robust, production quality implementation that checkpoints a wide range of applications, without requiring changes to be made to application code. This work focuses on checkpointing parallel applications that communicate through MPI, and on compatibility with the software suite produced by the SciDAC Scalable Systems Software ISIC. This work is broken down into 4 main areas:

Usage
-----
BCLR was installed before we started using the module system. As such, it is currently always available to worker nodes. It should be considered experimental.

The checkpointing is performed at the kernel level, so any batch code should be checkpointable without modification (it may not work with our MPI environment though... although it should cope with SMP codes).

To run a code, use ::

    cr_run ./executable

To checkpoint a process with process id PID ::

    cr_checkpoint -f checkpoint.file PID

Use the --term flag if you want to checkpoint and kill the process

To restart the process from a checkpoint ::

    cr_restart checkpoint.file

Using with SGE in batch
-----------------------
A checkpoint environment has been setup called BLCR An example of a checkpointing job would look something like ::

    #!/bin/bash
    #$ -l h_rt=168:00:00
    #$ -c sx
    #$ -ckpt blcr
    cr_run ./executable >> output.file

The `-c sx` options tells SGE to checkpoint if the queue is suspended, or if the execution daemon is killed. You can also specify checkpoints to occur after a given time period.

A checkpoint file will be produced before the job is terminated.  This file will be called `checkpoint.[jobid].[pid]`.  This file will contain the complete in-memory state of your program at the time that it terminates, so make sure that you have enough disk space to save the file.

To resume a checkpointed job submit a job file which looks like ::

  #!/bin/bash
  #$ -l h_rt=168:00:00
  #$ -c sx
  #$ -ckpt blcr
  cr_restart [name of checkpoint file]

Installation notes
------------------
Installation notes are not available
