.. table:: **CONNECTING TO THE CLUSTER AND TRANSFERRING FILES** 
   :align: left
   :widths: auto

   ==========================================================================      =========================================================================
   *ssh -X $USER@$CLUSTER_NAME.shef.ac.uk*                                          Connect - :ref:`Link<ssh>`
   *qrshx*                                                                          Start an interactive session - :ref:`Link<submit_interactive_sharc>`
   *scp /home/user/file.txt $USER@$CLUSTER_NAME.shef.ac.uk:/home/$USER*             Upload  - :ref:`Link<transferring_files>`
   *scp $USER@$CLUSTER_NAME.shef.ac.uk:/home/$USER/file.txt /home/user/*            Download file  - :ref:`Link<transferring_files>`
   *scp -r $USER@$CLUSTER_NAME.shef.ac.uk:/home/$USER/my_results /home/user/*       Download directory  - :ref:`Link<transferring_files>`
   *wget https://software.github.io/program/files/myprogram.tar.gz*                 Download direct from website  - :ref:`Link<transferring_files>`
   *curl -O https://software.github.io/program/files/myprogram.tar.gz*              Download direct from website  - :ref:`Link<transferring_files>`                                            
   ==========================================================================      =========================================================================



.. table:: **BATCH JOB SUBMISSION, MONITORING AND CONTROL**
   :align: left
   :widths: auto

   ===============================        =======================================================================================             
   *qsub MY_SCRIPT.sh*                    Submit a batch job - :ref:`Link<submit_batch_sharc>`
   *qstat*                                Investigate own jobs in queue (**q** queueing, **r** running, **w** waiting, *h* on hold) - :ref:`Link<qstat>`
   *qstat -j 1234567*                     Investigate running job - :ref:`Link<qstat>`
   *qacct -j 1234567*                     Investigate historical job - :ref:`Link<qacct>`
   *qdel 1234567*                         Cancel a job - :ref:`Link<qdel>`
   *qhold* or *qrelease 1234567*          Control a job
   ===============================        =======================================================================================           


.. table:: **PARTITION INFORMATION**
   :align: left
   :widths: auto
   
   ==========================    ==========================================
   *qhost*                       Node and partition information  - :ref:`Link<qhost>`
   **CPU nodes**                 64GB Memory/node, 16 cores/node 96 hrs - :ref:`Link<sharc-specs>`
   **GPU nodes**                 12GB Memory/GPU, 16 cores/node 96 hrs
   **Hvis node**                 128GB Memory/node, 16 cores/node 96 hrs
   ==========================    ==========================================


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

.. table:: **WHERE'S MY DATA AND BACKUPS?** - :ref:`Link<filestore>`
   :widths: auto
   
   ==========================================      =======================================
   */home/$USER/*                                  Home (backed up)
   */data/$USER/*                                  Data (backed up)
   */mnt/fastdata/cs1cdk*                          Fastdata (not backed up)
   *cd /home/$USER/.snapshot*                      Home snapshot (every 4hrs*10, 24hrs*7)
   *cd /data/$USER/.snapshot*                      Data snapshot (every 4hrs*10, 24hrs*7)
   ==========================================      =======================================

 
.. tip:: 

    You can find more information about each command with the :ref:`man<man_pages>` command. i.e *man <command>*