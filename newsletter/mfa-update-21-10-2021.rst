.. _MFA_update_2021_10_21:

2021-10-21 - MFA Change
========================

On the 21st of October 2021 we will be deploying `Multifactor Authentication (MFA) <https://sites.google.com/sheffield.ac.uk/mfa/home>`_ 
on the HPC login nodes (ShARC & Bessemer) for any logins using a :underline-bold:`username and password.`
What this means is that when you attempt to login to the HPCs using a password you will be 
required to do an MFA push to your chosen trusted device (normally your mobile phone), and 
authorise the login via Duo on your device.

Most HPC users, who connect from outside the University, will be familiar with the process since 
MFA is required to connect to the VPN. 

:underline-bold:`The difference here is that, whether you are off or on campus 
you will need to authenticate HPC login using MFA if using a password.`

The reason for implementing MFA on the login nodes is security. The HE sector 
`is experiencing an increasing number of attacks <https://www.ncsc.gov.uk/news/alert-targeted-ransomware-attacks-on-uk-education-sector>`_  , designed to penetrate our security measures and hijack data and 
compute resource. MFA considerably decreases the risk of penetration using unsecured accounts.
The purpose of this layer to the HPC login procedure is to protect your research (data & code).

If you are having issues with Filezilla transfers please see our `new instructions <https://notesrcg.blogspot.com/2021/10/mfa-on-hpc-login-nodes-how-to-use.html>`_.

If you are having issues with MobaXterm file transfer windows not loading, please recreate your profiles as instructed on our :ref:`connection instructions <mobaxterm_connecting_profile_setup>` page.
