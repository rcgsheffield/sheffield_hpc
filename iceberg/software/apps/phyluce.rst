
Phyluce
=======

.. sidebar:: Phyluce
   
   :Version: 1.5.0
   :Dependancies: apps/python/conda
   :URL: https://github.com/faircloth-lab/phyluce 
   :Documentation: http://faircloth-lab.github.io/phyluce/

Phyluce (phy-loo-chee) is a software package that was initially developed for analyzing data collected from ultraconserved elements in organismal genomes.

Usage
-----
Phyluce can be activated using the module file::

    module load apps/binapps/phyluce/1.5.0


Phyluce makes use of the ``apps/python/conda`` module, therefore this module will be loaded by loading Phyluce.
As Phyluce is a Python package your default Python interpreter will be changed by loading Phyluce.

Installation notes
------------------

As root::

  $ module load apps/python/conda
  $ conda create -p /usr/local/packages6/apps/binapps/conda/phyluce python=2
  $ source activate /usr/local/packages6/apps/binapps/conda/phyluce
  $ conda install -c https://conda.binstar.org/faircloth-lab phyluce

This installs Phyluce as a conda environment in the /usr/local/packages6/apps/binapps/conda/phyluce folder, which is then loaded by the module file `phyluce/1.5.0 <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/binapps/phyluce/1.5.0>`_, which is a modification of the anaconda module files.
