.. _qtop:

qtop
====
`qtop` is a scheduler command that provides a summary of all processes running on the cluster for a given user.


Examples
--------
`qtop` is only available on the worker nodes. As such, you need to start an interactive session on a worker node using :ref:`qrsh` or :ref:`qrshx` in order to use it.

To give a summary of all of your currently running jobs ::

    qtop

    Summary for job 256127

        HOST      VIRTUAL-MEM       RSS-MEM    %CPU    %MEM    CPUTIME+   COMMAND
    testnode03      106.22 MB        1.79 MB     0.0     0.0     00:00:00 bash
    testnode03      105.62 MB        1.27 MB     0.0     0.0     00:00:00 qtop
    testnode03       57.86 MB        3.30 MB     0.0     0.0     00:00:00 ssh
                    ---------       --------
        TOTAL:        0.26 GB        0.01 GB
