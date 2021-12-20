The ``squeue`` command is used to pull up information about jobs in the queue, by default this 
command will list the job ID, partition, username, job status, number of nodes, and name of nodes 
for all jobs queued or running within SLURM. 

To limit this command to only display a single user's jobs the ``--user`` flag can be used: 

.. code-block:: console

  $ squeue --user=$USER

Further information without abbreviation can be shown by using the ``--long`` flag: 

.. code-block:: console

  $ squeue --user=$USER --long

The ``squeue`` command also provides a method to calculate the estimated start time for a job by 
using the ``--start`` flag: 

.. code-block:: console

  $ squeue --user=$USER --start

When checking the status of a job you may wish to check for updates at a time interval. This can 
be achieved by using the ``--iterate`` flag and a number of seconds: 

.. code-block:: console

  $ squeue --user=$USER --start --iterate=n_seconds

You can stop this command by pressing ``Ctrl + C``.