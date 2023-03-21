.. _stanage-connecting-ssh:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Connecting with SSH
===================

.. warning::

  You must be connected to the VPN, whether you are located on or off campus, to connect to Stanage.
  Note this applies even if you are on-campus using a wired ethernet connection.

.. Hint::

    Usernames to connect with all HPC services will be the same as those you use to login to MUSE :underline-bold:`not` the prefix on your email address.


Once you have a terminal open run the following command to
log in to a cluster: ::

    ssh -X $USER@stanage.shef.ac.uk

When connecting for the first time you should make sure that the SSH 'fingerprint' is correct.
The RSA, ECDSA and ED25519 fingerprints for Stanage's login nodes are: ::

    SHA256:mFfJmZHH0SUogoUhTtlatoZLEacfGAlj0cTrnInO5z0 (RSA)
    SHA256:4HdvK3C1KDm+JG1TzxQKxezMz5ojEORynHUqF9tQfoI (ECDSA)
    SHA256:aaTv+0TEc0nj7WR2ZuBYWFDD+QqzOKJpMjEFKBx6pQU (ED25519)

Your SSH client will show one of these fingerprints by default. If any one of these fingerprints matches you should continue. 

.. warning::

    If none of these fingerprints matches the fingerprint shown in your terminal please 
    contact the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_ .

You can then launch an interactive session on Stanage using the following command: ::

    srun --mem=XXG --pty bash -i

where XX is the memory request for the session (default is 2Gb).



