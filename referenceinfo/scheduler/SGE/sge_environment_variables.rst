.. _common-sge-env-vars:

Common SGE environment variables
================================

.. list-table:: Common SGE Environment Variables
   :widths: 50 50
   :header-rows: 1

   * - Variable
     - Description
   * - $SGE_O_WORKDIR
     - The path of the job submission directory.
   * - $SGE_O_HOST 
     - Contains the hostname of the node used for job submission.
   * - $SGE_O_HOME
     - The path to the home directory of the job owner on the host from which the job was submitted.
   * - $SGE_O_PATH
     - The content of the PATH environment variable in the context of the job submission command.
   * - $SGE_O_WORKDIR
     - The working directory of the job submission command.
   * - $SGE_TASK_ID 
     - The task identifier in the array job represented by this task.
   * - $PE_HOSTFILE 
     - The path of a file that contains the definition (list) of the nodes that is assigned to a parallel job by the grid engine system
   * - $PE
     - The parallel environment under which the job runs. This variable is for parallel jobs only.
   * - $JOB_NAME
     - The job name, which is built from the file name provided with the ``qsub`` command, a period, and the digits of the job ID.
   * - $NHOSTS
     - The number of hosts in use by a parallel job.
   * - $NSLOTS
     - The number of queue slots (cores) in use by a parallel job.
   * - $SHELL
     - The user's login shell as taken from the passwd file.
   * - $JOB_ID
     - The job ID for the submitted job.
	
A full list of environment variables for SGE can be found by `visiting the SGE page on
environment variables <https://docs.oracle.com/cd/E19957-01/820-0699/chp4-21/index.html>`_.