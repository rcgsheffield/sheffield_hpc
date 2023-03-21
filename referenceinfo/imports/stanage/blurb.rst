Stanage is the University's newest HPC system. It is well suited to a variety of research workloads, 
including large jobs or jobs requiring GPUs. It is intended to be the logical successor to the ShARC HPC system, but is much larger.

Stanage has a similar number of worker nodes (176) to the existing ShARC cluster but these 
have more CPU cores (64 per node for a total ~12032 cores!), with a standard memory size of 256 GB.

The standard nodes have 256GB of memory per node (4GB/core) with an additional 12 large memory nodes with 
1TB  (16GB/core), and a further 12 very large nodes with 2TB (32GB/core).

The system as a whole has a 2PB high-performance shared filesystem (Lustre), 
which like the ``/fastdata`` :ref:`Lustre filesystems on ShARC and Bessemer <filestore>`, 
is particularly well suited to working with large files, possibly within parallel jobs.

In the near future, 18 GPU nodes will be added, each with 4x NVIDIA A100 GPUs.
These will support machine learning research and other workloads that can benefit from GPU acceleration. 

Stanage uses the SLURM scheduler which is also in use on the Bessemer cluster
(and :ref:`JADE II and Bede clusters <other_uk_hpc_resources>`).
