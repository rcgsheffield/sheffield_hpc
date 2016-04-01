.. _qsh:

qsh
===
`qsh` is a scheduler command that requests an interactive X-windows session on a worker node. The resulting terminal is not user-friendly and we recommend that you use our :ref:`qrshx` command instead.

Examples
--------
Request an interactive X-Windows session that provides the default amount of memory resources ::

    qsh

Request an interactive X-Windows session that provides 10 Gigabytes of real and virtual memory ::

    qsh -l rmem=10G -l mem=10G

Request an interactive X-Windows session that provides 10 Gigabytes of real and virtual memory and 4 CPU cores ::

   qsh -l rmem=10G -l mem=10G -pe openmp 4
