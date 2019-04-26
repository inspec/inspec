---
title: Chef InSpec DSL
---

# Chef InSpec DSL

Chef InSpec is a run-time framework and rule language used to specify compliance, security, and policy requirements. It includes a collection of resources that help you write auditing controls quickly and easily. The syntax used by both open source and |chef compliance| auditing is the same. The open source |Chef InSpec resource| framework is compatible with |chef compliance|.

The Chef InSpec DSL is a Ruby DSL for writing audit controls, which includes audit resources that you can invoke.

The following sections describe the syntax and show some simple examples of using the Chef InSpec resources.

## Syntax

The following resource tests |ssh| server configuration. For example, a simple control may described as:

```ruby
describe sshd_config do
  its('Port') { should cmp 22 }
end
```

In various use cases like implementing IT compliance across different departments, it becomes handy to extend the control with metadata. Each control may define an additional ``impact``, ``title`` or ``desc``. An example looks like:

```ruby
control 'sshd-8' do
  impact 0.6
  title 'Server: Configure the service port'
  desc 'Always specify which port the SSH server should listen.'
  desc 'rationale', 'This ensures that there are no unexpected settings' # Requires Chef InSpec >=2.3.4
  tag 'ssh','sshd','openssh-server'
  tag cce: 'CCE-27072-8'
  ref 'NSA-RH6-STIG - Section 3.5.2.1', url: 'https://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf'

  describe sshd_config do
    its('Port') { should cmp 22 }
  end
end
```

where

* `'sshd-8'` is the name of the control
* `impact`, `title`, and `desc` define metadata that fully describes the importance of the control, its purpose, with a succinct and complete description
* `desc` when given only one argument it sets the default description. As of Chef InSpec 2.3.4, when given 2 arguments (see: `'rationale'`) it will use the first argument as a header when rendering in Automate
* `impact` is a string, or numeric that measures the importance of the compliance results.
  Valid strings for impact are `none`, `low`, `medium`, `high`, and `critical`. The values are based off CVSS 3.0.
  A numeric value must be between `0.0` and `1.0`. The value ranges are:
  * `0.0 to <0.01` these are controls with no impact, they only provide information
  * `0.01 to <0.4` these are controls with low impact
  * `0.4 to <0.7` these are controls with medium impact
  * `0.7 to <0.9` these are controls with high impact
  * `0.9 to 1.0` these are critical controls
* `tag` is optional meta-information with with key or key-value pairs
* `ref` is a reference to an external document
* `describe` is a block that contains at least one test. A `control` block must contain at least one `describe` block, but may contain as many as required
* `sshd_config` is an Chef InSpec resource. For the full list of Chef InSpec resources, see Chef InSpec resource documentation
* `its('Port')` is the matcher; `{ should eq '22' }` is the test. A `describe` block must contain at least one matcher, but may contain as many as required

## Advanced concepts

With Chef InSpec it is possible to check if at least one of a collection of checks is true. For example: If a setting is configured in two different locations, you may want to test if either configuration A or configuration B have been set. This is accomplished via `describe.one`. It defines a block of tests with at least one valid check.

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

### Sensitive resources

In some scenarios, you may be writing checks involving resources with sensitive content (e.g. a file resource). In the case of failures, it may be desired to suppress output. This can be done by adding the `:sensitive` flag to the resource definition

```ruby
describe file('/tmp/mysecretfile'), :sensitive do
  its('content') { should match /secret_info/ }
end
```

## Examples

The following examples show simple compliance tests using a single `control` block.

## Test System Event Log

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

## Test if PostgreSQL passwords are empty

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

## Test if MySQL passwords are in ENV

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

## Test if `/etc/ssh` is a Directory

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

## Test if Apache running

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

## Test if insecure packages are installed

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

## Test Windows Registry Keys

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

## Exclude specific test

This shows how to allow skipping certain tests if conditions are not met, by using `only_if`.
In this example the test will not be performed if `redis-cli` command does not exist. A optional
message can say why it was skipped.

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

Mixing this with other conditionals (like checking existence of the files etc.) can help to test different test paths using InSpec. This way you can skip certain tests which would 100% fail due to the way servers are prepared, but you know that the same test suites are reused later in different circumstances by different teams.

## Additional metadata for controls

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

# Using Ruby in InSpec

The Chef InSpec DSL is a Ruby based language. This allows you to be flexible with
Ruby code in controls:

```ruby
json_obj = json('/file.json')
json_obj['keys'].each do |value|
  ..
end
```

Ruby allows a lot of freedoms, but should be limited in controls so that they
remain portable and easy to understand. Please see our [profile style guide](./style).

Core and custom resources are written as regular Ruby classes which inherit from
`Inspec.resource`.


## Interactive Debugging with Pry

Here's a sample Chef InSpec control that users Ruby variables to instantiate
an Chef InSpec resource once and use the content in multiple tests.

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

inspec> command('ls /home/gordon/git/inspec/docs').stdout
=> "ctl_inspec.rst\ndsl_inspec.rst\ndsl_resource.rst\n"
inspec> command('ls').stdout.split("\n")
=> ["ctl_inspec.rst", "dsl_inspec.rst", "dsl_resource.rst"]

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
