+---------------+------+-----------------------------------------------------------------------+
| Status        | Code | Explanation                                                           |
+===============+======+=======================================================================+
| COMPLETED     | CD   | The job has completed successfully.                                   |
+---------------+------+-----------------------------------------------------------------------+
| COMPLETING    | CG   | The job is finishing but some processes are still active.             |
+---------------+------+-----------------------------------------------------------------------+
| CANCELLED     | CA   | Job was explicitly cancelled by the user or system administrator.     |
+---------------+------+-----------------------------------------------------------------------+
| FAILED        | F    | The job terminated with a non-zero exit code and failed to execute.   |
+---------------+------+-----------------------------------------------------------------------+
| PENDING       | PD   | The job is waiting for resource allocation. It will eventually run.   |
+---------------+------+-----------------------------------------------------------------------+
| PREEMPTED     | PR   | The job was terminated because of preemption by another job.          |
+---------------+------+-----------------------------------------------------------------------+
| RUNNING       | R    | The job currently is allocated to a node and is running.              |
+---------------+------+-----------------------------------------------------------------------+
| SUSPENDED     | S    | A running job has been stopped with its cores released to other jobs. |
+---------------+------+-----------------------------------------------------------------------+
| STOPPED       | ST   | A running job has been stopped with its cores retained.               |
+---------------+------+-----------------------------------------------------------------------+
| OUT_OF_MEMORY | OOM  | Job experienced out of memory error.                                  |
+---------------+------+-----------------------------------------------------------------------+
| TIMEOUT       | TO   | Job exited because it reached its walltime limit.                     |
+---------------+------+-----------------------------------------------------------------------+
| NODE_FAIL     | NF   | Job terminated due to failure of one or more allocated nodes.         |
+---------------+------+-----------------------------------------------------------------------+
