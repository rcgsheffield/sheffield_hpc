.. _parallel:

Parallel Computing
==================

Modern computers contain more than one processor with a typical laptop usually containing either 2 or 4 (if you think your laptop contains 8, it is because you have been fooled by `Hyperthreading <https://en.wikipedia.org/wiki/Hyper-threading>`_). Systems such as Iceberg or Sharc contain many hundreds of processors and the key to making your research faster is to learn how to distribute your work across them. If your program is designed to run on only one processor, running it on our systems without modification will not make it any faster (it may even be slower!). Learning how to use parallelisation technologies is vital.

This section explains how to use the most common parallelisation technologies on our systems.

If you need advice on how to parallelise your workflow, please contact the `Research Software Engineering Group <http://rse.shef.ac.uk/contact/>`_

.. toctree::
   :maxdepth: 1
   :hidden:
   
   self
   JobArray
   OpenMP
   MPI
   Hybrid
   gpu/index
