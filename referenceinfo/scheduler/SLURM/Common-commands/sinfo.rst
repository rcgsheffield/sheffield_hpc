.. _sinfo:

sinfo
=====

``sinfo`` is a scheduler command that shows info about SLURM nodes and partitions.

Documentation
-------------

Documentation is available on the system using the command::

    man sinfo

Usage
-----

**Get an overview of the nodes on Bessemer:** ::

    sinfo -N

This shows every node in the cluster. Some of these nodes may be reserved/purchased for specific research groups and hence may not be available for general use.

**Get an overview of the partitions on Bessemer:** ::

    sinfo -a


**As Bessemer has non-homogenous nodes you can list more information by formatting the output, e.g.:** ::

    sinfo -o "%P %l %c %D "  # PARTITION TIMELIMIT CPUS NODES