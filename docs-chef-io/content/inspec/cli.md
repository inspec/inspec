+++
title = "InSpec CLI"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Executable"
    identifier = "inspec/reference/cli.md InSpec Executable"
    parent = "inspec/reference"
    weight = 10
+++

<!-- markdownlint-disable MD024 -->

Use the InSpec Command Line Interface (CLI) to run tests and audits against targets using local, SSH, WinRM, or Docker connections.

## archive

Archive a profile to a tar file (default) or zip file.

### Syntax

This subcommand has the following syntax:

```bash
inspec archive PATH
```

### Options

This subcommand has the following additional options:

* `--airgap`, `--no-airgap`
    Fallback to using local archives if fetching fails.
* `--ignore-errors`, `--no-ignore-errors`
    Ignore profile warnings.
* `-o`, `--output=OUTPUT`
    Save the archive to a path.
* `--overwrite`, `--no-overwrite`
    Overwrite existing archive.
* `--profiles-path=PROFILES_PATH`
    Folder which contains referenced profiles.
* `--tar`, `--no-tar`
    Generates a tar.gz archive.
* `--vendor-cache=VENDOR_CACHE`
    Use the given path for caching dependencies, (default: `~/.inspec/cache`).
* `--zip`, `--no-zip`
    Generates a zip archive.

## automate

Communicates with Chef Automate.

### Syntax

This subcommand has the following syntax:

```bash
inspec automate SUBCOMMAND
```

## check

Verify the metadata in the `inspec.yml` file, verify that control blocks have the correct fields (title, description, impact) defined that all controls have visible tests, and the controls are not using deprecated InSpec DSL code.

### Syntax

This subcommand has the following syntax:

```bash
inspec check PATH
```

### Options

This subcommand has the following additional options:

* `--format=FORMAT`
    The output format to use. Valid values: `json` and `doc`. Default value: `doc`.
* `--profiles-path=PROFILES_PATH`
    Folder which contains referenced profiles.
* `--vendor-cache=VENDOR_CACHE`
    Use the given path for caching dependencies, (default: `~/.inspec/cache`).
* `--with-cookstyle`, `--no-with-cookstyle`
    Enable or disable cookstyle checks.

## detect

Detects the target OS.

### Syntax

This subcommand has the following syntax:

```bash
inspec detect
```

### Options

This subcommand has the following additional options:

* `-b`, `--backend=BACKEND`
    Choose a backend: local, ssh, winrm, docker.
* `--bastion-host=BASTION_HOST`
    Specifies the bastion host if applicable.
* `--bastion-port=BASTION_PORT`
    Specifies the bastion port if applicable.
* `--bastion-user=BASTION_USER`
    Specifies the bastion user if applicable.
* `--ca-trust-file=PATH_TO_CA_TRUST_FILE`
    Specify CA certificate required for SSL authentication (WinRM).
* `--client-cert=PATH_TO_CLIENT_CERTIFICATE`
    Specify client certificate required for SSL authentication (WinRM).
* `--client-key=PATH_TO_CLIENT_KEY`
    Specify client key required with client certificate for SSL authentication (WinRM).
* `--client-key-pass=CLIENT_CERT_PASSWORD`
    Specify client certificate password, if required for SSL authentication (WinRM).
* `--config=CONFIG`
    Read configuration from JSON file (`-` reads from stdin).
* `--docker-url`
    Provides path to Docker API endpoint (Docker).
* `--enable-password=ENABLE_PASSWORD`
    Password for enable mode on Cisco IOS devices.
* `--format=FORMAT`

* `--host=HOST`
    Specify a remote host which is tested.
* `--insecure`, `--no-insecure`
    Disable SSL verification on select targets.
* `-i`, `--key-files=one two three`
    Login key or certificate file for a remote scan.
* `--password=PASSWORD`
    Login password for a remote scan, if required.
* `--path=PATH`
    Login path to use when connecting to the target (WinRM).
* `-p`, `--port=N`
    Specify the login port for a remote scan.
* `--podman-url`
    Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).
* `--proxy-command=PROXY_COMMAND`
    Specifies the command to use to connect to the server.
* `--self-signed`, `--no-self-signed`
    Allow remote scans with self-signed certificates (WinRM).
* `--shell`, `--no-shell`
    Run scans in a subshell. Only activates on Unix.
* `--shell-command=SHELL_COMMAND`
    Specify a particular shell to use.
* `--shell-options=SHELL_OPTIONS`
    Additional shell options.
* `--ssl`, `--no-ssl`
    Use SSL for transport layer encryption (WinRM).
* `--ssl-peer-fingerprint`
    Specify ssl peer fingerprint in lieu of certificates, for SSL authentication (WinRM).
* `--sudo`, `--no-sudo`
    Run scans with sudo. Only activates on Unix and non-root user.
* `--sudo-command=SUDO_COMMAND`
    Alternate command for sudo.
* `--sudo-options=SUDO_OPTIONS`
    Additional sudo options for a remote scan.
* `--sudo-password=SUDO_PASSWORD`
    Specify a sudo password, if it is required.
* `-t`, `--target=TARGET`
    Simple targeting option using URIs, e.g. ssh://user:pass@host:port.
* `--target-id=TARGET_ID`
    Provide a ID which will be included on reports.
* `--user=USER`
    The login user for a remote scan.
* `--winrm-basic-auth-only`, `--no-winrm-basic-auth-only`
    Whether to use basic authentication, defaults to false (WinRM).
* `--winrm-disable-sspi`, `--no-winrm-disable-sspi`
    Whether to use disable sspi authentication, defaults to false (WinRM).
* `--winrm-transport=WINRM_TRANSPORT`
    Specify which transport to use, defaults to negotiate (WinRM).
* `--winrm-shell-type=WINRM_SHELL_TYPE`
    Specify which shell type to use (powershell,elevated or cmd), defaults to powershell (WinRM).

## env

Outputs shell-appropriate completion configuration.

### Syntax

This subcommand has the following syntax:

```bash
inspec env
```

## exec

Run all test files at the specified locations.

The subcommand loads the given profiles, fetches their dependencies if needed, then connects to the target and executes any controls contained in the profiles. One or more reporters are used to generate the output.

```ruby
exit codes:
    0  normal exit, all tests passed
    1  usage or general error
    2  error in plugin system
    3  fatal deprecation encountered
  100  normal exit, at least one test failed
  101  normal exit, at least one test skipped but none failed
  172  chef license not accepted
```

Below are some examples of using `exec` with different test locations:

Chef Automate:

```ruby
inspec automate login
inspec exec compliance://username/linux-baseline
```

`inspec compliance` is a backwards compatible alias for `inspec automate` and works the same way:

```ruby
inspec compliance login
```

Chef Supermarket:

```ruby
inspec exec supermarket://username/linux-baseline
inspec exec supermarket://username/linux-baseline --supermarket_url="https://privatesupermarket.example.com"
```

Local profile (executes all tests in `controls/`):

```ruby
inspec exec /path/to/profile
```

Local single test (doesn't allow inputs or custom resources):

```ruby
inspec exec /path/to/a_test.rb
```

Git via SSH:

```ruby
inspec exec git@github.com:dev-sec/linux-baseline.git
```

Git via HTTPS (.git suffix is required):

```ruby
inspec exec https://github.com/dev-sec/linux-baseline.git
```

Private Git via HTTPS (.git suffix is required):

```ruby
inspec exec https://api_token@github.com/dev-sec/linux-baseline.git
```

Private Git via HTTPS and cached credentials (.git suffix is required):

```bash
git config credential.helper cache
git ls-remote https://github.com/dev-sec/linux-baseline.git
inspec exec https://github.com/dev-sec/linux-baseline.git
```

Web-hosted file (also supports .zip):

```bash
inspec exec https://webserver/linux-baseline.tar.gz
```

Web-hosted file with basic authentication (supports .zip):

```bash
inspec exec https://username:password@webserver/linux-baseline.tar.gz
```

### Syntax

This subcommand has the following syntax:

```bash
inspec exec LOCATIONS
```

### Options

This subcommand has the following additional options:

* `--attrs=one two three`
    Legacy name for --input-file - deprecated.
* `--auto-install-gems`
    Auto installs gem dependencies of the profile or resource pack.
* `-b`, `--backend=BACKEND`
    Choose a backend: local, ssh, winrm, docker.
* `--backend-cache`, `--no-backend-cache`
    Allow caching for backend command output. (default: true).
* `--bastion-host=BASTION_HOST`
    Specifies the bastion host if applicable.
* `--bastion-port=BASTION_PORT`
    Specifies the bastion port if applicable.
* `--bastion-user=BASTION_USER`
    Specifies the bastion user if applicable.
* `--ca-trust-file=PATH_TO_CA_TRUST_FILE`
    Specify CA certificate required for SSL authentication (WinRM).
* `--client-cert=PATH_TO_CLIENT_CERTIFICATE`
    Specify client certificate required for SSL authentication (WinRM).
* `--client-key=PATH_TO_CLIENT_KEY`
    Specify client key required with client certificate for SSL authentication (WinRM).
* `--client-key-pass=CLIENT_CERT_PASSWORD`
    Specify client certificate password, if required for SSL authentication (WinRM).
* `--command-timeout=SECONDS`
    Maximum seconds to allow a command to run.
* `--config=CONFIG`
    Read configuration from JSON file (`-` reads from stdin).
* `--controls=one two three`
    A list of control names to run, or a list of regular expressions to match against control names. Ignore all other tests.
* `--create-lockfile`, `--no-create-lockfile`
    Write out a lockfile based on this execution (unless one already exists).
* `--distinct-exit`, `--no-distinct-exit`
    Exit with code 101 if any tests fail, and 100 if any are skipped (default).  If disabled, exit 0 on skips and 1 for failures.
* `--docker-url`
    Provides path to Docker API endpoint (Docker). Defaults to unix:///var/run/docker.sock on Unix systems and tcp://localhost:2375 on Windows.
* `--enable-password=ENABLE_PASSWORD`
    Password for enable mode on Cisco IOS devices.
* `--filter-empty-profiles`, `--no-filter-empty-profiles`
    Filter empty profiles (profiles without controls) from the report.
* `--filter-waived-controls`
    Do not execute waived controls in InSpec at all. Must use with --waiver-file. Ignores `run` setting of waiver file.
* `--host=HOST`
    Specify a remote host which is tested.
* `--input=name1=value1 name2=value2`
    Specify one or more inputs directly on the command line, as --input NAME=VALUE. Accepts single-quoted YAML and JSON structures.
* `--input-file=one two three`
    Load one or more input files, a YAML file with values for the profile to use.
* `--insecure`, `--no-insecure`
    Disable SSL verification on select targets.
* `-i`, `--key-files=one two three`
    Login key or certificate file for a remote scan.
* `--password=PASSWORD`
    Login password for a remote scan, if required.
* `--path=PATH`
    Login path to use when connecting to the target (WinRM).
* `-p`, `--port=N`
    Specify the login port for a remote scan.
* `--podman-url`
    Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).
* `--profiles-path=PROFILES_PATH`
    Folder which contains referenced profiles.
* `--proxy-command=PROXY_COMMAND`
    Specifies the command to use to connect to the server.
* `--reporter=one two:/output/file/path`
    Enable one or more output reporters: cli, documentation, html, progress, progress-bar, json, json-min, json-rspec, junit, yaml.
* `--reporter-backtrace-inclusion`, `--no-reporter-backtrace-inclusion`
    Include a code backtrace in report data (default: true).
* `--reporter-include-source`
    Include full source code of controls in the CLI report.
* `--reporter-message-truncation=REPORTER_MESSAGE_TRUNCATION`
    Number of characters to truncate failure messages in report data to (default: no truncation).
* `--self-signed`, `--no-self-signed`
    Allow remote scans with self-signed certificates (WinRM).
* `--shell`, `--no-shell`
    Run scans in a subshell. Only activates on Unix.
* `--shell-command=SHELL_COMMAND`
    Specify a particular shell to use.
* `--shell-options=SHELL_OPTIONS`
    Additional shell options.
* `--show-progress`, `--no-show-progress`
    Show progress while executing tests.
* `--silence-deprecations=all|GROUP GROUP...`
    Suppress deprecation warnings. See install_dir/etc/deprecations.json for list of GROUPs or use 'all'.
* `--ssh-config-file=one two three`
    A list of paths to the SSH configuration file, for example: `~/.ssh/config` or `/etc/ssh/ssh_config`.
* `--ssl`, `--no-ssl`
    Use SSL for transport layer encryption (WinRM).
* `--ssl-peer-fingerprint`
    Specify ssl peer fingerprint in lieu of certificates, for SSL authentication (WinRM).
* `--sudo`, `--no-sudo`
    Run scans with sudo. Only activates on Unix and non-root user.
* `--sudo-command=SUDO_COMMAND`
    Alternate command for sudo.
* `--sudo-options=SUDO_OPTIONS`
    Additional sudo options for a remote scan.
* `--sudo-password=SUDO_PASSWORD`
    Specify a sudo password, if it is required.
* `-t`, `--target=TARGET`
    Simple targeting option using URIs, e.g. ssh://user:pass@host:port.
* `--target-id=TARGET_ID`
    Provide a ID which will be included on reports - deprecated.
* `--tags=one two three`
    A list of tags or a list of regular expressions that match tags. `exec` will run controls referenced by the listed or matching tags.
* `--user=USER`
    The login user for a remote scan.
* `--vendor-cache=VENDOR_CACHE`
    Use the given path for caching dependencies. (default: `~/.inspec/cache`).
* `--waiver-file=one two three`
    Load one or more waiver files.
* `--winrm-basic-auth-only`, `--no-winrm-basic-auth-only`
    Whether to use basic authentication, defaults to false (WinRM).
* `--winrm-disable-sspi`, `--no-winrm-disable-sspi`
    Whether to use disable sspi authentication, defaults to false (WinRM).
* `--winrm-transport=WINRM_TRANSPORT`
    Specify which transport to use, defaults to negotiate (WinRM).
* `--enhanced-outcomes`
    Includes enhanced outcome of controls in report data.

## habitat

Create a Chef Habitat package.

### Syntax

This subcommand has the following syntax:

```bash
inspec habitat SUBCOMMAND
```

## help

Describe available commands or one specific command.

### Syntax

This subcommand has the following syntax:

```bash
inspec help [COMMAND]
```

## init

Scaffold a new project.

### Syntax

This subcommand has the following syntax:

```bash
inspec init TEMPLATE
```

## json

Read all tests in path and generate a json summary.

### Syntax

This subcommand has the following syntax:

```bash
inspec json PATH
```

### Options

This subcommand has the following additional options:

* `--controls=one two three`
    A list of controls to include. Ignore all other tests.
* `-o`, `--output=OUTPUT`
    Save the created profile to a path.
* `--profiles-path=PROFILES_PATH`
    Folder which contains referenced profiles.
* `--tags=one two three`
    A list of tags that reference certain controls. Other controls are ignored.
* `--vendor-cache=VENDOR_CACHE`
    Use the given path for caching dependencies. (default: `~/.inspec/cache`).

## nothing

Does nothing.

### Syntax

This subcommand has the following syntax:

```bash
inspec nothing
```

## plugin

Install and manage [Chef InSpec plugins](/inspec/plugins/).

### Syntax

This subcommand has the following syntax:

```bash
inspec plugin SUBCOMMAND
```

## schema

Print the json schema.

### Syntax

This subcommand has the following syntax:

```bash
inspec schema NAME
```

### Options

This subcommand has the following additional option:

* `--enhanced-outcomes`
    Includes enhanced outcome of controls in report data.

## shell

Open an interactive debugging shell.

### Syntax

This subcommand has the following syntax:

```bash
inspec shell
```

### Options

This subcommand has the following additional options:

* `-b`, `--backend=BACKEND`
    Choose a backend: local, ssh, winrm, docker.
* `--bastion-host=BASTION_HOST`
    Specifies the bastion host if applicable.
* `--bastion-port=BASTION_PORT`
    Specifies the bastion port if applicable.
* `--bastion-user=BASTION_USER`
    Specifies the bastion user if applicable.
* `-c`, `--command=COMMAND`
    A single command string to run instead of launching the shell.
* `--command-timeout=SECONDS`
    Maximum seconds to allow a command to run.
* `--ca-trust-file=PATH_TO_CA_TRUST_FILE`
    Specify CA certificate required for SSL authentication (WinRM).
* `--client-cert=PATH_TO_CLIENT_CERTIFICATE`
    Specify client certificate required for SSL authentication (WinRM).
* `--client-key=PATH_TO_CLIENT_KEY`
    Specify client key required with client certificate for SSL authentication (WinRM).
* `--client-key-pass=CLIENT_CERT_PASSWORD`
    Specify client certificate password, if required for SSL authentication (WinRM).
* `--config=CONFIG`
    Read configuration from JSON file (`-` reads from stdin).
* `--depends=one two three`
    A space-delimited list of local folders containing profiles whose libraries and resources will be loaded into the new shell.
* `--distinct-exit`, `--no-distinct-exit`
    Exit with code 100 if any tests fail, and 101 if any are skipped but none failed (default).  If disabled, exit 0 on skips and 1 for failures.
* `--docker-url`
    Provides path to Docker API endpoint (Docker). Defaults to unix:///var/run/docker.sock on Unix systems and tcp://localhost:2375 on Windows.
* `--enable-password=ENABLE_PASSWORD`
    Password for enable mode on Cisco IOS devices.
* `--host=HOST`
    Specify a remote host which is tested.
* `--insecure`, `--no-insecure`
    Disable SSL verification on select targets.
* `--inspect`, `--no-inspect`
    Use verbose/debugging output for resources.
* `-i`, `--key-files=one two three`
    Login key or certificate file for a remote scan.
* `--password=PASSWORD`
    Login password for a remote scan, if required.
* `--path=PATH`
    Login path to use when connecting to the target (WinRM).
* `-p`, `--port=N`
    Specify the login port for a remote scan.
* `--podman-url`
    Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).
* `--proxy-command=PROXY_COMMAND`
    Specifies the command to use to connect to the server.
* `--reporter=one two:/output/file/path`
    Enable one or more output reporters: cli, documentation, html, progress, json, json-min, json-rspec, junit.
* `--self-signed`, `--no-self-signed`
    Allow remote scans with self-signed certificates (WinRM).
* `--shell`, `--no-shell`
    Run scans in a subshell. Only activates on Unix.
* `--shell-command=SHELL_COMMAND`
    Specify a particular shell to use.
* `--shell-options=SHELL_OPTIONS`
    Additional shell options.
* `--ssh-config-file=one two three`
    A list of paths to the SSH configuration file, for example: `~/.ssh/config` or `/etc/ssh/ssh_config`.
* `--ssl`, `--no-ssl`
    Use SSL for transport layer encryption (WinRM).
* `--ssl-peer-fingerprint=SSL_PEER_FINGERPRINT`
    Specify ssl peer fingerprint in lieu of certificates, for SSL authentication (WinRM).
* `--sudo`, `--no-sudo`
    Run scans with sudo. Only activates on Unix and non-root user.
* `--sudo-command=SUDO_COMMAND`
    Alternate command for sudo.
* `--sudo-options=SUDO_OPTIONS`
    Additional sudo options for a remote scan.
* `--sudo-password=SUDO_PASSWORD`
    Specify a sudo password, if it is required.
* `-t`, `--target=TARGET`
    Simple targeting option using URIs, e.g. ssh://user:pass@host:port.
* `--target-id=TARGET_ID`
    Provide a ID which will be included on reports.
* `--user=USER`
    The login user for a remote scan.
* `--winrm-basic-auth-only`, `--no-winrm-basic-auth-only`
    Whether to use basic authentication, defaults to false (WinRM).
* `--winrm-disable-sspi`, `--no-winrm-disable-sspi`
    Whether to use disable sspi authentication, defaults to false (WinRM).
* `--winrm-transport=WINRM_TRANSPORT`
    Specify which transport to use, defaults to negotiate (WinRM).
* `--enhanced-outcomes`
    Includes enhanced outcome of controls in report data.

## supermarket

Supermarket commands.

### Syntax

This subcommand has the following syntax:

```bash
inspec supermarket SUBCOMMAND ...
```

### Options

This subcommand has additional options:

* `--supermarket_url`
    Specify the URL of a private Chef Supermarket.

## vendor

Download all dependencies and generate a lockfile in a `vendor` directory.

### Syntax

This subcommand has the following syntax:

```bash
inspec vendor PATH
```

### Options

This subcommand has additional options:

* `--overwrite`, `--no-overwrite`
    Overwrite existing vendored dependencies and lockfile.

## version

Prints the version of this tool.

### Syntax

This subcommand has the following syntax:

```bash
inspec version
```

### Options

This subcommand has the following additional options:

* `--format=FORMAT`
