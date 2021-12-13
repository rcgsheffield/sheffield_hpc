.. _qacct:

qacct
======

``qacct`` is a scheduler command used to display accounting data for all jobs and job steps in 
the SGE job accounting file / SGE accounting database.

Documentation
-------------

Documentation is available on the system using the command::

    man qacct

Usage
-----

The ``qacct`` command can be used to display status information about a user's historical 
jobs.

Running the ``qacct``  command alone will provide a summary of used resources from the current month 
for the user running the command.

The command can be used as follows with the job's ID to get job specific info: ::

    qacct -j job-id

Or to view information about all of a specific user's jobs: ::

    qacct -j -u $USER

Important metrics listed for your jobs are detailed in the table below: 

.. list-table:: qacct property variable names and descriptions
   :widths: 50 50
   :header-rows: 1

   * - Variable
     - Description
   * - qname
     - The queue the job ran in.
   * - hostname
     - The hostname of the node used as the master.
   * - owner
     - The username of the person who ran the job.
   * - jobname
     - The name of the job.
   * - jobnumber
     - The Job ID number.
   * - taskid
     - The taskid of the job if a task array job.
   * - granted_pe
     - The parallel environment the job ran in.
   * - slots
     - The number of cores used for the job.
   * - failed
     - A binary value indicating whether the program or script ran in the job exited normally or in and error state.
   * - exit_status
     - The exit status or code given by the submission script when it finished executing.
   * - ru_wallclock
     - The wallclock time of the job (i.e. if you looked at a clock on the wall and noted how long the job took.)
   * - maxvmem
     - The maximum memory used during the job.
   * - category
     - Contains the submission arguments used for ``qsub``.
   * - io
     - The amount of read / write to or from storage areas.
   * - iow
     - The amount of time the job was waiting for io, i.e.waiting for a storage to be read from or wrtten to.


By default the ``qacct`` command will only bring up summary info about the user's jobs from the 
current accounting file (which rotates monthly). By using the ``-f AcctFilePath`` flag and the 
accounting file path of interest, previous months usage can be quantified e.g. : ::

    qacct -u $USER -f $SGE_ROOT/default/common/accounting-archive/accounting-20210101

By using bash ``xargs`` and ``find`` you can also parse multiple files to list jobs as follows: ::

    find $SGE_ROOT/default/common/accounting-archive/ -mtime -90 -type f | xargs -t -n1 qacct -j -u $USER -f

This command is instructing the linux ``find`` executable to look for files younger than 60 days and 
then ``xargs`` passes the accounting files it finds to the qacct command (in bold.)

Like previous ``qacct`` commands the ``-j`` flag can once again take a job ID to pull up a specific 
job's details.

