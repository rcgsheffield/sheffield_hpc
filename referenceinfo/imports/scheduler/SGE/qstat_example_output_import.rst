.. code-block:: console

    $ qstat -u "*"
    job-ID  prior   name       user          state submit/start at     queue                              slots   ja-task-ID 
    ------------------------------------------------------------------------------------------------------------------------
    1234567 0.00000 job.sh     foo1bar       dr    12/24/2021 07:13:20 interactive.q@sharc-node004.sh     1        
    1234568 0.00000 job.sh     foo1bar       r     01/22/2022 05:37:31 all.q@sharc-node019.shef.ac.uk     16        
    1234569 0.00000 job.sh     foo1bar       r     01/23/2022 07:41:18 all.q@sharc-node084.shef.ac.uk     16        
    1234570 0.00000 job.sh     foo1bar       Rr    01/23/2022 08:03:22 all.q@sharc-node068.shef.ac.uk     16
    1234571 0.00076 job.sh     foo1bar       qw    01/23/2022 07:06:18                                    1        
    1234572 0.00067 job.sh     foo1bar       hqw   01/23/2022 07:06:18                                    1
    1234573 0.00000 job.sh     foo1bar       Eqw   01/21/2022 13:50:55                                    1          
    1234574 0.00000 job.sh     foo1bar       t     01/24/2022 13:04:25 all.q@sharc-node159.shef.ac.uk     1        22964
