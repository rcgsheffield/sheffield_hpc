.. _qstat:

qstat
=====

``qstat`` is a scheduler command that displays the status of the queues.

Examples
--------
Display all jobs queued on the system ::

    qstat

Display all jobs queued by the username foo1bar ::

    qstat -u foo1bar

Display all jobs in the openmp parallel environment ::

    qstat -pe openmp

Display all jobs in the queue named foobar ::

    qstat -q foobar.q
