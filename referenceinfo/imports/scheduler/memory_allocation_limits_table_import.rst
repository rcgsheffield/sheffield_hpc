
.. table:: Memory Allocation Limits Table
  :widths: auto

  +------------------------------------------------------------------------------+------------------------------------------------+------------------------------------------------+
  |                                                                              | SLURM (Stanage)                                | SLURM (Bessemer)                               |
  |                                                                              | Cross node MPI execution enabled               | Single node execution only                     |
  +==============================================================================+================================================+================================================+
  | **Default Job Memory Request**                                               | 4016 MB                                        | 2 GB                                           |
  +------------------------------------------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Standard Nodes**                                                           | 251 MB                                         | 192 GB                                         |
  +------------------------------------------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Large RAM Nodes**                                                          | 1007 GB                                        | N/A                                            |
  +------------------------------------------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Very Large RAM Nodes**                                                     | 2014 GB                                        | N/A                                            |
  +-----------------------------------+------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Interactive Job**               | **Maximum Possible Request**             | 251 GB                                         | 192 GB                                         |
  +-----------------------------------+------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Batch Job (SMP)**               | **Maximum Regular Node Request**         | 251 GB                                         | 192 GB                                         |
  +                                   +------------------------------------------+------------------------------------------------+------------------------------------------------+
  |                                   | **Maximum Possible Request**             | 2014 GB                                        | 192 GB                                         |
  +-----------------------------------+------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Batch Job (MPI)**               | **Maximum Possible Request**             | ~74404 GB                                      | 192 GB                                         |
  +-----------------------------------+------------------------------------------+------------------------------------------------+------------------------------------------------+
  | **Submission Argument on a per node (job) basis**                            | --mem=<nn>                                     | --mem=<nn>                                     |
  +------------------------------------------------------------------------------+------------------------------------------------+------------------------------------------------+

..
   The interactive job max RAM and batch job SMP values are both derived from a normal compute node's total RAM.

   The total MPI memory available above is derived from the total CPU nodes multiplied by the standard node RAM + Large RAM nodes * Large RAM amount and so on. 
   GPU nodes excluded as these should not be contiguously available.

   Note that on Stanage the amount of memory available for Slurm jobs is not a neat multiple of two; this is because Slurm has been configured to not make less memory than the total amount of RAM per node available to jobs so as to ring-fence some memory for use by the operating system.
   for the operating system.