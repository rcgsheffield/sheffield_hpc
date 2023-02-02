
================================    ================================    ========================
User Commands                       SGE                                 SLURM 
================================    ================================    ========================
Interactive login                   qrshx                                srun -\-pty bash -i 
Job submission                      qsub [script_file]                  sbatch [script_file] 
Job deletion                        qdel [job_id]                       scancel [job_id] 
Job status by job                   qstat [-j job_id]                   squeue [job_id] 
Job status by user                  qstat [-u user_name]                squeue -u [user_name] 
Job hold                            qhold [job_id]                      scontrol hold [job_id] 
Job release                         qrls [job_id]                       scontrol release [job_id] 
Queue list                          qconf -sql                          squeue 
List nodes                          qhost                               sinfo -N OR scontrol show nodes 
Cluster status                      qhost -q                            sinfo 
GUI                                 qmon                                sview       
**Environmental variables**
------------------------------------------------------------------------------------------------                               
Job ID                              $JOB_ID                             $SLURM_JOBID 
Submit directory                    $SGE_O_WORKDIR                      $SLURM_SUBMIT_DIR 
Submit host                         $SGE_O_HOST                         $SLURM_SUBMIT_HOST 
Node list                           $PE_HOSTFILE                        $SLURM_JOB_NODELIST 
Job Array Index                     $SGE_TASK_ID                        $SLURM_ARRAY_TASK_ID  
**Parallel environmental variables set by schedulers**     
------------------------------------------------------------------------------------------------    
Job ID                              $JOB_ID                             $SLURM_JOB_ID 
Number of cores                     $NSLOTS                             $SLURM_NPROCS 
**Job Specification**
------------------------------------------------------------------------------------------------                   
Script directive                    #$                                  #SBATCH 
queue/partition                     -q [queue/partition]                -p [queue/partition] 
count of nodes                      N/A                                 -N [min[-max]] 
CPU count                           -pe [PE] [count]                    -c [count(cpus-per-task)] 
Wall clock limit                    -l h_rt=[seconds]                   -t [min] OR -t [days-hh:mm:ss] 
Standard out file                   -o [file_name]                      -o [file_name] 
Standard error file                 -e [file_name]                      -e [file_name] 
Combine STDOUT & STDERR files       -j yes                              (use -o without -e) 
Copy environment                    -V                                  -\-export=[ALL | NONE | variables] 
Event notification                  -m abe                              -\-mail-type=[events] 
Send notification email             -M [address]                        -\-mail-user=[address] 
Job name                            -N [name]                           -\-job-name=[name] 
Restart job                         -r [yes|no]                         -\-requeue OR -\-no-requeue (NOTE: configurable default) 
Set working directory               -wd [directory]                     -\-workdir=[dir_name] 
Resource sharing                    -l exclusive                        -\-exclusive OR -\-shared 
Real memory per core                -l rmem=[memory per core][K|M|G]    -\-mem=[mem per node][M|G|T] OR -\-mem-percpu= [mem][M|G|T] 
Charge to an account                -A [account]                        -\-account=[account] 
Tasks per node                      (Fixed allocation_rule in PE)       -\-tasks-per-node=[count]
                                                                        -\-cpus-per-task=[count] 
Job dependency                      -hold_jid [job_id | job_name]       -\-depend=[state:job_id] 
Job project/account                 -P [name]                           -\-account=[account]    
Job host preference                 -q [queue]@[node] OR                -\-nodelist=[nodes] AND/OR
                                    -q [queue]@@[hostgroup]             -\-exclude= [nodes] 
Quality of service                                                      -\-qos=[name] 
Job arrays                          -t [array_spec]                     -\-array=[array_spec] (Slurm version 2.6+) 
Generic Resources                   -l [resource]=[value]               -\-gres=[resource_spec] 
Licenses                            -l [license]=[count]                -\-licenses=[license_spec] 
Begin Time                          -a [YYMMDDhhmm]                     -\-begin=YYYY-MM-DD[THH:MM[:SS]]
================================    ================================    ========================


================================    =========================================
SGE                                 SLURM                           
================================    =========================================
qstat                               squeue 
qstat -u username                   squeue -u username                   
qstat -f                            squeue -al 
qsub                                sbatch
qsub -N jobname                     sbatch -J jobname 
qsub -m beas                        sbatch -\-mail-type=ALL
qsub -M `user@shef.ac.uk`           sbatch `-\-mail-user=user@shef.ac.uk`
qsub -l h_rt=24:00:00               sbatch -t 24:00:00
qsub -pe smp 4                      sbatch -N 1 -n 1 -c 4
qsub -l mem=4G                      sbatch -\-mem=4000
qsub -P projectname                 sbatch -A projectname
qsub -o filename                    sbatch -o filename
qsub -e filename                    sbatch -e filename 
qdel                                scancel
================================    =========================================     