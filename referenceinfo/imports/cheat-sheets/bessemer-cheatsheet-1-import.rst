.. table:: **CONNECTING TO THE CLUSTER AND TRANSFERRING FILES** 
   :align: left
   :widths: auto

   ======================================================================================    =======================================================================
   *ssh -X YOUR_USERNAME@bessemer.shef.ac.uk*                                                Connect - :ref:`Link<ssh>`
   *srun --pty bash -i*                                                                      Start an interactive session - :ref:`Link<submit_interactive_bessemer>`
   *scp /path/to/file.txt YOUR_USERNAME@bessemer.shef.ac.uk:/path/to/directory*              Upload  - :ref:`Link<transferring_files>`
   *scp YOUR_USERNAME@bessemer.shef.ac.uk:/path/to/file.txt /path/to/directory/*             Download file  - :ref:`Link<transferring_files>`
   *scp -r YOUR_USERNAME@bessemer.shef.ac.uk:/path/to/my_results /path/to/directory/*        Download directory  - :ref:`Link<transferring_files>`
   *rsync -avzP /path/to/directory/ YOUR_USERNAME@bessemer.shef.ac.uk:/path/to/directory*    Sync/transfer directory `Link<rsync>` 
   *wget https://software.github.io/program/files/myprogram.tar.gz*                          Download direct from website  - :ref:`Link<transferring_files>`
   *curl -O https://software.github.io/program/files/myprogram.tar.gz*                       Download direct from website  - :ref:`Link<transferring_files>`                                            
   ======================================================================================    =======================================================================

.. table:: **BATCH JOB SUBMISSION, MONITORING AND CONTROL**
   :align: left
   :widths: auto

   ===============================        =======================================================================================             
   *sbatch MY_SCRIPT.sh*                  Submit a batch job - :ref:`Link<submit_batch_bessemer>`
   *squeue -u $USER*                      Investigate jobs in queue (Running **R** and Pending **PD**) - :ref:`Link<squeue>`
   *sstat -j 1234567*                     Investigate running job - :ref:`Link<sstat>`
   *sacct -j 1234567*                     Investigate historical job - :ref:`Link<sacct>`
   *scancel 1234567*                      Cancel a job - :ref:`Link<scancel>`
   *scontrol <action> 1234567*            Control a job (*hold/release*) - :ref:`Link<scontrol>`
   *salloc*                               Allocate resources to an interactive job  - :ref:`Link<salloc>`                        
   *srun*                                 Start a task inside a job  - :ref:`Link<srun>`
   ===============================        =======================================================================================           

.. table:: **PARTITION INFORMATION**
   :align: left
   :widths: auto

   ==========================    ==========================================
   *sinfo*                       Node and partition information  - :ref:`Link<sinfo>`
   **CPU nodes**                 192GB Memory/node; 40 cores/node; 168 hrs
   **GPU nodes**                 32GB Memory/GPU; 40 cores/node; 168 hrs
   Free queues                   **Limit** 1 node per job
   Private nodes                 May have different specifications - :ref:`Link<groupnodes_bessemer>`
   ==========================    ==========================================

.. table:: **WHERE'S MY DATA AND BACKUPS?** - :ref:`Link<filestore>`
   :widths: auto
   
   ==========================================      =======================================
   */home/$USER/*                                  Home (backed up)
   */mnt/fastdata/$USER/*                          Fastdata (not backed up)
   */home/$USER/.snapshot*                         Home snapshot (every 4hrs*10, 24hrs*7)
   ==========================================      =======================================

.. table:: **MODULES (ACTIVATING SOFTWARE)** - :ref:`Link<env_modules>`
   :widths: auto
   
   ==========================================      =======================================
   *module avail*                                  List available modules
   *module avail |& grep -i somename*              Find a module
   *module load <class>/<name>/<version>*          Load a module
   *module unload <class>/<name>/<version>*        Unload a module
   *module list*                                   List loaded modules
   *module purge*                                  Unload all modules
   ==========================================      =======================================
