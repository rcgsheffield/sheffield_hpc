qrsh
====
`qrsh` is a scheduler command that requests an interactive session on a worker node. The resulting session will **not** support graphical applications. You will usually run this command from the head node.

Examples
--------
Request an interactive session that provides the default amount of memory resources ::

    qrsh

Request an interactive session that provides 10 Gigabytes of real and virtual memory ::

    qrsh -l rmem=10G -l mem=10G
