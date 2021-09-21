.. _scancel:

scancel
=======

``scancel`` is a scheduler command that cancels a SLURM job.

Documentation
-------------

Documentation is available on the system using the command::

    man scancel

Usage
-----

Sometimes you may need to stop a job while it’s running. You can accomplish this 
with the ``scancel`` command and the job's ID: ::

    scancel job-id

To cancel multiple jobs you can supply a comma separated list: ::

    scancel job-id1, job-id2, job-id3

 