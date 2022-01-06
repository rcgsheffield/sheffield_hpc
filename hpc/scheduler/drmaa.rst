.. _drmaa:

DRMAA
=====

The Distributed Resource Management Application API (DRMAA) is a specification for 
**programatically submitting/controlling jobs** to/on job scheduling software 
such as the :ref:`Grid Engine <submit_interactive_sharc>` software used on 
the :ref:`sharc` cluster.  

Support for DRMAA is built in to Grid Engine and other scheduling software such as Torque, PBS, HTCondor and SLURM.

There are DRMAA `bindings <https://en.wikipedia.org/wiki/Language_binding>`_ (i.e. wrappers) available for several programming languages.

Why is it useful?
-----------------

Using DRMAA you may find it easier to automate the submission and control of jobs.  

Also, you might want to use a Computational Pipeline manager (such as `Ruffus <http://www.ruffus.org.uk/>`_) to run sets of related (possibly dependent) jobs on a cluster; these may use DRMAA beind the scenes to create and manage jobs.

Using DRMAA from Python
-----------------------

Install DRMAA bindings
^^^^^^^^^^^^^^^^^^^^^^

The `Python bindings for DRMAA <http://drmaa-python.readthedocs.io/en/latest/>`_ are compatible with Python 2 and Python 3.
The simplest way to install them is to use a :ref:`conda environment <sharc-python-conda>` e.g. 

.. code-block:: bash

        # Connect to ShARC
        ssh sharc  
        # Start an interactive session
        qrshx  
        # Ensure conda is available
        module load apps/python/conda  
        # Create a conda environment
        conda create -n drmaa-test-sharc python=3.6  
        # Activate this environment
        source activate drmaa-test-sharc  
        # Install the python bindings for DRMAA
        pip install drmaa  

Submitting a job 
^^^^^^^^^^^^^^^^

You can then submit a job using a script like this:

.. literalinclude:: drmaa_submit_job.py
   :name: drmaa-example-py
   :caption: drmaa_submit_job.py
   :language: python
   :linenos:

where ``myjob.sh`` is:

.. code-block:: bash

        #!/bin/bash 
        echo "Hello from ${JOB_ID}. I received these arguments: $1, $2"

To actually submit the job: ::
    
    $ # Make your job script executable
    $ chmod +x myjob.sh

    $ python drmaa_submit_job.py
    Creating a job template
    Job 401022 submitted
    Cleaning up

    $ cat myjob.sh.o401022 
    Hello from 401022. I received these arguments: alpha, beta

You can submit multiple jobs iteratively, reusing your DRMAA job template for efficiency.

If you want to submit a :ref:`job array <parallel_jobarray>` rather than a single job then you can call the `runBulkJob method instead of runJob <http://drmaa-python.readthedocs.io/en/latest/tutorials.html#running-a-job>`_.

.. warning::
    Starting a single DRMAA session then attempting to submit jobs from different Python threads `currently does not work <https://github.com/pygridtools/drmaa-python/issues/44>`_.

Email notifications
^^^^^^^^^^^^^^^^^^^

You can enable email notifications for jobs finishing or aborting by setting two attributes of your ``JobTemplate`` object (``jt`` in :ref:`this example <drmaa-example-py>`):

.. code-block:: python

     jt.blockEmail = False
     jt.email = ['a.person@sheffield.ac.uk']

This is equivalent to having the following in a Grid Engine batch job submission script:

.. code-block:: bash

    #$ -m ea
    #$ -M a.person@sheffield.ac.uk

Other useful job template attributes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Requesting arbitrary resources from Grid Engine such as real memory (``rmem``), parallel environments (e.g. ``-pe mpi``), run time (``h_rt``), Grid Engine Projects e.g. ::

       jt.nativeSpecification = '-l h_rt=00:30:00 -l rmem=2G -pe smp 2'

* Set the paths to the job standard output and error files: ::

       jt.outputPath = os.path.join(os.getcwd(), 'output.log')
       jt.errorPath = os.path.join(os.getcwd(), 'error.log')

* Send standard output and error to the same file: ::

       jt.joinFiles = True

* Name your job (equivalent to ``-N my_job`` in a Grid Engine batch job submission script): ::

       jt.jobName = 'my_job'

* Set one or more environment variables in your job using a Python `dictionary <https://docs.python.org/3/tutorial/datastructures.html#dictionaries>`_: ::

       jt.jobEnvironment = {'SOMEKEY': 'somevalue', 'ANOTHERKEY', 'anothervalue'}

.. warning::
    You cannot presently request one or more **GPUs** using DRMAA without explicitly using the ``gpu`` Grid Engine Project i.e. 
    jobs created using a Job Template ``jt`` where ``jt.nativeSpecification = '-l gpu=1'`` will be rejected by the job scheduler 
    but jobs with ``jt.nativeSpecification = '-P gpu -l gpu=1'`` will be accepted.
    This is due to a `bug in the scheduler <https://arc.liv.ac.uk/trac/SGE/ticket/1342>`_.

Waiting on jobs
^^^^^^^^^^^^^^^

Within a DRMAA Session you can wait indefinitely or forever for one, several or all submitted jobs to complete.  See the `documentation <http://drmaa-python.readthedocs.io/en/latest/tutorials.html#waiting-for-a-job>`__ for more information including an example.  Jobs are identified by (Grid Engine) job ID, so they do not need to have been submitted by DRMAA.

Controlling jobs
^^^^^^^^^^^^^^^^

Within a DRMAA Session you can also terminate, suspend, resume, hold and release a job.  See the `documentation <http://drmaa-python.readthedocs.io/en/latest/tutorials.html#controlling-a-job>`__ for more information including an example.  Again, jobs are identified by (Grid Engine) job ID, so they do not need to have been submitted by DRMAA.

Checking the status of a job
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Within a DRMAA Session you can check to see if any job is queuing, running, has completed successfully, has failed or is in some other state.  See the `documentation <http://drmaa-python.readthedocs.io/en/latest/tutorials.html#getting-job-status>`__ for more information including an example.  

Futher information
^^^^^^^^^^^^^^^^^^

See the `documentation <http://drmaa-python.readthedocs.io/en/latest/>`__ for the DRMAA Python bindings; you may find the enclosed `reference information <http://drmaa-python.readthedocs.io/en/latest/drmaa.html>`_ useful.  Note that not all features of these bindings are described in this documentation!

Java bindings
-------------

Java bindings for DRMAA are not currently available on :ref:`sharc`.

Administrator notes
-------------------

Grid Engine's implementation of the DRMAA shared library lives at ``$SGE_ROOT/lib/lx-amd64/libdrmaa.so``.

It is discovered by bindings using the ``DRMAA_LIBRARY_PATH`` environment variable, 
which is set to the above for all users using a shell script in ``/etc/profile.d/``.

