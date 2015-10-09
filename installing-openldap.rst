===================
Installing OpenLDAP
===================

Ubuntu/Debian
=============

::

  sudo apt-get install slapd ldap-utils

For more information, please read the `official Ubuntu documentation on
installing OpenLDAP
<https://help.ubuntu.com/lts/serverguide/openldap-server.html#openldap-server-installation>`_

OS X
====

OS X comes with a slapd, but it is recommended to install a newer version via
Homebrew alongside with a newer version of openssl::

  brew install openssl
  brew install homebrew/dupes/openldap

The current versions available are ``openssl (1.0.2d_1)`` and ``openldap (2.4.41_1)``.

Make sure to make ``slapd`` and its tools available in ``PATH``::

  PATH="/usr/local/Cellar/openldap/2.4.41_1/bin:/usr/local/Cellar/openldap/2.4.41_1/sbin:/usr/local/Cellar/openldap/2.4.41_1/libexec/:${PATH}"

Windows
=======

A guide on installing OpenLDAP software on Windows:
http://www.zytrax.com/books/ldap/ch4/win2k.html#win2k

(I have not tested this.)

From Source
===========

Please consult the `official OpenLDAP admin guide on building and installing
OpenLDAP software <http://www.openldap.org/doc/admin24/install.html>`_
