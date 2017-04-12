.. _queued_running:

Queued and running jobs
=======================

Getting an overview
-------------------

To determine what jobs are either (a) submitted and are in queues waiting to be run or (b) are currently executing you can run the ``qstat`` program on a login or worker node.

Let's look at an example: ::

        [cs1wf@node007 ~]$ qstat -u cs1wf
        job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
        -----------------------------------------------------------------------------------------------------------------
          32761 0.00050 QRLOGIN    cs1wf        r     12/22/2016 11:36:04 interactive.q@node062.iceberg.     1        
          32764 0.00050 QRLOGIN    cs1wf        r     12/22/2016 11:36:16 shortint.q@node007.iceberg.she     1        
          32771 0.00050 mympijob   cs1wf        r     12/22/2016 11:41:13 parallel.q@node126.iceberg.she     4        
          32777 0.00050 mytaskarr  cs1wf        r     12/22/2016 11:44:54 short.q@node168.iceberg.shef.a     1 1
          32777 0.00050 mytaskarr  cs1wf        r     12/22/2016 11:44:54 short.q@node194.iceberg.shef.a     1 2
          32777 0.00050 mytaskarr  cs1wf        r     12/22/2016 11:44:54 short.q@node180.iceberg.shef.a     1 3
          32777 0.00050 mytaskarr  cs1wf        r     12/22/2016 11:44:54 short.q@node140.iceberg.shef.a     1 4
          32768 0.00050 mybigmemjo cs1wf        qw    12/22/2016 11:39:25                                    4        
          32777 0.00000 mytaskarr  cs1wf        qw    12/22/2016 11:44:47                                    1 5-50:1

Here we can see the state of the queued and running batch and interactive jobs that were submitted by the user ``cs1wf``.  Each line contains information about either:

- a single job 
- a task belonging to a *task array* job (see :ref:`parallel_jobarray`)

The displayed fields are: 

job-ID
  Uniquely identifies a queued or running job.  Useful for deleting the job **XREF** or retrieving information about it from the accounting database after its finished/aborted **XREF**.  It is also useful to quote this in support queries;
prior   
  Priority of the job;
name       
  Name of the job.  It is often useful to specify a name for a job when you submit it (by supplying ``-N somename`` to the scheduler).  As you can see, the default name of interactive jobs (those started with ``qrsh``/``qsh``/``qrshx``) is ``QRLOGIN``.
user         
  The user that submitted the job;
state 
  The current state of the job, which can be ``r`` for *running*, ``qw`` for queued and waiting to be run or ``d`` for in the process of being deleted.  Run ``man qstat`` for details of other state codes;
submit/start at     
  When the job was submitted or started;
queue                          
  Which queue the job is running in.  Users should only rarely need to explicitly submit to specific queues; typically the queue is chosen by the scheduler based on the resources requested by the user and/or the special *projects* the user is involved with.  Note that the queue name contains the hostname of the main process of the job (but doesn't show you multiple hostnames for MPI jobs);
slots 
  The number of CPU cores requested by the user.  Here you can see that both ``mybigmemjob`` (which I know to be an OpenMP job) and ``mympijob`` (an MPI job) both requested 4 cores;
ja-task-ID 
  The task ID of a task array job.  Above you can see five lines for job 32777, which is a task array of 50 tasks.  The first four of these lines relate to running tasks.  The last of these lines relates to the set of outstanding (queued) tasks (tasks 5 to 50).  The ``ja-task-ID`` field will be blank for normal single-task jobs.

If you have no queuing or running jobs then ``qstat -u $USER`` won't show any output.

.. _qtop:

qtop: an alternative view
-------------------------

``qtop`` is a scheduler command that provides a summary of all processes running on the cluster for a given user.  It is **only available on the worker nodes**. As such, you need to start an interactive session on a worker node using :ref:`qrsh` or :ref:`qrshx` in order to use it.

To give a summary of all of your currently running jobs ::

    qtop

    Summary for job 256127

        HOST      VIRTUAL-MEM       RSS-MEM    %CPU    %MEM    CPUTIME+   COMMAND
    testnode03      106.22 MB        1.79 MB     0.0     0.0     00:00:00 bash
    testnode03      105.62 MB        1.27 MB     0.0     0.0     00:00:00 qtop
    testnode03       57.86 MB        3.30 MB     0.0     0.0     00:00:00 ssh
                    ---------       --------
        TOTAL:        0.26 GB        0.01 GB

More detail about one job
-------------------------

What if you want more information on a particular job?  You might want to know:

* How much information did you request for that job?  
* Did you request a GPU?  
* How much memory has it used so far?

Let's inspect the state of ``mybigmemjob`` (job 32768 in `Getting an overview`_) more closely.  We can do this using: ::

        qstat -j 32768 

Here ``qstat -j``  generates lots of output so you may want to *pipe it to a pager* (e.g. ``qstat -j 32768 | less``) to display a screen's worth at a time.

Here's the output, certain verbose sections have been deliberately replaced with the text ``<trimmed>``: ::

	job_number:                 32768
	exec_file:                  job_scripts/32768
	submission_time:            Thu Dec 22 11:39:25 2016
	owner:                      cs1wf
	uid:                        131937
	group:                      cs
	gid:                        1000
	sge_o_home:                 /home/cs1wf
	sge_o_log_name:             cs1wf
	sge_o_path:                 /usr/local/bin/:/usr/lib64/qt-3.3/bin:/usr/local/sge/live/bin/lx-amd64:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/cs1wf/bin
	sge_o_shell:                /bin/bash
	sge_o_workdir:              /home/cs1wf
	sge_o_host:                 node007
	account:                    sge
	cwd:                        /home/cs1wf
	reserve:                    y
	hard resource_list:         h_vmem=64G
	mail_list:                  sge@sge.iceberg.shef.ac.uk,will@sheffield.ac.uk
	notify:                     FALSE
	job_name:                   mybigmemjob
	jobshare:                   0
	env_list:                   TERM=xterm,MANPATH=/usr/share/man:<trimmed>
	script_file:                mybigjob.sge
	parallel environment:  openmp range: 4
	project:                    SHEFFIELD
	binding:                    set linear:slots
	job_type:                   NONE
	scheduling info:            queue instance "openmp-int.q@testnode08.iceberg.shef.ac.uk" dropped because it is temporarily not available
				    queue instance "insigneo-imsb.q@node106.iceberg.shef.ac.uk" dropped because it is temporarily not available
	<trimmed>

Interesting fields:

cwd
  The current working directory of the job;
hard resource_list
  The resources explicitly requested by the user.  Here 64GB of virtual memory (``h_vmem``) was requested **per core** (memory and GPUs are always requested on a per-core basis).  Tip: if you see ``h_rss`` in this list then this is a request for *real* memory made using ``-l rmem=xG``.  Requests for GPUs, particular CPU/GPU architectures and run-time limits will also appear here;
mail_list
  Which email addresses will be notified of events
env_list
  The environment the job has started / will start with.  Tip: if this contains something like ``DISPLAY=iceberg-login1:20.0`` for an interactive job then the graphical programs run from that job should be able to display on user's screens (if they enabled X forwarding when connecting to the cluster);
script_file: 
  The name of the script used to submit the job;
parallel environment  
  The type of parallel environment used (OpenMP, MPI or none) plus the number of '*slots*' (cores) requested);
scheduling info: 
  A list of queues that cannot be used to run the job, along with reasons.

For a **running job** ``qstat -j $JOB_ID`` will also print a line like this (or multiple lines for a task array job): ::

	usage         1:            cpu=00:00:00, mem=0.00000 GB s, io=0.00199 GB, vmem=1.723M, maxvmem=1.723M

This is the resource utilisation so far.  

- ``mem`` is the *integrated* memory usage in gigabyte seconds, not the maximum instantaneous usage; 
- ``io`` is the amount of data read from/written to devices such as disks and network devices.  If this figure is unexpectedly high and performance is poor then this could be due to the available real memory being too small relative to the available virtual memory and the operating system doing lots of paging.
- ``vmem`` and ``maxvmem`` give you the instantaneous and maximum virtual memory usage.  The second of these figures could be useful for determining if your program is likely to run out of memory and be killed before it finishes.

.. tip::
    
    Closely monitoring jobs isn't often necessary.  You typically want to know when the job started, when it finished/failed and how much resources (time and virtual memory) it used whilst running.  The simplest way to get such information is to enable email notifications (see :ref:`sge-batch`) when you submit your job.
