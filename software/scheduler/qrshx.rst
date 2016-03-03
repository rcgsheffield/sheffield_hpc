qrshx
=====
`qrshx` is a scheduler command that requests an interactive session on a worker node. The resulting session will support graphical applications. You will usually run this command from the head node.

Examples
--------
Request an interactive session that provides the default amount of memory resources and launch the `gedit` text editor ::

    qrshx
    gedit

Request an interactive session that provides 10 Gigagbytes of memory and launch the latest version of MATLAB ::

    qrshx -l mem=10G -l rmem=10G
    module load apps/matlab
    matlab

Sysadmin notes
--------------
qrshx is a Sheffield-developed modification to the standard set of scheduler commands. It is at `/usr/local/bin/qrshx` and contains the following ::

    #!/bin/sh
    qrsh -v DISPLAY -pty y $* bash
