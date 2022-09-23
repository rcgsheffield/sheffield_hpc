.. code-block:: console

    $ squeue
            JOBID   PARTITION   NAME      USER  ST       TIME  NODES NODELIST(REASON)
            1234567 interacti   bash   foo1bar   R   17:19:40      1 bessemer-node001
            1234568 sheffield job.sh   foo1bar   R   17:21:40      1 bessemer-node046
            1234569 sheffield job.sh   foo1bar  PD   17:22:40      1 (Resources)
            1234570 sheffield job.sh   foo1bar  PD   16:47:06      1 (Priority)
            1234571       gpu job.sh   foo1bar   R 1-19:46:53      1 bessemer-node026
            1234572       gpu job.sh   foo1bar   R 1-19:46:54      1 bessemer-node026
            1234573       gpu job.sh   foo1bar   R 1-19:46:55      1 bessemer-node026
            1234574       gpu job.sh   foo1bar   R 1-19:46:56      1 bessemer-node026
            1234575       gpu job.sh   foo1bar  PD       9:04      1 (ReqNodeNotAvail, UnavailableNodes:bessemer-node026)
            1234576 sheffield job.sh   foo1bar  PD    2:57:24      1 (QOSMaxJobsPerUserLimit)