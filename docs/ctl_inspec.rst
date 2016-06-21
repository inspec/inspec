=====================================================
InSpec CLI
=====================================================

Use the InSpec CLI to run audit tests against targets using locally, SSH, |winrm|, or on |docker| containers.

Common Options
=====================================================
The following options may be used with any of the InSpec CLI subcommands:

``-b``, ``--backend``
   Specify the backend. Possible values: ``local`` (default), ``ssh``, ``winrm``, or ``docker``.

``--sudo``
   Run scans with sudo. Only activates on Unix and non-root user. Default value: ``false``.

``--host``
   The remote host to be tested.

``-i``, ``--key_files``
   The login key or certificate file required for remote scanning.

``--password``
   The login password for remote scanning.

``--path``
   The login path used to connect to the target for |winrm|.

``-p``, ``--port``
   The port over which remote scanning will occur.

``--self_signed``
   Use to allow remote scanning with self-signed certificates for |winrm| targets.  Default value: ``false``.

``--ssl``
   Use to require transport-layer encryption via SSL for |winrm| targets. Default value: ``false``.

``--sudo_options``
   Additional options that may be required by the sudo password for remote scanning. Default value: ``''``.

``--sudo_password``
   The sudo password, if required.

``--sudo_command``
   Alternate sudo command, if required.

``-t``, ``--target``
   The URI for the target of a remote scan, preceded by the target's backend. For example: ``backend://user:pass@host:port``, where ``backend`` is one of ``docker``, ``local``, ``ssh``, or ``winrm``.

``--user``
   The login user for remote scanning.

``--json_config``
   A JSON file containing configuration options. Use `--json_config=-` to read from standard input. The file's format corresponds to the command line argument options. For example, `{"host": "example.com", "sudo": true}` is equivalent to `--host=example.com --sudo`. Command line switches override the configuration file.

``--diagnose``
   Dump configuration values from a command line options, the configuration file, and the merged effective options.



check
=====================================================
Use ``inspec check`` to verify all tests the specified path.

Syntax
-----------------------------------------------------
This subcommand has the following syntax:

.. code-block:: bash

   $ inspec check PATH (options)

where:

* ``PATH`` is the location against which tests are run



detect
=====================================================
Use ``inspec detect`` to detect the platform for the target.

For example, if the configuration on the target is:

.. code-block:: bash

   id=$( docker run -dti ubuntu:14.04 /bin/bash )

the following command:

.. code-block:: bash

   $ inspec detect -t docker://$id

will return:

.. code-block:: javascript

   {"family":"ubuntu","release":"14.04","arch":null}


exec
=====================================================
Use ``inspec exec`` to run all tests at the specified path.

Syntax
-----------------------------------------------------
This subcommand has the following syntax:

.. code-block:: bash

   $ inspec exec PATH(S) (options)

where:

* ``PATH(S)`` is one (or more) locations against which tests are run

Options
-----------------------------------------------------
This subcommand has additional options:

``--id=``
   Use to attach a profile identifier to all test results.

``--controls="a b c"``
   A list of controls to run. Ignore all other tests.

``--format=FORMAT``
   Which formatter to use: progress, documentation, json


Examples
-----------------------------------------------------
The following examples show how to use this subcommand.

**Run a test locally**

.. code-block:: bash

   $ inspec exec test.rb

**Run test 'tmp-01' locally and ignore other tests**

.. code-block:: bash

  $ inspec exec test.rb --controls="tmp-01"

**Run a test on a remote host using SSH**

.. code-block:: bash

   $ inspec exec test.rb -t ssh://user@hostname

**Run a test on a remote host using WinRM**

.. code-block:: bash

   $ inspec exec test.rb -t winrm://Administrator@windowshost --password 'password'

**Run a test against a Docker container**

.. code-block:: bash

   $ inspec exec test.rb -t docker://container_id



help
=====================================================
Use ``inspec help`` to print help for the |ctl inspec| from the command shell.



init
=====================================================
Use ``inspec init`` to initialize a new inspec profile

Syntax
-----------------------------------------------------
This command has the following syntax:
.. code-block:: bash

   $ inspec init profile PROFILE (options)

where:

* ``PROFILE`` is the name of the profile you wish to create

Options
-----------------------------------------------------
This subcommand has additional options:

``--overwrite``
   Overwite directory if it exists

``--no-overwrite``
   Converse of ``--overwrite``. (default)



json
=====================================================
Use ``inspec json`` to read all tests at the specified path, and then generate a |json| profile to standard output (stdout).

Syntax
-----------------------------------------------------
This subcommand has the following syntax:

.. code-block:: bash

   $ inspec json PATH (options)

where:

* ``PATH`` is the location against which tests are run

Options
-----------------------------------------------------
This subcommand has additional options:

``--controls="a b c"``
   Use to read only specific subset of controls in the PATH profile.

``--id``
   Use to attach a profile identifier to all test results.

``-o``, ``--output``
   Use to save the |json| profile to a file instead of printing to stdout.



shell
=====================================================
Use ``inspec shell`` to open an interactive debugging shell.



version
=====================================================
Use ``inspec version`` to print the version of the InSpec CLI.


.. |winrm| replace:: Windows Remote Management
.. _winrm: https://msdn.microsoft.com/en-us/library/aa384426(v=vs.85).aspx
.. |docker| replace:: Docker
.. _docker: https://www.docker.com/
.. |json| replace:: JSON
