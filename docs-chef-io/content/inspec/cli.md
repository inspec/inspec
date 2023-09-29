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

<dl>
<dt><code>--airgap</code>, <code>--no-airgap</code></dt>
<dd>Fallback to using local archives if fetching fails.</dd>

<dt><code>--auto-install-gems</code>, <code>--no-auto-install-gems</code></dt>
<dd>Auto installs gem dependencies of the profile or resource pack.</dd>

<dt><code>--check</code>, <code>--no-check</code></dt>
<dd>Before running archive, run `inspec check`. Default: do not check.</dd>

<dt><code>--export</code>, <code>--no-export</code></dt>
<dd>Include an inspec.json file in the archive, the results of running `inspec export`.</dd>

<dt><code>--ignore-errors</code>, <code>--no-ignore-errors</code></dt>
<dd>Ignore profile warnings.</dd>

<dt><code>-o</code>, <code>--output=OUTPUT</code></dt>
<dd>Save the archive to a path.</dd>

<dt><code>--overwrite</code>, <code>--no-overwrite</code></dt>
<dd>Overwrite existing archive.</dd>

<dt><code>--profiles-path=PROFILES_PATH</code></dt>
<dd>Folder which contains referenced profiles.</dd>

<dt><code>--tar</code>, <code>--no-tar</code></dt>
<dd>Generates a tar.gz archive.</dd>

<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: ~/.inspec/cache).</dd>

<dt><code>--zip</code>, <code>--no-zip</code></dt>
<dd>Generates a zip archive.</dd>

</dl>

## check

Verify the metadata in the `inspec.yml` file,  verify that control blocks have the correct fields (title, description, impact),  and define that all controls have visible tests and the controls are not using deprecated inspec dsl code

### Syntax

This subcommand has the following syntax:

```bash
inspec check PATH
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--auto-install-gems</code>, <code>--no-auto-install-gems</code></dt>
<dd>Auto installs gem dependencies of the profile or resource pack.</dd>

<dt><code>--format=FORMAT</code></dt>
<dd>The output format to use. Valid values: `json` and `doc`. Default value: `doc`.</dd>

<dt><code>--profiles-path=PROFILES_PATH</code></dt>
<dd>Folder which contains referenced profiles.</dd>

<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: ~/.inspec/cache).</dd>

<dt><code>--with-cookstyle</code>, <code>--no-with-cookstyle</code></dt>
<dd>Enable or disable cookstyle checks.</dd>

</dl>

## clear_cache

Clears the inspec cache. useful for debugging.

### Syntax

This subcommand has the following syntax:

```bash
inspec clear_cache
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: `~/.inspec/cache`).</dd>

</dl>

## detect

Detects the target os.

### Syntax

This subcommand has the following syntax:

```bash
inspec detect
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>-b</code>, <code>--backend=BACKEND</code></dt>
<dd>Choose a backend: local, ssh, winrm, docker.</dd>

<dt><code>--bastion-host=BASTION_HOST</code></dt>
<dd>Specifies the bastion host if applicable.</dd>

<dt><code>--bastion-port=BASTION_PORT</code></dt>
<dd>Specifies the bastion port if applicable.</dd>

<dt><code>--bastion-user=BASTION_USER</code></dt>
<dd>Specifies the bastion user if applicable.</dd>

<dt><code>--ca-trust-file=CA_TRUST_FILE</code></dt>
<dd>Specify CA certificate required for SSL authentication (WinRM).</dd>

<dt><code>--client-cert=CLIENT_CERT</code></dt>
<dd>Specify client certificate for SSL authentication</dd>

<dt><code>--client-key=CLIENT_KEY</code></dt>
<dd>Specify client key required with client cert for SSL authentication</dd>

<dt><code>--client-key-pass=CLIENT_KEY_PASS</code></dt>
<dd>Specify client cert password, if required for SSL authentication</dd>

<dt><code>--config=CONFIG</code></dt>
<dd>Read configuration from JSON file (`-` reads from stdin).</dd>

<dt><code>--docker-url=DOCKER_URL</code></dt>
<dd>Provides path to Docker API endpoint (Docker). Defaults to unix:///var/run/docker.sock on Unix systems and tcp://localhost:2375 on Windows.</dd>

<dt><code>--enable-password=ENABLE_PASSWORD</code></dt>
<dd>Password for enable mode on Cisco IOS devices.</dd>

<dt><code>--format=FORMAT</code></dt>
<dt><code>--host=HOST</code></dt>
<dd>Specify a remote host which is tested.</dd>

<dt><code>--insecure</code>, <code>--no-insecure</code></dt>
<dd>Disable SSL verification on select targets.</dd>

<dt><code>-i</code>, <code>--key-files=one two three</code></dt>
<dd>Login key or certificate file for a remote scan.</dd>

<dt><code>--password=PASSWORD</code></dt>
<dd>Login password for a remote scan, if required.</dd>

<dt><code>--path=PATH</code></dt>
<dd>Login path to use when connecting to the target (WinRM).</dd>

<dt><code>--podman-url=PODMAN_URL</code></dt>
<dd>Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).</dd>

<dt><code>-p</code>, <code>--port=N</code></dt>
<dd>Specify the login port for a remote scan.</dd>

<dt><code>--proxy-command=PROXY_COMMAND</code></dt>
<dd>Specifies the command to use to connect to the server.</dd>

<dt><code>--self-signed</code>, <code>--no-self-signed</code></dt>
<dd>Allow remote scans with self-signed certificates (WinRM).</dd>

<dt><code>--shell</code>, <code>--no-shell</code></dt>
<dd>Run scans in a subshell. Only activates on Unix.</dd>

<dt><code>--shell-command=SHELL_COMMAND</code></dt>
<dd>Specify a particular shell to use.</dd>

<dt><code>--shell-options=SHELL_OPTIONS</code></dt>
<dd>Additional shell options.</dd>

<dt><code>--ssh-config-file=one two three</code></dt>
<dd>A list of paths to the ssh config file, e.g ~/.ssh/config or /etc/ssh/ssh_config.</dd>

<dt><code>--ssl</code>, <code>--no-ssl</code></dt>
<dd>Use SSL for transport layer encryption (WinRM).</dd>

<dt><code>--ssl-peer-fingerprint=SSL_PEER_FINGERPRINT</code></dt>
<dd>Specify SSL peer fingerprint in place of certificates for SSL authentication (WinRM).</dd>

<dt><code>--sudo</code>, <code>--no-sudo</code></dt>
<dd>Run scans with sudo. Only activates on Unix and non-root user.</dd>

<dt><code>--sudo-command=SUDO_COMMAND</code></dt>
<dd>Alternate command for sudo.</dd>

<dt><code>--sudo-options=SUDO_OPTIONS</code></dt>
<dd>Additional sudo options for a remote scan.</dd>

<dt><code>--sudo-password=SUDO_PASSWORD</code></dt>
<dd>Specify a sudo password, if it is required.</dd>

<dt><code>-t</code>, <code>--target=TARGET</code></dt>
<dd>Simple targeting option using URIs, e.g. ssh://user:pass@host:port</dd>

<dt><code>--target-id=TARGET_ID</code></dt>
<dd>Provide an ID which will be included on reports - deprecated</dd>

<dt><code>--user=USER</code></dt>
<dd>The login user for a remote scan.</dd>

<dt><code>--winrm-basic-auth-only</code>, <code>--no-winrm-basic-auth-only</code></dt>
<dd>Whether to use basic authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-disable-sspi</code>, <code>--no-winrm-disable-sspi</code></dt>
<dd>Whether to use disable sspi authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-shell-type=WINRM_SHELL_TYPE</code></dt>
<dd>Specify which shell type to use (powershell, elevated, or cmd), which defaults to powershell (WinRM).</dd>

<dt><code>--winrm-transport=WINRM_TRANSPORT</code></dt>
<dd>Specify which transport to use, defaults to negotiate (WinRM).</dd>

</dl>

## env

Outputs shell-appropriate completion configuration.

### Syntax

This subcommand has the following syntax:

```bash
inspec env
```

## exec

Run all test files at the specified locations.

The subcommand loads the given profiles, fetches their dependencies if needed, then connects to the target and executes any controls in the profiles.
One or more reporters are used to generate the output.
```
Exit codes:
    0  Normal exit, all tests passed
    1  Usage or general error
    2  Error in plugin system
    3  Fatal deprecation encountered
  100  Normal exit, at least one test failed
  101  Normal exit, at least one test skipped but none failed
  172  Chef License not accepted
```

Below are some examples of using `exec` with different test LOCATIONS:

Chef Automate:
  ```
  inspec automate login
  inspec exec compliance://username/linux-baseline
  ```
  `inspec compliance` is a backwards compatible alias for `inspec automate` and works the same way:
  ```
  inspec compliance login
  ```

Chef Supermarket:
  ```
  inspec exec supermarket://username/linux-baseline
  ```

Local profile (executes all tests in `controls/`):
  ```
  inspec exec /path/to/profile
  ```

Local single test (doesn't allow inputs or custom resources)
  ```
  inspec exec /path/to/a_test.rb
  ```

Git via SSH
  ```
  inspec exec git@github.com:dev-sec/linux-baseline.git
  ```

Git via HTTPS (.git suffix is required):
  ```
  inspec exec https://github.com/dev-sec/linux-baseline.git
  ```

Private Git via HTTPS (.git suffix is required):
  ```
  inspec exec https://API_TOKEN@github.com/dev-sec/linux-baseline.git
  ```

Private Git via HTTPS and cached credentials (.git suffix is required):
  ```
  git config credential.helper cache
  git ls-remote https://github.com/dev-sec/linux-baseline.git
  inspec exec https://github.com/dev-sec/linux-baseline.git
  ```

Web hosted file (also supports .zip):
  ```
  inspec exec https://webserver/linux-baseline.tar.gz
  ```

Web hosted file with basic authentication (supports .zip):
  ```
  inspec exec https://username:password@webserver/linux-baseline.tar.gz
  ```


### Syntax

This subcommand has the following syntax:

```bash
inspec exec LOCATIONS
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--attrs=one two three</code></dt>
<dd>Legacy name for --input-file - deprecated.</dd>

<dt><code>--auto-install-gems</code>, <code>--no-auto-install-gems</code></dt>
<dd>Auto installs gem dependencies of the profile or resource pack.</dd>

<dt><code>-b</code>, <code>--backend=BACKEND</code></dt>
<dd>Choose a backend: local, ssh, winrm, docker.</dd>

<dt><code>--backend-cache</code>, <code>--no-backend-cache</code></dt>
<dd>Allow caching for backend command output. (default: true).</dd>

<dt><code>--bastion-host=BASTION_HOST</code></dt>
<dd>Specifies the bastion host if applicable.</dd>

<dt><code>--bastion-port=BASTION_PORT</code></dt>
<dd>Specifies the bastion port if applicable.</dd>

<dt><code>--bastion-user=BASTION_USER</code></dt>
<dd>Specifies the bastion user if applicable.</dd>

<dt><code>--ca-trust-file=CA_TRUST_FILE</code></dt>
<dd>Specify CA certificate required for SSL authentication (WinRM).</dd>

<dt><code>--client-cert=CLIENT_CERT</code></dt>
<dd>Specify client certificate for SSL authentication</dd>

<dt><code>--client-key=CLIENT_KEY</code></dt>
<dd>Specify client key required with client cert for SSL authentication</dd>

<dt><code>--client-key-pass=CLIENT_KEY_PASS</code></dt>
<dd>Specify client cert password, if required for SSL authentication</dd>

<dt><code>--command-timeout=N</code></dt>
<dd>Maximum seconds to allow commands to run during execution.</dd>

<dt><code>--config=CONFIG</code></dt>
<dd>Read configuration from JSON file (`-` reads from stdin).</dd>

<dt><code>--controls=one two three</code></dt>
<dd>A list of control names to run, or a list of /regexes/ to match against control names. Ignore all other tests.</dd>

<dt><code>--create-lockfile</code>, <code>--no-create-lockfile</code></dt>
<dd>Write out a lockfile based on this execution (unless one already exists)</dd>

<dt><code>--diff</code>, <code>--no-diff</code></dt>
<dd>Use --no-diff to suppress 'diff' output of failed textual test results.</dd>

<dt><code>--distinct-exit</code>, <code>--no-distinct-exit</code></dt>
<dd>Exit with code 101 if any tests fail, and 100 if any are skipped (default).  If disabled, exit 0 on skips and 1 for failures.</dd>

<dt><code>--docker-url=DOCKER_URL</code></dt>
<dd>Provides path to Docker API endpoint (Docker). Defaults to unix:///var/run/docker.sock on Unix systems and tcp://localhost:2375 on Windows.</dd>

<dt><code>--enable-password=ENABLE_PASSWORD</code></dt>
<dd>Password for enable mode on Cisco IOS devices.</dd>

<dt><code>--enhanced-outcomes</code>, <code>--no-enhanced-outcomes</code></dt>
<dd>Show enhanced outcomes in output</dd>

<dt><code>--filter-empty-profiles</code>, <code>--no-filter-empty-profiles</code></dt>
<dd>Filter empty profiles (profiles without controls) from the report.</dd>

<dt><code>--filter-waived-controls</code>, <code>--no-filter-waived-controls</code></dt>
<dd>Do not execute waived controls in InSpec at all. Must use with --waiver-file. Ignores the `run` setting of the waiver file.</dd>

<dt><code>--host=HOST</code></dt>
<dd>Specify a remote host which is tested.</dd>

<dt><code>--input=name1=value1 name2=value2</code></dt>
<dd>Specify one or more inputs directly on the command line, as --input NAME=VALUE. Accepts single-quoted YAML and JSON structures.</dd>

<dt><code>--input-file=one two three</code></dt>
<dd>Load one or more input files, a YAML file with values for the profile to use.</dd>

<dt><code>--insecure</code>, <code>--no-insecure</code></dt>
<dd>Disable SSL verification on select targets.</dd>

<dt><code>-i</code>, <code>--key-files=one two three</code></dt>
<dd>Login key or certificate file for a remote scan.</dd>

<dt><code>--password=PASSWORD</code></dt>
<dd>Login password for a remote scan, if required.</dd>

<dt><code>--path=PATH</code></dt>
<dd>Login path to use when connecting to the target (WinRM).</dd>

<dt><code>--podman-url=PODMAN_URL</code></dt>
<dd>Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).</dd>

<dt><code>-p</code>, <code>--port=N</code></dt>
<dd>Specify the login port for a remote scan.</dd>

<dt><code>--profiles-path=PROFILES_PATH</code></dt>
<dd>Folder which contains referenced profiles.</dd>

<dt><code>--proxy-command=PROXY_COMMAND</code></dt>
<dd>Specifies the command to use to connect to the server.</dd>

<dt><code>--reporter=one two:/output/file/path</code></dt>
<dd>Enable one or more output reporters: cli, documentation, html, progress, progress-bar, json, json-min, json-rspec, junit, yaml</dd>

<dt><code>--reporter-backtrace-inclusion</code>, <code>--no-reporter-backtrace-inclusion</code></dt>
<dd>Include a code backtrace in report data (default: true)</dd>

<dt><code>--reporter-include-source</code>, <code>--no-reporter-include-source</code></dt>
<dd>Include full source code of controls in the CLI report</dd>

<dt><code>--reporter-message-truncation=REPORTER_MESSAGE_TRUNCATION</code></dt>
<dd>Number of characters to truncate failure messages and code_desc in report data to (default: no truncation)</dd>

<dt><code>--retain-waiver-data</code>, <code>--no-retain-waiver-data</code></dt>
<dd>EXPERIMENTAL: Only works in conjunction with --filter-waived-controls, retains waiver data about controls that were skipped</dd>

<dt><code>--self-signed</code>, <code>--no-self-signed</code></dt>
<dd>Allow remote scans with self-signed certificates (WinRM).</dd>

<dt><code>--shell</code>, <code>--no-shell</code></dt>
<dd>Run scans in a subshell. Only activates on Unix.</dd>

<dt><code>--shell-command=SHELL_COMMAND</code></dt>
<dd>Specify a particular shell to use.</dd>

<dt><code>--shell-options=SHELL_OPTIONS</code></dt>
<dd>Additional shell options.</dd>

<dt><code>--show-progress</code>, <code>--no-show-progress</code></dt>
<dd>Show progress while executing tests.</dd>

<dt><code>--silence-deprecations=all|GROUP GROUP...</code></dt>
<dd>Suppress deprecation warnings. See install_dir/etc/deprecations.json for a list of GROUPs or use 'all'.</dd>

<dt><code>--sort-results-by=--sort-results-by=none|control|file|random</code></dt>
<dd>After normal execution order, results are sorted by control ID, or by file (default), or randomly. None uses legacy unsorted mode.</dd>

<dt><code>--ssh-config-file=one two three</code></dt>
<dd>A list of paths to the ssh config file, e.g ~/.ssh/config or /etc/ssh/ssh_config.</dd>

<dt><code>--ssl</code>, <code>--no-ssl</code></dt>
<dd>Use SSL for transport layer encryption (WinRM).</dd>

<dt><code>--ssl-peer-fingerprint=SSL_PEER_FINGERPRINT</code></dt>
<dd>Specify SSL peer fingerprint in place of certificates for SSL authentication (WinRM).</dd>

<dt><code>--sudo</code>, <code>--no-sudo</code></dt>
<dd>Run scans with sudo. Only activates on Unix and non-root user.</dd>

<dt><code>--sudo-command=SUDO_COMMAND</code></dt>
<dd>Alternate command for sudo.</dd>

<dt><code>--sudo-options=SUDO_OPTIONS</code></dt>
<dd>Additional sudo options for a remote scan.</dd>

<dt><code>--sudo-password=SUDO_PASSWORD</code></dt>
<dd>Specify a sudo password, if it is required.</dd>

<dt><code>--supermarket-url=SUPERMARKET_URL</code></dt>
<dd>Specify the URL of a private Chef Supermarket.</dd>

<dt><code>--tags=one two three</code></dt>
<dd>A list of tags names that are part of controls to filter and run controls, or a list of /regexes/ to match against tags names of controls. Ignore all other tests.</dd>

<dt><code>-t</code>, <code>--target=TARGET</code></dt>
<dd>Simple targeting option using URIs, e.g. ssh://user:pass@host:port</dd>

<dt><code>--target-id=TARGET_ID</code></dt>
<dd>Provide an ID which will be included on reports - deprecated</dd>

<dt><code>--user=USER</code></dt>
<dd>The login user for a remote scan.</dd>

<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: ~/.inspec/cache).</dd>

<dt><code>--waiver-file=one two three</code></dt>
<dd>Load one or more waiver files.</dd>

<dt><code>--winrm-basic-auth-only</code>, <code>--no-winrm-basic-auth-only</code></dt>
<dd>Whether to use basic authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-disable-sspi</code>, <code>--no-winrm-disable-sspi</code></dt>
<dd>Whether to use disable sspi authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-shell-type=WINRM_SHELL_TYPE</code></dt>
<dd>Specify which shell type to use (powershell, elevated, or cmd), which defaults to powershell (WinRM).</dd>

<dt><code>--winrm-transport=WINRM_TRANSPORT</code></dt>
<dd>Specify which transport to use, defaults to negotiate (WinRM).</dd>

</dl>

## export

Read the profile in path and generate a summary in the given format.

### Syntax

This subcommand has the following syntax:

```bash
inspec export PATH
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--auto-install-gems</code>, <code>--no-auto-install-gems</code></dt>
<dd>Auto installs gem dependencies of the profile or resource pack.</dd>

<dt><code>--controls=one two three</code></dt>
<dd>For --what=profile, a list of controls to include. Ignore all other tests.</dd>

<dt><code>--format=FORMAT</code></dt>
<dd>The output format to use: json, raw, yaml. If valid format is not provided then it will use the default for the given 'what'.</dd>

<dt><code>-o</code>, <code>--output=OUTPUT</code></dt>
<dd>Save the created output to a path.</dd>

<dt><code>--profiles-path=PROFILES_PATH</code></dt>
<dd>Folder which contains referenced profiles.</dd>

<dt><code>--tags=one two three</code></dt>
<dd>For --what=profile, a list of tags to filter controls and include only those. Ignore all other tests.</dd>

<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: ~/.inspec/cache).</dd>

<dt><code>--what=WHAT</code></dt>
<dd>What to export: profile (default), readme, metadata.</dd>

</dl>

## help

Describe available commands or one specific command

### Syntax

This subcommand has the following syntax:

```bash
inspec help [COMMAND]
```

## json

Read all tests in the path and generate a json summary.

### Syntax

This subcommand has the following syntax:

```bash
inspec json PATH
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--auto-install-gems</code>, <code>--no-auto-install-gems</code></dt>
<dd>Auto installs gem dependencies of the profile or resource pack.</dd>

<dt><code>--controls=one two three</code></dt>
<dd>A list of controls to include. Ignore all other tests.</dd>

<dt><code>-o</code>, <code>--output=OUTPUT</code></dt>
<dd>Save the created profile to a path.</dd>

<dt><code>--profiles-path=PROFILES_PATH</code></dt>
<dd>Folder which contains referenced profiles.</dd>

<dt><code>--tags=one two three</code></dt>
<dd>A list of tags to filter controls and include only those. Ignore all other tests.</dd>

<dt><code>--vendor-cache=VENDOR_CACHE</code></dt>
<dd>Use the given path for caching dependencies, (default: ~/.inspec/cache).</dd>

</dl>

## run_context

Used to test run-context detection

### Syntax

This subcommand has the following syntax:

```bash
inspec run_context
```

## schema

Print the json schema

### Syntax

This subcommand has the following syntax:

```bash
inspec schema NAME
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--enhanced-outcomes</code>, <code>--no-enhanced-outcomes</code></dt>
<dd>Show enhanced outcomes output</dd>

</dl>

## shell

Open an interactive debugging shell.

### Syntax

This subcommand has the following syntax:

```bash
inspec shell
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>-b</code>, <code>--backend=BACKEND</code></dt>
<dd>Choose a backend: local, ssh, winrm, docker.</dd>

<dt><code>--bastion-host=BASTION_HOST</code></dt>
<dd>Specifies the bastion host if applicable.</dd>

<dt><code>--bastion-port=BASTION_PORT</code></dt>
<dd>Specifies the bastion port if applicable.</dd>

<dt><code>--bastion-user=BASTION_USER</code></dt>
<dd>Specifies the bastion user if applicable.</dd>

<dt><code>--ca-trust-file=CA_TRUST_FILE</code></dt>
<dd>Specify CA certificate required for SSL authentication (WinRM).</dd>

<dt><code>--client-cert=CLIENT_CERT</code></dt>
<dd>Specify client certificate for SSL authentication</dd>

<dt><code>--client-key=CLIENT_KEY</code></dt>
<dd>Specify client key required with client cert for SSL authentication</dd>

<dt><code>--client-key-pass=CLIENT_KEY_PASS</code></dt>
<dd>Specify client cert password, if required for SSL authentication</dd>

<dt><code>-c</code>, <code>--command=COMMAND</code></dt>
<dd>A single command string to run instead of launching the shell</dd>

<dt><code>--command-timeout=N</code></dt>
<dd>Maximum seconds to allow a command to run.</dd>

<dt><code>--config=CONFIG</code></dt>
<dd>Read configuration from JSON file (`-` reads from stdin).</dd>

<dt><code>--depends=one two three</code></dt>
<dd>A space-delimited list of local folders containing profiles whose libraries and resources will be loaded into the new shell</dd>

<dt><code>--distinct-exit</code>, <code>--no-distinct-exit</code></dt>
<dd>Exit with code 100 if any tests fail, and 101 if any are skipped but none failed (default).  If disabled, exit 0 on skips and 1 for failures.</dd>

<dt><code>--docker-url=DOCKER_URL</code></dt>
<dd>Provides path to Docker API endpoint (Docker). Defaults to unix:///var/run/docker.sock on Unix systems and tcp://localhost:2375 on Windows.</dd>

<dt><code>--enable-password=ENABLE_PASSWORD</code></dt>
<dd>Password for enable mode on Cisco IOS devices.</dd>

<dt><code>--enhanced-outcomes</code>, <code>--no-enhanced-outcomes</code></dt>
<dd>Show enhanced outcomes in output</dd>

<dt><code>--host=HOST</code></dt>
<dd>Specify a remote host which is tested.</dd>

<dt><code>--input=name1=value1 name2=value2</code></dt>
<dd>Specify one or more inputs directly on the command line to the shell, as --input NAME=VALUE. Accepts single-quoted YAML and JSON structures.</dd>

<dt><code>--input-file=one two three</code></dt>
<dd>Load one or more input files, a YAML file with values for the shell to use</dd>

<dt><code>--insecure</code>, <code>--no-insecure</code></dt>
<dd>Disable SSL verification on select targets.</dd>

<dt><code>--inspect</code>, <code>--no-inspect</code></dt>
<dd>Use verbose/debugging output for resources.</dd>

<dt><code>-i</code>, <code>--key-files=one two three</code></dt>
<dd>Login key or certificate file for a remote scan.</dd>

<dt><code>--password=PASSWORD</code></dt>
<dd>Login password for a remote scan, if required.</dd>

<dt><code>--path=PATH</code></dt>
<dd>Login path to use when connecting to the target (WinRM).</dd>

<dt><code>--podman-url=PODMAN_URL</code></dt>
<dd>Provides the path to the Podman API endpoint. Defaults to unix:///run/user/$UID/podman/podman.sock for rootless container, unix:///run/podman/podman.sock for rootful container (for this you need to execute inspec as root user).</dd>

<dt><code>-p</code>, <code>--port=N</code></dt>
<dd>Specify the login port for a remote scan.</dd>

<dt><code>--proxy-command=PROXY_COMMAND</code></dt>
<dd>Specifies the command to use to connect to the server.</dd>

<dt><code>--reporter=one two:/output/file/path</code></dt>
<dd>Enable one or more output reporters: cli, documentation, html, progress, json, json-min, json-rspec, junit</dd>

<dt><code>--self-signed</code>, <code>--no-self-signed</code></dt>
<dd>Allow remote scans with self-signed certificates (WinRM).</dd>

<dt><code>--shell</code>, <code>--no-shell</code></dt>
<dd>Run scans in a subshell. Only activates on Unix.</dd>

<dt><code>--shell-command=SHELL_COMMAND</code></dt>
<dd>Specify a particular shell to use.</dd>

<dt><code>--shell-options=SHELL_OPTIONS</code></dt>
<dd>Additional shell options.</dd>

<dt><code>--ssh-config-file=one two three</code></dt>
<dd>A list of paths to the ssh config file, e.g ~/.ssh/config or /etc/ssh/ssh_config.</dd>

<dt><code>--ssl</code>, <code>--no-ssl</code></dt>
<dd>Use SSL for transport layer encryption (WinRM).</dd>

<dt><code>--ssl-peer-fingerprint=SSL_PEER_FINGERPRINT</code></dt>
<dd>Specify SSL peer fingerprint in place of certificates for SSL authentication (WinRM).</dd>

<dt><code>--sudo</code>, <code>--no-sudo</code></dt>
<dd>Run scans with sudo. Only activates on Unix and non-root user.</dd>

<dt><code>--sudo-command=SUDO_COMMAND</code></dt>
<dd>Alternate command for sudo.</dd>

<dt><code>--sudo-options=SUDO_OPTIONS</code></dt>
<dd>Additional sudo options for a remote scan.</dd>

<dt><code>--sudo-password=SUDO_PASSWORD</code></dt>
<dd>Specify a sudo password, if it is required.</dd>

<dt><code>-t</code>, <code>--target=TARGET</code></dt>
<dd>Simple targeting option using URIs, e.g. ssh://user:pass@host:port</dd>

<dt><code>--target-id=TARGET_ID</code></dt>
<dd>Provide an ID which will be included on reports - deprecated</dd>

<dt><code>--user=USER</code></dt>
<dd>The login user for a remote scan.</dd>

<dt><code>--winrm-basic-auth-only</code>, <code>--no-winrm-basic-auth-only</code></dt>
<dd>Whether to use basic authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-disable-sspi</code>, <code>--no-winrm-disable-sspi</code></dt>
<dd>Whether to use disable sspi authentication, defaults to false (WinRM).</dd>

<dt><code>--winrm-shell-type=WINRM_SHELL_TYPE</code></dt>
<dd>Specify which shell type to use (powershell, elevated, or cmd), which defaults to powershell (WinRM).</dd>

<dt><code>--winrm-transport=WINRM_TRANSPORT</code></dt>
<dd>Specify which transport to use, defaults to negotiate (WinRM).</dd>

</dl>

## supermarket

Supermarket commands

### Syntax

This subcommand has the following syntax:

```bash
inspec supermarket SUBCOMMAND ...
```

## vendor

Download all dependencies and generate a lockfile in a `vendor` directory

### Syntax

This subcommand has the following syntax:

```bash
inspec vendor PATH
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--overwrite</code>, <code>--no-overwrite</code></dt>
<dd>Overwrite existing vendored dependencies and lockfile.</dd>

</dl>

## version

Prints the version of this tool.

### Syntax

This subcommand has the following syntax:

```bash
inspec version
```

### Options

This subcommand has the following additional options:

<dl>
<dt><code>--format=FORMAT</code></dt>
</dl>

