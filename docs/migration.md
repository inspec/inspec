---
title: InSpec Migration Guide
---

# Migrate from Serverspec to InSpec

## How is InSpec different from Serverspec

We've written a complete blog post about that topic: [The Road to InSpec](https://blog.chef.io/2015/11/04/the-road-to-inspec/)

## Is InSpec suitable for infrastructure testing?

InSpec is a framework that allows you to run infrastructure testing as well as compliance testing. The compliance features are always optional and provide customers a way to use InSpec for both use-cases. To ensure we build the best infrastructure testing, we migrate our cookbooks [chef-cookbooks](https://github.com/chef-cookbooks) to InSpec.

## Which Serverspec resources are available in InSpec?

The following resources are available in InSpec:

[`bond`](https://www.inspec.io/docs/reference/resources/bond/), [`bridge`](https://www.inspec.io/docs/reference/resources/bridge/), [`command`](https://www.inspec.io/docs/reference/resources/command/), [`file`](https://www.inspec.io/docs/reference/resources/file/), [`group`](https://www.inspec.io/docs/reference/resources/group/), [`host`](https://www.inspec.io/docs/reference/resources/host/), [`interface`](https://www.inspec.io/docs/reference/resources/interface/), [`iis_website`](https://www.inspec.io/docs/reference/resources/iis_site/), [`iptables`](https://www.inspec.io/docs/reference/resources/iptables/), [`kernel_module`](https://www.inspec.io/docs/reference/resources/kernel_module/), [`linux_kernel_parameter`](https://www.inspec.io/docs/reference/resources/kernel_parameter/), [`mysql_config`](https://www.inspec.io/docs/reference/resources/mysql_config/), [`package`](https://www.inspec.io/docs/reference/resources/package/), [`port`](https://www.inspec.io/docs/reference/resources/port/), [`ppa`](https://www.inspec.io/docs/reference/resources/ppa/), [`process`](https://www.inspec.io/docs/reference/resources/process/), [`service`](https://www.inspec.io/docs/reference/resources/service/), [`user`](https://www.inspec.io/docs/reference/resources/user/), [`windows_feature`](https://www.inspec.io/docs/reference/resources/windows_feature/), [`windows_registry_key`](https://www.inspec.io/docs/reference/resources/windows_registry_key/), [`yumrepo`](https://www.inspec.io/docs/reference/resources/yum/)

Some Serverspec resources are not available yet. We implement those resources based on user feedback. If you need a resource that is not available in InSpec, please open an [Github issue](https://github.com/chef/inspec/issues). The list of resources that are not available in InSpec:

`cgroup`, `cron`, `default_gateway`, `docker_container`, `docker_image`, `iis_app_pool`, `ip6tables`, `ipfilter`, `ipnat`, `linux_audit_system`, `lxc`, `mail_alias`, `php_config`, `routing_table`, `selinux`, `selinux_module`, `x509_certificate`, `x509_private_key`, `zfs`

In addition InSpec provides additional [resources](https://www.inspec.io/docs/reference/resources/) that are not available in Serverspec:
[`apache_conf`](https://www.inspec.io/docs/reference/resources/apache_conf/), [`apt`](https://www.inspec.io/docs/reference/resources/apt/), [`audit_policy`](https://www.inspec.io/docs/reference/resources/audit_policy/), [`auditd_conf`](https://www.inspec.io/docs/reference/resources/auditd_conf/), [`bash`](https://www.inspec.io/docs/reference/resources/bash/), [`csv`](https://www.inspec.io/docs/reference/resources/csv/), [`etc_shadow`](https://www.inspec.io/docs/reference/resources/etc_shadow/), [`gem`](https://www.inspec.io/docs/reference/resources/gem/), [`grub_conf`](https://www.inspec.io/docs/reference/resources/grub_conf/), [`inetd_conf`](https://www.inspec.io/docs/reference/resources/inetd_conf/), [`ini`](https://www.inspec.io/docs/reference/resources/ini/), [`json`](https://www.inspec.io/docs/reference/resources/json/), [`npm`](https://www.inspec.io/docs/reference/resources/npm/), [`ntp_conf`](https://www.inspec.io/docs/reference/resources/ntp_conf/), [`oneget`](https://www.inspec.io/docs/reference/resources/oneget/), [`pip`](https://www.inspec.io/docs/reference/resources/pip/), [`powershell`](https://www.inspec.io/docs/reference/resources/powershell/), [`security_policy`](https://www.inspec.io/docs/reference/resources/security_policy/), [`ssh_config`](https://www.inspec.io/docs/reference/resources/ssh_config/), [`sshd_config`](https://www.inspec.io/docs/reference/resources/sshd_config/), [`sys_info`](https://www.inspec.io/docs/reference/resources/sys_info/)

## How do I migrate my Serverspec tests to InSpec

For most cases, the migration to InSpec is pretty straight forward. First, replace the current verifier in `kitchen.yml` configuration with:

```
verifier:
  name: inspec
```

Second, rename the directory `test/integration/default/serverspec` to
`test/integration/default/inspec`

Third, remove the Serverspec-specific code from the test files.

```
require 'serverspec'

# Required by serverspec
set :backend, :exec
```

InSpec is now configured with Test-Kitchen:

```
kitchen verify package-install-centos-72
-----> Starting Kitchen (v1.14.2)
-----> Verifying <package-install-centos-72>...
       Detected alternative framework tests for `inspec`
       Loaded  

Target:  ssh://vagrant@127.0.0.1:2200


  PHP has
     ✔  php
     ✔  the pear.php.net channel
     ✔  the pecl.php.net channel

Test Summary: 3 successful, 0 failures, 0 skipped
       Finished verifying <package-install-centos-72> (0m0.40s).
-----> Kitchen is finished. (0m3.31s)
```

Some real-world migrations are available:

* [docker](https://github.com/chef-cookbooks/docker)
* [nginx](https://github.com/chef-cookbooks/chef_nginx/pull/5/files)
* [mysql](https://github.com/chef-cookbooks/mysql/pull/430/files)
* [php](https://github.com/chef-cookbooks/php/pull/189/files)

Some general recommendations:

* use test-kitchen 1.14+
* in case of errors, increase the log level `kitchen verify package-install-centos-72 -l debug`

## Do I still need the backend configuration?

InSpec does not attach backend information to test files. All tests are defined independently of any backend. Therefore a Serverspec test file:

```
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'PHP' do
  it 'has php' do
    expect(command('php -v').exit_status).to eq(0)
  end

  it 'has the pear.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pear.php.net')
  end

  it 'has the pecl.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pecl.php.net')
  end
end
```

will become the following InSpec test file:

```
describe 'PHP' do
  it 'has php' do
    expect(command('php -v').exit_status).to eq(0)
  end

  it 'has the pear.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pear.php.net')
  end

  it 'has the pecl.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pecl.php.net')
  end
end
```

As you can see, the InSpec test files just focuses on tests and tries to avoid all clutter.

## Nested describe blocks

Serverspec and RSpec allow you to define nested describe blocks. We did a survey and found out that most users use nested describe blocks only to improve their output report. We believe the code structure should not change to improve the output of a report. Nevertheless we understand that nested describe blocks help you to structure test code. A sample code block looks like:

```
describe 'chef-server-directories' do
  describe file('/etc/opscode') do
    it { should be_directory }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/opscode-analytics') do
    it { should be_directory }
    it { should be_owned_by 'opscode' }
    it { should be_grouped_into 'opscode' }
  end

  describe file('/var/log/opscode') do
    it { should be_directory }
    it { should be_owned_by 'opscode' }
    it { should be_grouped_into 'opscode' }
  end

  describe file('/var/opt/opscode') do
    it { should be_directory }
    it { should be_owned_by 'root' }
  end
end
```

In InSpec you would split up groups into files.

```
tests
├── server-directories.rb
├── other-tests.rb
└── further-tests.rb
```

Each file can have a top-level description of its content:

```
title "Chef Server Directories"

describe file('/etc/opscode') do
  it { should be_directory }
  it { should be_owned_by 'root' }
end

describe file('/etc/opscode-analytics') do
  it { should be_directory }
  it { should be_owned_by 'opscode' }
  it { should be_grouped_into 'opscode' }
end

describe file('/var/log/opscode') do
  it { should be_directory }
  it { should be_owned_by 'opscode' }
  it { should be_grouped_into 'opscode' }
end

describe file('/var/opt/opscode') do
  it { should be_directory }
  it { should be_owned_by 'root' }
end

```

## Are you supporting the `expect` syntax?

Of course. We still prefer the `should` syntax for UX reasons. We did surveys with various types of customers like devops engineers, auditors, managers. All participants who prefered the `expect` syntax have been Ruby experts. All non-Ruby developers found it easier to understand the `should` syntax.

### `should` syntax with InSpec

```
describe command('php -v') do
  its('exit_status') { should eq 0 }
end

describe command('pear list-channels') do
  its('stdout') { should include('pear.php.net')}
end

describe command('pear list-channels') do
  its('stdout') { should include('pecl.php.net')}
end
```

### `expect` syntax with InSpec

```
describe 'PHP' do
  it 'has php' do
    expect(command('php -v').exit_status).to eq(0)
  end

  it 'has the pear.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pear.php.net')
  end

  it 'has the pecl.php.net channel' do
    expect(command('pear list-channels').stdout).to include('pecl.php.net')
  end
end
```
