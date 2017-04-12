Deleting jobs
=============

Deleting queued/running jobs can be useful/necessary if you realise that:

- there is an issue with the software and/or data;
- you have requested too much in the way of resources and the job will take a long time to be scheduled;
- you have requested way too much in the way of resources and the job will never run;
- you have requested too little in the way of resources and the job will probably be killed.

You can delete jobs by first finding the job ID using ``qstat`` (see :ref:`queued_running`) then running: ::

    qdel -j myjobid

Alternatively you can delete all of your queued/running jobs using: ::

    qdel -a


