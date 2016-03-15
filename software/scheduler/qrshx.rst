.. _qrshx:

qrshx
=====
`qrshx` is a scheduler command that requests an interactive session on a worker node. The resulting session will support graphical applications. You will usually run this command from the head node.

Examples
--------
Request an interactive X-Windows session that provides the default amount of memory resources and launch the `gedit` text editor ::

    qrshx
    gedit

Request an interactive X-Windows session that provides 10 Gigabytes of real and virtual memory and launch the latest version of MATLAB ::

    qrshx -l mem=10G -l rmem=10G
    module load apps/matlab
    matlab

Request an interactive X-Windows session that provides 10 Gigabytes of real and virtual memory and 4 CPU cores ::

    qrshx -l rmem=10G -l mem=10G -pe openmp 4

Sysadmin notes
--------------
qrshx is a Sheffield-developed modification to the standard set of scheduler commands. It is at `/usr/local/bin/qrshx` and contains the following ::

  #!/bin/sh
  exec qrsh -v DISPLAY -pty y "$@" bash
