.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:
    
Listing Queues
-----------------

You can list the queues with: ::
        
    sinfo -a

You can list more information by formatting the output, e.g.: ::

    sinfo -o "%P %l %c %D "  # PARTITION TIMELIMIT CPUS NODES  



