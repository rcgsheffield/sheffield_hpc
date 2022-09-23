
.. list-table:: 
   :widths: 25 75
   :header-rows: 1

   * - Reason Code  
     - Explanation       
   * - Priority
     - One or more higher priority jobs is in queue for running. Your job will eventually run.
   * - Dependency
     - This job is waiting for a dependent job to complete and will run afterwards.
   * - Resources
     - The job is waiting for resources to become available and will eventually run.
   * - InvalidAccount
     - The job’s account is invalid. Cancel the job and rerun with correct account. 
   * - InvaldQoS
     - The job’s QoS is invalid. Cancel the job and rerun with correct account.
   * - QOSGrpMaxJobsLimit
     - Maximum number of jobs for your job’s QoS have been met; job will run eventually.
   * - PartitionMaxJobsLimit
     - Maximum number of jobs for your job’s partition have been met; job will run eventually.
   * - AssociationMaxJobsLimit
     - Maximum number of jobs for your job’s association have been met; job will run eventually.
   * - JobLaunchFailure
     - The job could not be launched. This may be due to a file system problem, invalid program name, etc. 
   * - NonZeroExitCode
     - The job terminated with a non-zero exit code. 
   * - SystemFailure
     - Failure of the Slurm system, a file system, the network, etc. 
   * - TimeLimit
     - The job exhausted its time limit. 
   * - WaitingForScheduling
     - No reason has been set for this job yet. Waiting for the scheduler to determine the appropriate reason.
   * - BadConstraints
     - The job's constraints can not be satisfied. 


