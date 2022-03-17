
Display your own jobs queued on the system 

.. code-block:: console

    $ qstat

Show a specific running or queueing job's details:

.. code-block:: sh

    qstat -j jobid

Display all jobs queued on the system 

.. code-block:: console

    $ qstat -u "*"

Display all jobs queued by the username foo1bar 

.. code-block:: console

    $ qstat -u foo1bar

Display all jobs in the openmp parallel environment 

.. code-block:: console

    $ qstat -pe openmp

Display all jobs in the queue named foobar 

.. code-block:: console

    $ qstat -q foobar.q

**Example output:**

.. include:: /referenceinfo/imports/scheduler/SGE/qstat_example_output_import.rst

**SGE Job States:**

.. include:: /referenceinfo/imports/scheduler/SGE/SGE_job_state_codes_import.rst


