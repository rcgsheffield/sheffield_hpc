.. _FLAMEGPU:

Installing FLAMEGPU on Iceberg
------------------------------

[FLAME GPU](http://www.flamegpu.com) is a multi agent simulation framework developed at the University of Sheffield. It uses GPUs to accelerate the simulation of multiagent systems but abstracts the GPU architecture away from users so that they can write models using a high level of abstraction (without having to write GPU code).

To install FLAME GPU you should checkout the latest master branch of the code which has linux support. 

		git clone https://github.com/FLAMEGPU/FLAMEGPU.git
		
To compile the FLAME GPU examples you will need to be on a GPU node. You can start an interactive session using the following command.

		qsh -l gpu=1 -P gpu --l gpu_arch=nvidia-k40m -l mem=13G

You will then need to load the relevant modules

		module load libs/cuda/7.5.18
		module load compilers/gcc/4.9.2

FLAMEGPU allows you to specify a `CUDA_PATH` environment variable so that you can change the CUDA version easily. To set this for the CUDA 7.5 module use

		export CUDA_PATH=/usr/local/packages6/libs/binlibs/CUDA/7.5.18/cuda

You can now navigate to the FLAME GPU examples folder and build the examples. e.g.

		cd FLAMEGPU
		cd examples
		make
		
You can now run the console versions of the example models by navigating to FLAMEGPU/bin/x64 and calling the appropriate shell script. e.g.

		cd ../..
		cd bin/x64
		./Boids_BruteForce_console.sh
		
FLAME GPU will run the examaple for one iteration and output the model state to a file `1.xml` in the models iterations directory.

Visualisation currently does not work with X forwarding as FLAME GPU uses complex rendering techniques which are not supported. A solution using VirtualGL is in progress.