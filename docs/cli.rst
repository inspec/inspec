=====================================================
InSpec CLI
=====================================================

Use the InSpec CLI to run tests and audits against targets using local, SSH, WinRM, or Docker connections.

archive
=====================================================

Archive a profile to tar.gz (default) or zip

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec archive PATH

Options
-----------------------------------------------------

This subcommand has additional options:

``--ignore-errors``, ``--no-ignore-errors``
   Ignore profile warnings.

``-o``, ``--output=OUTPUT``
   Save the archive to a path

``--overwrite``, ``--no-overwrite``
   Overwrite existing archive.

``--profiles-path=PROFILES_PATH``
   Folder which contains referenced profiles.

``--tar``, ``--no-tar``
   Generates a tar.gz archive.

``--zip``, ``--no-zip``
   Generates a zip archive.



check
=====================================================

Verify all tests at the specified path

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec check PATH

Options
-----------------------------------------------------

This subcommand has additional options:

``--format=FORMAT``
   

``--profiles-path=PROFILES_PATH``
   Folder which contains referenced profiles.



compliance
=====================================================

Chef compliance commands

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec compliance SUBCOMMAND ...



detect
=====================================================

Detect the target os

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec detect

Options
-----------------------------------------------------

This subcommand has additional options:

``-b``, ``--backend=BACKEND``
   Choose a backend: local, ssh, winrm, docker.

``--format=FORMAT``
   

``--host=HOST``
   Specify a remote host which is tested.

``--json-config=JSON_CONFIG``
   Read configuration from JSON file (`-` reads from stdin).

``-i``, ``--key-files=one two three``
   Login key or certificate file for a remote scan.

``-l``, ``--log-level=LOG_LEVEL``
   Set the log level: info (default), debug, warn, error

``--password=PASSWORD``
   Login password for a remote scan, if required.

``--path=PATH``
   Login path to use when connecting to the target (WinRM).

``-p``, ``--port=N``
   Specify the login port for a remote scan.

``--self-signed``, ``--no-self-signed``
   Allow remote scans with self-signed certificates (WinRM).

``--ssl``, ``--no-ssl``
   Use SSL for transport layer encryption (WinRM).

``--sudo``, ``--no-sudo``
   Run scans with sudo. Only activates on Unix and non-root user.

``--sudo-command=SUDO_COMMAND``
   Alternate command for sudo.

``--sudo-options=SUDO_OPTIONS``
   Additional sudo options for a remote scan.

``--sudo-password=SUDO_PASSWORD``
   Specify a sudo password, if it is required.

``-t``, ``--target=TARGET``
   Simple targeting option using URIs, e.g. ssh://user:pass@host:port

``--user=USER``
   The login user for a remote scan.



env
=====================================================

Output shell-appropriate completion configuration

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec env



exec
=====================================================

Run all test files at the specified path.

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec exec PATHS

Options
-----------------------------------------------------

This subcommand has additional options:

``--attrs=one two three``
   Load attributes file (experimental)

``-b``, ``--backend=BACKEND``
   Choose a backend: local, ssh, winrm, docker.

``--cache=CACHE``
   Use the given path for caching dependencies. (default: ~/.inspec/cache)

``--color``, ``--no-color``
   Use colors in output.

``--controls=one two three``
   A list of controls to run. Ignore all other tests.

``--create-lockfile``, ``--no-create-lockfile``
   Write out a lockfile based on this execution (unless one already exists)

``--format=FORMAT``
   Which formatter to use: cli, progress, documentation, json, json-min

``--host=HOST``
   Specify a remote host which is tested.

``--json-config=JSON_CONFIG``
   Read configuration from JSON file (`-` reads from stdin).

``-i``, ``--key-files=one two three``
   Login key or certificate file for a remote scan.

``-l``, ``--log-level=LOG_LEVEL``
   Set the log level: info (default), debug, warn, error

``--password=PASSWORD``
   Login password for a remote scan, if required.

``--path=PATH``
   Login path to use when connecting to the target (WinRM).

``-p``, ``--port=N``
   Specify the login port for a remote scan.

``--profiles-path=PROFILES_PATH``
   Folder which contains referenced profiles.

``--self-signed``, ``--no-self-signed``
   Allow remote scans with self-signed certificates (WinRM).

``--ssl``, ``--no-ssl``
   Use SSL for transport layer encryption (WinRM).

``--sudo``, ``--no-sudo``
   Run scans with sudo. Only activates on Unix and non-root user.

``--sudo-command=SUDO_COMMAND``
   Alternate command for sudo.

``--sudo-options=SUDO_OPTIONS``
   Additional sudo options for a remote scan.

``--sudo-password=SUDO_PASSWORD``
   Specify a sudo password, if it is required.

``-t``, ``--target=TARGET``
   Simple targeting option using URIs, e.g. ssh://user:pass@host:port

``--user=USER``
   The login user for a remote scan.



help
=====================================================

Describe available commands or one specific command

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec help [COMMAND]



init
=====================================================

Scaffolds a new project

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec init TEMPLATE ...



json
=====================================================

Read all tests in path and generate a json summary

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec json PATH

Options
-----------------------------------------------------

This subcommand has additional options:

``--controls=one two three``
   A list of controls to include. Ignore all other tests.

``-o``, ``--output=OUTPUT``
   Save the created profile to a path

``--profiles-path=PROFILES_PATH``
   Folder which contains referenced profiles.



shell
=====================================================

Open an interactive debugging shell

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec shell

Options
-----------------------------------------------------

This subcommand has additional options:

``-b``, ``--backend=BACKEND``
   Choose a backend: local, ssh, winrm, docker.

``-c``, ``--command=COMMAND``
   A single command string to run instead of launching the shell

``--host=HOST``
   Specify a remote host which is tested.

``--json-config=JSON_CONFIG``
   Read configuration from JSON file (`-` reads from stdin).

``-i``, ``--key-files=one two three``
   Login key or certificate file for a remote scan.

``-l``, ``--log-level=LOG_LEVEL``
   Set the log level: info (default), debug, warn, error

``--password=PASSWORD``
   Login password for a remote scan, if required.

``--path=PATH``
   Login path to use when connecting to the target (WinRM).

``-p``, ``--port=N``
   Specify the login port for a remote scan.

``--self-signed``, ``--no-self-signed``
   Allow remote scans with self-signed certificates (WinRM).

``--ssl``, ``--no-ssl``
   Use SSL for transport layer encryption (WinRM).

``--sudo``, ``--no-sudo``
   Run scans with sudo. Only activates on Unix and non-root user.

``--sudo-command=SUDO_COMMAND``
   Alternate command for sudo.

``--sudo-options=SUDO_OPTIONS``
   Additional sudo options for a remote scan.

``--sudo-password=SUDO_PASSWORD``
   Specify a sudo password, if it is required.

``-t``, ``--target=TARGET``
   Simple targeting option using URIs, e.g. ssh://user:pass@host:port

``--user=USER``
   The login user for a remote scan.



supermarket
=====================================================

Supermarket commands

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec supermarket SUBCOMMAND ...



vendor
=====================================================

Download all dependencies and generate a lockfile

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec vendor



version
=====================================================

Prints the version of this tool

Syntax
-----------------------------------------------------

This subcommand has the following syntax:

.. code-block:: bash

   $ inspec version



