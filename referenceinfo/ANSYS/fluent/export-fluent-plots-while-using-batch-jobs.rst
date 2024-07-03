.. _export-fluent-plots-while-using-batch-jobs:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:


Exporting GUI Fluent plots in batch submission jobs
---------------------------------------------------

While in a batch job you cannot call a display of a window / figure / animation as Fluent has nowhere to direct this output (there is no available display.)

To avoid this issue while attempting to export images from a batch job you should ensure the fluent command in your submission script has the ``-gu`` and  ``-driver null`` arguments.

for a **Bessemer** batch job:

.. code-block:: bash

  fluent 2ddp -i test.jou -gu -t$SLURM_NTASKS -driver null

You can setup your plots / graphs either in your journal file or interactively via the GUI and saving the case file.

You can then instruct Fluent to make a hard copy after each figure/animation in the you journal file  with: ::

  /display/hard-copy "myfile.tif"

Ensure that you select the correct file format as some file types will not support animations.

==============

For an example of the journal file commands see below: ::

  /display set-window xx ;(xx -> window number)
  /display set contours surface yy ;(surface id = yy)
  /display set contours filled-contours yes
  /display contour zz vof 0 1 ;(contour of volume fraction field (vof) of zz phase, min = 0, max = 1)
  /display hard-copy "vof-%t.jpg" ;(save the image file in .jpg format)

==============

Sources
^^^^^^^^^

* https://www.researchgate.net/post/How-can-I-export-my-contour-image-for-every-required-time-step-in-Fluent
* https://www.eureka.im/273.html
