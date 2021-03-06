==================
openldap-bootstrap
==================

This is a set of scripts and LDIF files to aid bootstrapping instances of
slapd. The motivation behind is having a reproducable setup for development
purposes with sane defaults and no need to consult the documentation on the
very base in every step. It is also suitable to get to know OpenLDAP software
in general and play through setting up an LDAP server.

.. note::

  The script assumes that ``slapd`` is already installed on the system and
  available in ``PATH``. Please see the file ``installing-openldap.rst`` in this
  repository for information on how to install ``slapd`` along with other
  OpenLDAP software.

Installation
============

Check out this repository locally and navigate to it::

  git clone https://github.com/JimPanic/openldap-bootstrap.git

Creating a new instance
=======================

``bin/new-instance`` is responsible for creating a set of directories and
prepared LDIF files that can then be added to the database(s) as needed. It
also generates random passwords for the bind DNs needed to connect to the
configuration database and the actual database.

It expects two parameters: the path to a directory (that is empty or yet
non-existent) for the new instance and the tree root DN for the database.

Example::

  # bin/new-instance ~/ldap-server "dc=local"

This creates the following directories and files::

  # tree ~/ldap-server
  ~/ldap-server/
  ├── config.d
  ├── data.d
  ├── etc
  │   ├── certificates
  │   └── keys
  ├── info
  ├── ldif
  │   ├── cn=config.ldif
  │   └── schema
  ├── log
  │   └── slapd.log
  └── run
      └── socket


  9 directories, 5 files

Adding config to an instance
============================

``bin/add-config`` invokes ``slapadd`` to add the provided LDIF file to the
config database of given instance. It expects the instance path as first and a
path to the LDIF file as second parameter.

Example::

  # bin/add-config ~/ldap-server ~/ldap-server/ldif/cn=config.ldif

Testing config of an instance
=============================

``bin/test-config`` runs ``slaptest`` on the config database directory. It
takes the instance path as argument.

Example::

  # bin/test-config ~/ldap-server
  > slaptest -F "/Users/apanek/rise/ops/openldap-utils/test/config.d"

  config file testing succeeded

Dumping the config of an instance
=================================

``bin/dump-config`` outputs the contents of the given instance's config
database in LDIF format. It takes only the instance path as parameter.

Example::

  # bin/dump-config ~/ldap-server

Starting, stopping and checking the status of an instance
=========================================================

There are three commands to do this:

* ``start-instance``
* ``stop-instance``
* ``instance-status``

They all take only one parameter: the instance path.

Example of the workflow::

  # start-instance ~/ldap-server
  Success.
  # instance-status ~/ldap-server
  Instance ldap-server is running. (pid 1234)
  # stop-instance ~/ldap-server
  Sent interrupt signal to instance ldap-server (pid 1234)
