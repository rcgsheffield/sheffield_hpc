.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst

.. _jupyterhub_sge:

Jupyter and JupyterHub
======================

..
    -> commented out as don't want autogenerated table of contents here
    .. contents::
       :local:

Introduction
------------

Jupyter_ Notebooks are executable documents containing:
**formatted text**,
formatted **maths**,
chunks of **code** plus
**figures**, **tables** and **textual output generated** by that code.

Notebooks can be used:

* to develop and execute linear data analysis workflows;
* to `present linear workflows`_ to others;
* as runnable documentation for software packages (e.g. `NetworkX examples`_);
* as *executable teaching materials* (e.g. `BAD days`_ tutorials);
* as `runnable journal papers`_?

Jupyter itself is web application that 
interprets, runs and renders Notebooks.
You interact with it by 
As you interact with it by just connecting from your web browser
the Jupyter server software can be running on 
your local machine or
a **remote server**
(which may have more memory, CPU cores and/or GPUs than your local machine).

On the University's **ShARC cluster** a JupyterHub_ service allows a user to:

#. **Log in** to the JupyterHub web inteface,
#. Specify what resources (**memory, CPU cores, GPUs**) they want for a Jupyter session,
#. **Start** and **run** a **Jupyter Notebook server on a worker node** in the cluster using these resources.

.. image:: /images/jupyterhub/jupyterhublogo.svg
   :width: 30%
   :align: center
   :alt: JupyterHub logo

..
    More background?
    Background on separate page?
    Mention credits here? :ref:`developed <jh_workings>` by ODK (link to :ref:`#credits <jh_svc_credits>`)


.. _jh_usage:

Using Jupyter on ShARC
----------------------

..
   Ignore for now until complete (.rst file includes setting allowing it to be orphaned)
   Quickstart <jupyterhub/quickstart>
   Using multiple CPU cores and GPUs <jupyterhub/cpus_gpus>

.. toctree::
   :numbered:
   :maxdepth: 1

   Connecting to JupyterHub, requesting resources (RAM, processors, GPUs) for your Jupyter session, and starting your session <jupyterhub/conn_res_req_start>
   JupyterLab interface <jupyterhub/jupyterlab_overview>
   Terminal in your browser <jupyterhub/terminal>
   Programming languages, software packages and execution environments <jupyterhub/conda>
   Creating, editing and running Jupyter Notebooks <jupyterhub/nb_usage>
   Monitoring and controlling your Jupyter session <jupyterhub/sess_monit>
   Errors and troubleshooting <jupyterhub/issues>


.. _jh_svc_status:

Maintenance of ShARC's JupyterHub service
-----------------------------------------

The server that provider the JupyterHub service is 
typically **rebooted at 03:26 on the 2nd Tuesday of the month**
to install security updates.

.. _jh_workings:

JupyterHub on a Grid Engine cluster: internal workings
------------------------------------------------------

The **hub** of JupyterHub has several components: 

* an **authenticator** that allows users to log in, possibly using externally-stored identity information;
* a **database** of user and state information;
* a **spawner** that can start single-user Jupyter Notebook servers on demand.

.. image:: /images/jupyterhub/jhub-parts.png
   :width: 30%
   :align: center
   :alt: JupyterHub architecture

There is also a **web proxy** that first routes web connections from a given user to the hub for authentication and possibly choosing spawner options
then, after a single-user Jupyter server has been spawned, certain web connections are forwarded to the Jupyter Notebook server.
From the user's perspective it appears that they are interacting with a single web application, 
even though at times they might be talking to a single-user Jupyter server that running on a different machine to the Hub.

ShARC uses `BatchSpawner <https://github.com/jupyterhub/batchspawner>`__ to
spawn single-user Jupyter servers on one or more worker nodes on ShARC by submitting batch jobs to the Grid Engine job scheduler.

The JupyterHub and BatchSpawner configuration allows the user to specify the Grid Engine resources required for the Jupyter session in advance
via a web form then these resources are requested as part of the batch job submission.

.. _jh_svc_credits:

Credits
-------

The JupyterHub service on ShARC was originally developed and maintained by the University's `Research Software Engineering team`_, funded by OpenDreamKit_, a Horizon2020_ European `Research Infrastructure`_ project (676541_) that aimed to advance the open source computational mathematics ecosystem.

.. _676541: http://cordis.europa.eu/project/rcn/198334_en.html
.. _Horizon2020: https://ec.europa.eu/programmes/horizon2020/
.. _Jupyter: https://jupyter.org/
.. _JupyterHub: https://jupyterhub.readthedocs.io/
.. _OpenDreamKit: http://opendreamkit.org/
.. _Research Infrastructure: https://ec.europa.eu/programmes/horizon2020/en/h2020-section/european-research-infrastructures-including-e-infrastructures
.. _Research Software Engineering team: https://rse.shef.ac.uk
.. _BAD days: http://bitsandchips.me/BAD_days/
.. _NetworkX examples: https://networkx.github.io/documentation/stable/auto_examples/index.html
.. _runnable journal papers: http://nbviewer.jupyter.org/github/cossatot/lanf_earthquake_likelihood/blob/master/notebooks/lanf_manuscript_notebook.ipynb
.. _present linear workflows: http://nbviewer.jupyter.org/github/machinalis/satimg/blob/master/Searching%20for%20aliens.ipynb
