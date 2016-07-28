.. _Theano:

Deep Learning with Theano on GPU Nodes
--------------------------------------

Theano is a Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently. Theano is most commonly used to perform deep learning and has excellent GPU support and integration through PyCUDA. The following steps can be used to setup and configure Theano on your own profile.

Request an interactive session with a sufficient amount of memory:

		qsh -l gpu=1 -P gpu --l gpu_arch=nvidia-k40m -l mem=13G

Load the relevant modules

		module load apps/python/anaconda3-2.5.0
		module load libs/cuda/7.5.18

Create a conda environment to load relevant modules on your local user account

		conda create -n theano python=3.5 anaconda3-2.5.0 
		source activate theano
		
Upgrade pip and install the other Python module dependencies which are required

		pip install --upgrade pip
		pip install theano
		pip install nose
		pip install nose-parameterized
		pip install pycuda

For optimal Theano performance, enable the CUDA memory manager CNMeM. To do this, create the .theanorc file in your HOME directory and set the fraction of GPU memory reserved by Theano. The exact amount of energy may have to be hand-picked: if Theano asks for more memory that is currently available on the GPU, an error will be thrown during import of theano module. Create or edit the .theanorc file with nano

		nano ~/.theanorc

Add the following lines and, if necessary, change the 0.8 number to whatever works for you:

		[lib]
		cnmem=0.8

Run python and verify that Theano is working correctly:

		python -c "import theano;theano.test()"