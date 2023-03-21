+-----------+------------------------------------------------+---------------------------------------------+
| State     | Explanation                                    | SGE State Letter Code/s                     |
+===========+================================================+=============================================+
| Pending   | pending, queued                                | qw                                          |
+-----------+------------------------------------------------+---------------------------------------------+
| Pending   | pending, user and/or system hold               | hqw                                         |
+-----------+------------------------------------------------+---------------------------------------------+
| Running   | running                                        | r                                           |
+-----------+------------------------------------------------+---------------------------------------------+
| Error     | all pending states with error                  | Eqw, Ehqw, EhRqw                            |
+-----------+------------------------------------------------+---------------------------------------------+

**Key:** **q**: *queueing*, **r**: *running*, **w**: *waiting*, **h**: *on hold*, **E**: *error*, **R**: *re-run*, **s**: *job suspended*, **S**: *queue suspended*, **t**: *transferring*, **d**: *deletion*.

.. note::

    A full list of SGE and DRMAA states can be found `here <https://manpages.ubuntu.com/manpages/jammy/man5/sge_status.5.html>`_ 