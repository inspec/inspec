+++
title = "InSpec Profile Controls"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Controls"
    identifier = "inspec/profiles/controls"
    parent = "inspec/profiles"
    weight = 30
+++

Controls define the regulatory recommendations or requirements for the state of a system.

Controls are written in Ruby using the InSpec DSL, which is a Ruby DSL for writing audit controls and includes audit resources that you can invoke.

## Controls location

Add the controls to the `controls` directory at the root of a profile.

```text
examples/profile
├── controls
│   └── example.rb
└── inspec.yml
```

## Syntax

The following resource tests |ssh| server configuration. For example, a simple control may described as:

```ruby
describe sshd_config do
  its('Port') { should cmp 22 }
end
```

In various use cases like implementing IT compliance across different departments, it becomes handy to extend the control with metadata. Each control may define an additional `impact`, `title` or `desc`. An example looks like:

```ruby
control 'sshd-8' do
  impact 0.6
  title 'Server: Configure the service port'
  desc 'Always specify which port the SSH server should listen.'
  desc 'rationale', 'This ensures that there are no unexpected settings'
  tag 'ssh','sshd','openssh-server'
  tag cce: 'CCE-27072-8'
  ref 'NSA-RH6-STIG - Section 3.5.2.1', url: 'https://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf'

  describe sshd_config do
    its('Port') { should cmp 22 }
  end
end
```

### Control properties

Name

: The name of the control is a unique control ID that's initialized at the beginning of the control block.

  `sshd-8` is the control name in the example above.

`impact`

: The importance of the compliance results.

  Data type: String, Float

  Possible string values (based on CVSS 3.0):

  - `none`
  - `low`
  - `medium`
  - `high`
  - `critical`

  Numeric values must be between `0.0` and `1.0`. The value ranges are:

  - `0.0 to <0.01` these are controls with no impact, they only provide information
  - `0.01 to <0.4` these are controls with low impact
  - `0.4 to <0.7` these are controls with medium impact
  - `0.7 to <0.9` these are controls with high impact
  - `0.9 to 1.0` these are critical controls

`title`

: A human-readable title for the control block.

  Optional

`desc`

: A human-readable description of the what the control block does.

  `desc` may include two arguments. The first argument is used as a header when rendering in Chef Automate. For example:

  `desc 'rationale', 'This ensures that there are no unexpected settings'`

  Optional

`tag`

: Meta-information with key or key-value pairs.

  Optional

`ref`
:  A reference to an external document

`describe`
: A describe block invokes an [InSpec resource](/inspec/resources/) or [custom resource](/inspec/profiles/custom_resources/) and encloses tests that apply to that resource. Group multiple related describe blocks under one control.

## Advanced concepts

### Check if at least one condition passes

Use `describe.one` to define a set of `describe` blocks where only one block needs to pass.
For example, if you configure a setting in two different locations, then you may want to test if either configuration A or configuration B is set.

```ruby
describe.one do
  describe ConfigurationA do
    its('setting_1') { should eq true }
  end

  describe ConfigurationB do
    its('setting_2') { should eq true }
  end
end
```

`describe.one` has the following conditions:

- A `describe.one` block passes if one of its nested `describe` blocks has all assertions passing. A `describe.one` block needs an entire `describe` block to pass and not just a single assertion.
- Chef InSpec will always evaluate all the tests contained within `describe.one`. It does not short-circuit upon evaluating a passing `describe` block.
- Nesting a `describe.one` block inside another `describe.one` block is not supported.

### Sensitive resources

Use the `:sensitive` flag in resource definition to suppress the output an audit.

For example, you may write checks that involve resources with sensitive content, such as a file resource.

```ruby
describe file('/tmp/mysecretfile'), :sensitive do
  its('content') { should match /secret_info/ }
end
```

## Examples

The following examples show simple compliance tests using a single `control` block.

### Test password complexity

The following test shows how to audit machines running Windows 2012 R2 that password complexity is enabled:

```ruby
control 'windows-account-102' do
  impact 'critical'
  title 'Windows Password Complexity is Enabled'
  desc 'Password must meet complexity requirement'
  describe security_policy do
    its('PasswordComplexity') { should cmp 1 }
  end
end
```

### Test if PostgreSQL passwords are empty

The following test shows how to audit machines running PostgreSQL to ensure that passwords are not empty.

```ruby
control 'postgres-7' do
  impact 1.0
  title "Don't allow empty passwords"
  describe postgres_session('user', 'pass').query("SELECT * FROM pg_shadow WHERE passwd IS NULL;") do
    its('output') { should cmp '' }
  end
end
```

### Test if MySQL passwords are in ENV

The following test shows how to audit machines running MySQL to ensure that passwords are not stored in `ENV`:

```ruby
control 'mysql-3' do
  impact 1.0
  title 'Do not store your MySQL password in your ENV'
  desc '
    Storing credentials in your ENV may easily expose
    them to an attacker. Prevent this at all costs.
  '
  describe command('env') do
    its('stdout') { should_not match /^MYSQL_PWD=/ }
  end
end
```

### Test if `/etc/ssh` is a directory

The following test shows how to audit machines to ensure that `/etc/ssh` is a directory:

```ruby
control 'basic-1' do
  impact 1.0
  title '/etc/ssh should be a directory'
  desc '
    In order for OpenSSH to function correctly, its
    configuration path must be a folder.
  '
  describe file('/etc/ssh') do
    it { should be_directory }
  end
end
```

### Test if Apache running

The following test shows how to audit machines to ensure that Apache is enabled and running:

```ruby
control 'apache-1' do
  impact 'medium'
  title 'Apache2 should be configured and running'
  describe service(apache.service) do
    it { should be_enabled }
    it { should be_running }
  end
end
```

### Test if insecure packages are installed

The following test shows how to audit machines for insecure packages:

```ruby
control 'cis-os-services-5.1.3' do
  impact 0.7
  title '5.1.3 Ensure rsh client is not installed'
  describe package('rsh') do
    it { should_not be_installed }
  end
  describe package('rsh-redone-client') do
    it { should_not be_installed }
  end
end
```

### Test Windows Registry Keys

The following test shows how to audit machines to ensure Safe DLL Search Mode is enabled:

```ruby
control 'windows-base-101' do
  impact 1.0
  title 'Safe DLL Search Mode is Enabled'
  desc '
    @link: https://msdn.microsoft.com/en-us/library/ms682586(v=vs.85).aspx
  '
  describe registry_key('HKLM\\System\\CurrentControlSet\\Control\\Session Manager') do
    it { should exist }
    it { should_not have_property_value('SafeDllSearchMode', :type_dword, '0') }
  end
end
```

### Use `only_if` to exclude a specific control

This example shows how to allow skipping certain controls if conditions are not
met by using `only_if`. In this example, the control will not be performed if
the `redis-cli` command does not exist. A optional message can say why it was skipped.

```ruby
control 'nutcracker-connect-redis-001' do
  impact 'critical'
  title 'Check if nutcracker can pass commands to redis'
  desc 'execute redis-cli set key command, to check connectivity of the service'

  only_if('redis is not installed.') do
    command('redis-cli').exist?
  end

  describe command('redis-cli SET test_inspec "HELLO"') do
    its('stdout') { should match /OK/ }
  end
end
```

This example checks for if certain pip packages are installed, but only if '/root/.aws' exists:

```ruby
control 'pip-packages-installed' do
  title 'Check if essential pips are installed'
  only_if('aws-cli config not created.') do
    directory('/root/.aws').exist?
  end
  %w(aws-mfa PyYAML awscli).each do |aws_pip_deps|
    describe pip(aws_pip_deps) do
      it { should be_installed }
    end
  end
end
```

Mixing this with other conditionals, such as checking existence of the files, can
help to test different test paths using Chef InSpec. With this way, you can skip
certain controls, which would 100% fail due to the way servers are prepared, but
you know that the same control suites are reused later in different circumstances
by different teams.

This example checks whether the Gnome Desktop is installed. If not installed, it resets the impact of the control to the new value which is passed as a hash with the impact key.

Here, it resets it to 0:

```ruby
control 'gnome-destkop-settings' do
  impact 0.5
  desc 'some good settings'
  desc 'check', 'check the settings file for good things'
  desc 'fix', 'set the good things in the file /etc/gnome/settings'
  tag nist: 'CM-6'

  only_if("The Gnome Desktop is not installed, this control is Not Applicable", impact: 0) {
    package('gnome-desktop').installed?
  }

  describe gnome_settings do
    it should_be set_well
  end
end
```

Some notes about `only_if`:

- `only_if` applies to the entire `control`. If the results of the `only_if`
  block evaluate to false, any Chef InSpec resources mentioned as part of a
  `describe` block will not be run. Additionally, the contents of the describe
  blocks will not be run. However, bare Ruby expressions and bare Chef InSpec
  resources (not assocated with a describe block) preceding the only_if statement
  will run
- `only_if` also accepts hash with impact key to reset the impact value of the control. Control's impact is helpful in determining it is enhanced outcome.

To illustrate:

```ruby
control "whatruns" do
  command("do_something") # This will ALWAYS run
  describe command("do_another_thing") do # This will not run
    command("do_yet_another_thing") # This will not run
  end
  only_if { false }
  command("do_something_else") # This will not run
end
```

- Only one `only_if` is permitted per `control` block. If multiple `only_if` blocks are present, only the last `only_if` block will be honored
- If used outside a control block, `only_if` skips all controls in the current file
- To implement complex logic, use Ruby 'or' (`||`) and 'and' (`&&`) inside your `only_if` block:

```ruby
  only_if('ready for launch') do
    rocket_is_ready && weather_is_clear
  end
```

### Test controls for applicability using `only_applicable_if`

The `only_applicable_if` block allows to test if a control is applicable or not. In this example, the control with `only_applicable_if` block checks the condition and marks the control as not applicable (N/A) if the results of the `only_applicable_if` block evaluates to `false`.

If **gnome-desktop** is not installed, the following control to test gnome settings marks control as **not applicable**.

```ruby
control 'gnome-destkop-settings' do
  impact 0.5
  desc 'some good settings'
  desc 'check', 'check the settings file for good things'
  desc 'fix', 'set the good things in the file /etc/gnome/settings'
  tag nist: 'CM-6'

  only_applicable_if("The Gnome Desktop is not installed, this control is Not Applicable") {
    package('gnome-desktop').installed?
  }

  describe gnome_settings do
    it should_be set_well
  end
end
```

Run output:

```bash
inspec exec path/to/audit-gnome-settings-profile --enhanced-outcomes

Profile:   InSpec Profile (audit-gnome-settings-profile)
Version:   0.1.0
Target:    local://
Target ID: fa3923b9-f806-4cc2-960d-1ddefb4c7654

  N/A  gnome-destkop-settings: No-op
     ×  No-op
     N/A control due to only_applicable_if condition: The Gnome Desktop is not installed, this control is Not Applicable

Profile Summary: 0 successful controls, 0 control failure, 0 controls not reviewed, 1 controls not applicable, 0 controls have error
Test Summary: 0 successful, 1 failures, 0 skipped
```

Some notes about `only_applicable_if`:

- `only_applicable_if` applies to the entire `control`. If the results of the `only_applicable_if` block evaluates to `false`, any Chef InSpec resources mentioned as part of a `describe` block will not be run. Additionally, the contents of the describe blocks will not be run.
- If the results of the `only_applicable_if` block evaluates to `false`, it will invoke a failing test which will state the reason for N/A.

### Additional metadata

The following example illustrates various ways to add tags and references to `control`

```ruby
control 'ssh-1' do
  impact 1.0

  title 'Allow only SSH Protocol 2'
  desc '
    Only SSH protocol version 2 connections should be permitted.
    The default setting in /etc/ssh/sshd_config is correct, and can be
    verified by ensuring that the following line appears: Protocol 2
  '

  tag 'production','development'
  tag 'ssh','sshd','openssh-server'

  tag cce: 'CCE-27072-8'
  tag disa: 'RHEL-06-000227'

  tag remediation: 'stig_rhel6/recipes/sshd-config.rb'
  tag remediation: 'https://supermarket.chef.io/cookbooks/ssh-hardening'

  ref 'NSA-RH6-STIG - Section 3.5.2.1', url: 'https://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf'
  ref 'http://people.redhat.com/swells/scap-security-guide/RHEL/6/output/ssg-centos6-guide-C2S.html'

  describe ssh_config do
    its('Protocol') { should cmp 2 }
  end
end
```

## Using Ruby in InSpec

The Chef InSpec Language is a Ruby based language. This allows you to be flexible with
Ruby code in controls:

```ruby
json_obj = json('/file.json')
json_obj['keys'].each do |value|
  ..
end
```

Ruby allows a lot of freedoms, but should be limited in controls so that they
remain portable and easy to understand. Please see our [profile style guide](/inspec/style/).

Core and custom resources are written as regular Ruby classes which inherit from
`Inspec.resource`.

### Interactive Debugging with Pry

Here's a sample Chef InSpec control that uses Ruby variables to instantiate
a Chef InSpec resource once and use the content in multiple tests.

```ruby
control 'check-perl' do
  impact 0.3
  title 'Check perl compiled options and permissions'
  perl_out = command('perl -V')
  #require 'pry'; binding.pry;
  describe perl_out do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /USE_64_BIT_ALL/ }
    its('stdout') { should match /useposix=true/ }
    its('stdout') { should match /-fstack-protector/ }
  end

  # extract an array of include directories
  perl_inc = perl_out.stdout.partition('@INC:').last.strip.split("\n")
  # ensure include directories are only writable by 'owner'
  perl_inc.each do |path|
    describe directory(path.strip) do
      it { should_not be_writable.by 'group' }
      it { should_not be_writable.by 'other' }
    end
  end
end
```

An **advanced** but very useful Ruby tip. In the previous example, I
commented out the `require 'pry'; binding.pry;` line. If you remove the
`#` prefix and run the control, the execution will stop at that line and
give you a `pry` shell. Use that to troubleshoot, print variables, see
methods available, etc. For the above example:

```ruby
[1] pry> perl_out.exit_status
=> 0
[2] pry> perl_out.stderr
=> ""
[3] pry> ls perl_out
Inspec::Plugins::Resource#methods: inspect
Inspec::Resources::Cmd#methods: command  exist?  exit_status  result  stderr  stdout  to_s
Inspec::Resource::Registry::Command#methods: inspec
instance variables: @__backend_runner__  @__resource_name__  @command  @result
[4] pry> perl_out.stdout.partition('@INC:').last.strip.split("\n")
=> ["/Library/Perl/5.18/darwin-thread-multi-2level",
 "    /Library/Perl/5.18",
...REDACTED...
[5] pry> exit    # or abort
```

You can use `pry` inside both the controls DSL and resources. Similarly,
for dev and test, you can use `inspec shell` which is based on `pry`,
for example:

```ruby
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> command('ls ~/projects/github/inspec/docs').stdout
=> "README.md\nconfig.md\ndev\ndsl_inspec.md\ndsl_resource.md\nglossary.md\nhabitat.md\ninputs.md\ninspec_and_friends.md\nmatchers.md\nmigration.md\nplatforms.md\nplugin_kitchen_inspec.md\nplugins.md\nprofiles.md\nreporters.md\nresources\nshared\nshell.md\nstyle.md\nwaivers.md\n"
inspec> command('ls ~/projects/github/inspec/docs').stdout.split("\n").first
=> "README.md"

inspec> help command
Name: command

Description:
Use the command InSpec audit resource to test an arbitrary command that is run on the system.

Example:
describe command('ls -al /') do
  it { should exist }
  its('stdout') { should match /bin/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end
```

