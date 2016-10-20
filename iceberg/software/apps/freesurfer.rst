Freesurfer
==========

.. sidebar:: Freesurfer

   :Versions:  5.3.0
   :URL: http://freesurfer.net/

An open source software suite for processing and analyzing (human) brain MRI images.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive graphical session with the ``qsh`` command.

The latest version of Freesurfer is made available with the command ::

        module load apps/binapps/freesurfer

Alternatively, you can load a specific version with ::

       module load apps/binapps/freesurfer/5.3.0

Important note
--------------
Freesurfer is known to produce differing results when used across platforms. See http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0038234 for details. We recommend that you run all of your analyses for any given study on the same operating system/hardware combination and record details of these as part of your results.

Testing
-------
No formal test suite was found. A set of commands to try were suggested at https://surfer.nmr.mgh.harvard.edu/fswiki/TestingFreeSurfer (Accessed November 6th 2015)

The following were tried ::

    freeview -v $SUBJECTS_DIR/bert/mri/brainmask.mgz -v $SUBJECTS_DIR/bert/mri/aseg.mgz:colormap=lut:opacity=0.2 -f $SUBJECTS_DIR/bert/surf/lh.white:edgecolor=yellow -f $SUBJECTS_DIR/bert/surf/rh.white:edgecolor=yellow -f $SUBJECTS_DIR/bert/surf/lh.pial:annot=aparc:edgecolor=red -f $SUBJECTS_DIR/bert/surf/rh.pial:annot=aparc:edgecolor=red

    tkmedit bert orig.mgz

    tkmedit bert norm.mgz -segmentation aseg.mgz $FREESURFER_HOME/FreeSurferColorLUT.txt

    tksurfer bert rh pial

    qdec

Installation notes
------------------
These are primarily for administrators of the system. The github issue for the original install request is at https://github.com/rcgsheffield/sheffield_hpc/issues/164

Freesurfer was installed as follows ::

  wget -c ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/5.3.0/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0.tar.gz
  tar -xvzf ./freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0.tar.gz
  mv freesurfer 5.3.0
  mkdir -p /usr/local/packages6/apps/binapps/freesurfer
  mv ./5.3.0/ /usr/local/packages6/apps/binapps/freesurfer/

The license file was obtained from the vendor and placed in `/usr/local/packages6/apps/binapps/freesurfer/license.txt`. The vendors were asked if it was OK to use this license on a central system. The answer is 'yes' - details at http://www.mail-archive.com/freesurfer@nmr.mgh.harvard.edu/msg43872.html

To find the information necessary to create the module file ::

    env >base.env
    source /usr/local/packages6/apps/binapps/freesurfer/5.3.0/SetUpFreeSurfer.sh
    env > after.env
    diff base.env after.env

The script `SetUpFreeSurfer.sh` additionally creates a MATLAB startup.m file in the user's home directory if it does not already exist. This is for MATLAB support only, has not been replicated in the module file and is currently not supported in this install.

The module file is at ``/usr/local/modulefiles/apps/binapps/freesurfer/5.3.0`` ::

  #%Module10.2#####################################################################

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  # Freesurfer version (not in the user's environment)
  set ver 5.3.0

  proc ModulesHelp { } {
        global ver

        puts stderr "Makes Freesurfer $ver available to the system."
  }

  module-whatis "Sets the necessary Freesurfer $ver paths"

  prepend-path PATH /usr/local/packages6/apps/binapps/freesurfer/$ver/bin
  prepend-path FREESURFER_HOME /usr/local/packages6/apps/binapps/freesurfer/$ver

  # The following emulates the results of 'source $FREESURFER_HOME/SetUpFreeSurfer.csh'
  setenv FS_OVERRIDE 0
  setenv PERL5LIB /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/lib/perl5/5.8.5
  setenv OS Linux
  setenv LOCAL_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/local
  setenv FSFAST_HOME /usr/local/packages6/apps/binapps/freesurfer/5.3.0/fsfast
  setenv MNI_PERL5LIB /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/lib/perl5/5.8.5
  setenv FMRI_ANALYSIS_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/fsfast
  setenv FSF_OUTPUT_FORMAT nii.gz
  setenv MINC_BIN_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/bin
  setenv SUBJECTS_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/subjects

  prepend-path PATH /usr/local/packages6/apps/binapps/freesurfer/5.3.0/fsfast/bin:/usr/local/packages6/apps/binapps/freesurfer/5.3.0/tktools:/usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/bin

  setenv FUNCTIONALS_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/sessions
  setenv MINC_LIB_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/lib
  setenv MNI_DIR /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni
  #setenv FIX_VERTEX_AREA #How do you set this to the empty string? This was done in the original script.
  setenv MNI_DATAPATH /usr/local/packages6/apps/binapps/freesurfer/5.3.0/mni/data
