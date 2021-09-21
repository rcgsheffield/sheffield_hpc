.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:
    
Listing Queues
-----------------

ShARC
............

On ShARC you can list the queues with: ::

    qconf -sql

You can then list your specific queue properties with: ::

    qconf -sq queue_name

Bessemer
..........

On Bessemer you can list the queues with: ::

    sinfo -a

As Bessemer has non-homogenous nodes you can list more information by formatting the output, e.g.: ::

    sinfo -o "%P %l %c %D "  # PARTITION TIMELIMIT CPUS NODES
