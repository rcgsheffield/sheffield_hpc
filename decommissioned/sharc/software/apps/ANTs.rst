.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc_ants:

ANTs
====

.. sidebar:: ANTs
   
   :Version: 2.1.0-a
   :Dependencies: gcc/4.9.4
   :URL: https://github.com/stnava/ANTs.git
   :Documentation: http://stnava.github.io/ANTs/


The ANTs framework provides open-source functionality for deformable image registration with small or large deformations. ANTs includes N4 bias correction, additional evaluation of multiple modalities and organ systems, univariate or multivariate image segmentation, tighter integration with the Insight ToolKit, a well evaluated cortical thickness pipeline and visualization tools and integration with :ref:`sharc_r`. ANTs serves as both a core library for further algorithm development and also as a command-line application-oriented toolkit. ANTs also has a permissive software license that allows it to be employed freely by industry. ANTs enables diffeomorphic normalization with a variety of transformation models, optimal template construction, multiple types of diffeomorphisms, multivariate similarity metrics, diffusion tensor processing and warping, image segmentation with and with-out priors and measurement of cortical thickness from probabilistic segmentations. The normalization tools, alone, provide a near limitless range of functionality and allow the user to develop customized objective functions.

Usage
-----

ANTs can be activated using the module file::

    module load apps/ANTs/2.1.0-a/gcc-4.9.4


Note: this ANTs version is 783 commits ahead of Release 2.1.0 (Commit 646459b build), which we have named Version 2.1.0-a

Test
----

#. Download and unpack the following brain image data using:

   .. code-block:: bash

    cd some_directory
    wget https://github.com/stnava/BasicBrainMapping/tarball/master/stnava-BasicBrainMapping-e157693.tar.gz
    tar zxvf stnava-BasicBrainMapping-e157693.tar.gz
    cd stnava-BasicBrainMapping-e157693

#. Create a batch job submission script called ``test.sge`` containing:

   .. code-block:: bash

    #!/bin/bash
    #$ -pe smp 2
    #$ -l rmem=8G
    #$ -o Ants.out
    #$ -e Ants.err
    #$ -m eba -M a.person@sheffield.ac.uk
    export OMP_NUM_THREADS=$NSLOTS
    module load apps/ANTs
    export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=2  # controls multi-threading

    dim=3 # image dimensionality
    nm=BBM_Lesion

    MultiplyImages 3 ./data/IXI594-Guys-1089-T1.nii.gz data/neg_lesion.nii.gz  data/T1_lesioned.nii.gz

    antsRegistrationSyNQuick.sh -n 2 -d 3 -f data/IXI/T_template2.nii.gz -m data/T1_lesioned.nii.gz -t s -o ${nm}_diff -x data/neg_lesion.nii.gz

    rm grid.nii.gz jacobian.nii.gz

    CreateJacobianDeterminantImage 3 ${nm}_diff1Warp.nii.gz jacobian.nii.gz 1

    CreateWarpedGridImage 3 ${nm}_diff1Warp.nii.gz grid.nii.gz 1x0x1 10x10x10 3x3x3
 
#. Submit the job using ``qsub test.sge``

The registered image/s can be viewed using :ref:`sharc_itksnap`.

Installation notes
------------------

ANTs was compiled using the
:download:`install_ANTs.sh </decommissioned/sharc/software/install_scripts/apps/ANTs/2.1.0-a/gcc-4.9.4/install_ANTs.sh>` script, the module
file is
:download:`gcc-4.9.4 </decommissioned/sharc/software/modulefiles/apps/ANTs/2.1.0-a/gcc-4.9.4>`.

