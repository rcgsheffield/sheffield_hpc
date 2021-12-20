
The ``qacct`` command can be used to display status information about a user's historical 
jobs.

Running the ``qacct``  command alone will provide a summary of used resources from the current month 
for the user running the command.

The command can be used as follows with the job's ID to get job specific info: 

.. code-block:: console

    $ qacct -j job-id

Or to view information about all of a specific user's jobs: 

.. code-block:: console

    $ qacct -j -u $USER
