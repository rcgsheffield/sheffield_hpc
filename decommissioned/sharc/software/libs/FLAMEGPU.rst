.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _flamegpu_sharc:

.. highlight:: bash

FLAMEGPU
========

.. sidebar:: FLAME GPU

   :URL: http://www.flamegpu.com/
   :Docs: http://docs.flamegpu.com/
   :GitHub: https://github.com/FLAMEGPU/FLAMEGPU


`FLAMEGPU <http://www.flamegpu.com>`_ is a multi agent simulation framework developed at the University of Sheffield.
It uses GPUs to accelerate the simulation of multiagent systems but abstracts the GPU architecture away from users so that they can write models using a high level of abstraction (without having to write GPU code).


Installing FLAMEGPU on ShARC
----------------------------

To install FLAME GPU you should checkout the latest master branch of the code which has Linux support ::

    git clone https://github.com/FLAMEGPU/FLAMEGPU.git

To run the FLAME GPU examples you will need to be on a GPU node. You can start an interactive session using ::

    qrshx -l gpu=1 -P gpu -l rmem=15G

You will then need to load the relevant modules ::

    module load libs/CUDA/9.1.85/binary
    module load dev/gcc/4.9.4


You can now navigate to the FLAME GPU examples folder and build the examples. e.g. to build all the examples in console mode ::

    cd FLAMEGPU/examples
    make console

Building the full suite of examples can take a while, instead you may wish to build individual examples. eg. to build a single example in console mode ::

    cd FLAMEGPU/examples/GameOfLife
    make console

You can now run the console versions of the example models by navigating to ``FLAMEGPU/bin/x64`` and calling the appropriate shell script. e.g. from the ``FLAMEGPU/examples/GameOfLife`` directory ::

    ../../bin/linux-x64/GameOfLife_console.sh

or by manually running the executable with the appropriate command line arguments. e.g. from the ``FLAMEGPU/examples/GameOfLife`` directory ::

   ../../bin/linux-x64/Release_Console/GameOfLife iterations/0.xml 1



FLAME GPU will run the example for one iteration and output the model state to a file ``1.xml`` in the model's iterations directory.

Visualisation currently does not work with X forwarding as FLAME GPU uses complex rendering techniques which are not supported.


For more information please see the `FLAME GPU Documentation <http://docs.flamegpu.com>`_. 
Additional information on compiling FLAME GPU examples can be found via :: 
    
    make help

And additional information on the command line arguments via :: 

    ../../bin/linux-x64/Release_Console/GameOfLife --help

