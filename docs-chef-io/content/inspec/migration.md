+++
title = "Chef InSpec Migration Guide"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Migration from Serverspec"
    identifier = "inspec/reference/migration.md Migration from Serverspec"
    parent = "inspec/reference"
    weight = 130
+++

## How is Chef InSpec different from Serverspec

We've written a complete blog post about that topic: [The Road to InSpec](https://blog.chef.io/2015/11/04/the-road-to-inspec/)

## Is Chef InSpec suitable for infrastructure testing?

Chef InSpec is a framework that allows you to run infrastructure testing as well as compliance testing. The compliance features are always optional and provide customers a way to use Chef InSpec for both use-cases. To ensure we build the best infrastructure testing, we migrate our cookbooks [chef-cookbooks](https://github.com/chef-cookbooks) to InSpec.

## Which Serverspec resources are available in InSpec?

The following resources are available in InSpec:

|                                         Serverspec                                         |                                        Chef InSpec                                        |
|:------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------:|
| [`bond`](http://serverspec.org/resource_types.html#bond)                                     | [`bond`](/inspec/resources/bond/)                         |
| [`bridge`](http://serverspec.org/resource_types.html#bridge)                                 | [`bridge`](/inspec/resources/bridge/)                     |
| [`command`](http://serverspec.org/resource_types.html#command)                               | [`command`](/inspec/resources/command/)                   |
| [`cron`](http://serverspec.org/resource_types.html#cron)                                     | [`crontab`](/inspec/resources/crontab/)                   |
| [`docker_container`](http://serverspec.org/resource_types.html#docker_container)             | [`docker_container`](/inspec/resources/docker_container/) |
| [`docker_image`](http://serverspec.org/resource_types.html#docker_image)                     | [`docker_image`](/inspec/resources/docker_image/)         |
| [`file`](http://serverspec.org/resource_types.html#file)                                     | [`file`](/inspec/resources/file/)                         |
| [`group`](http://serverspec.org/resource_types.html#group)                                   | [`group`](/inspec/resources/group/)                       |
| [`host`](http://serverspec.org/resource_types.html#host)                                     | [`host`](/inspec/resources/host/)                         |
| [`interface`](http://serverspec.org/resource_types.html#interface)                           | [`interface`](/inspec/resources/interface/)               |
| [`iis_website`](http://serverspec.org/resource_types.html#iis_website)                       | [`iis_site`](/inspec/resources/iis_site/)           |
| [`iis_app_pool`](http://serverspec.org/resource_types.html#iis_app_pool)                     | [`iis_app`](/inspec/resources/iis_app/)           |
| [`iptables`](http://serverspec.org/resource_types.html#iptables)                             | [`iptables`](/inspec/resources/iptables/)                 |
| [`kernel_module`](http://serverspec.org/resource_types.html#kernel_module)                   | [`kernel_module`](/inspec/resources/kernel_module/)       |
| [`linux_kernel_parameter`](http://serverspec.org/resource_types.html#linux_kernel_parameter) | [`kernel_parameter`](/inspec/resources/kernel_parameter/) |
| [`mysql_config`](http://serverspec.org/resource_types.html#mysql_config)                     | [`mysql_conf`](/inspec/resources/mysql_conf/)             |
| [`package`](http://serverspec.org/resource_types.html#package)                               | [`package`](/inspec/resources/package/)                   |
| [`port`](http://serverspec.org/resource_types.html#port)                                     | [`port`](/inspec/resources/port/)                         |
| [`ppa`](http://serverspec.org/resource_types.html#ppa)                                       | [`apt`](/inspec/resources/apt/)                           |
| [`process`](http://serverspec.org/resource_types.html#process)                               | [`processes`](/inspec/resources/processes/)               |
| [`service`](http://serverspec.org/resource_types.html#service)                               | [`service`](/inspec/resources/service/)                   |
| [`user`](http://serverspec.org/resource_types.html#user)                                     | [`user`](/inspec/resources/user/)                         |
| [`windows_feature`](http://serverspec.org/resource_types.html#windows_feature)               | [`windows_feature`](/inspec/resources/windows_feature/)   |
| [`windows_registry_key`](http://serverspec.org/resource_types.html#windows_registry_key)     | [`registry_key`](/inspec/resources/registry_key/)         |
| [`x509_certificate`](http://serverspec.org/resource_types.html#x509_certificate)             | [`x509_certificate`](/inspec/resources/x509_certificate/) |
| [`yumrepo`](http://serverspec.org/resource_types.html#yumrepo)                               | [`yum`](/inspec/resources/yum/)                           |
| [`zfs`](http://serverspec.org/resource_types.html#zfs)                                       | [`zfs_pool`](/inspec/resources/zfs_pool/)                 |

Some Serverspec resources are not available yet. We will implement those resources based on user feedback. If you need a resource that is not available in InSpec, please open an [Github issue](https://github.com/chef/inspec/issues). The list of resources that are not available in InSpec:

* [`cgroup`](http://serverspec.org/resource_types.html#cgroup)
* [`default_gateway`](http://serverspec.org/resource_types.html#default_gateway)
* [`ip6tables`](http://serverspec.org/resource_types.html#ip6tables)
* [`ipfilter`](http://serverspec.org/resource_types.html#ipfilter)
* [`ipnat`](http://serverspec.org/resource_types.html#ipnat)
* [`linux_audit_system`](http://serverspec.org/resource_types.html#linux_audit_system)
* [`lxc`](http://serverspec.org/resource_types.html#lxc)
* [`mail_alias`](http://serverspec.org/resource_types.html#mail_alias)
* [`php_config`](http://serverspec.org/resource_types.html#php_config)
* [`routing_table`](http://serverspec.org/resource_types.html#routing_table)
* [`selinux`](http://serverspec.org/resource_types.html#selinux)
* [`selinux_module`](http://serverspec.org/resource_types.html#selinux_module)
* [`x509_private_key`](http://serverspec.org/resource_types.html#x509_private_key)

In addition Chef InSpec provides additional [resources](/inspec/resources/) that are not available in Serverspec:

* [`apache_conf`](/inspec/resources/apache_conf/)
* [`apt`](/inspec/resources/apt/)
* [`audit_policy`](/inspec/resources/audit_policy/)
* [`auditd_conf`](/inspec/resources/auditd_conf/)
* [`bash`](/inspec/resources/bash/)
* [`csv`](/inspec/resources/csv/)
* [`shadow`](/inspec/resources/shadow/)
* [`gem`](/inspec/resources/gem/)
* [`grub_conf`](/inspec/resources/grub_conf/)
* [`inetd_conf`](/inspec/resources/inetd_conf/)
* [`ini`](/inspec/resources/ini/)
* [`json`](/inspec/resources/json/)
* [`npm`](/inspec/resources/npm/)
* [`ntp_conf`](/inspec/resources/ntp_conf/)
* [`oneget`](/inspec/resources/oneget/)
* [`pip`](/inspec/resources/pip/)
* [`powershell`](/inspec/resources/powershell/)
* [`security_policy`](/inspec/resources/security_policy/)
* [`ssh_config`](/inspec/resources/ssh_config/)
* [`sshd_config`](/inspec/resources/sshd_config/)
* [`sys_info`](/inspec/resources/sys_info/)

## How do I migrate my Serverspec tests to InSpec

For most cases, the migration to Chef InSpec is pretty straight forward. First, replace the current verifier in `kitchen.yml` configuration with:

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

Chef InSpec is now configured with Test-Kitchen:

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

Chef InSpec does not attach backend information to test files. All tests are defined independently of any backend. Therefore a Serverspec test file:

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

will become the following Chef InSpec test file:

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

As you can see, the Chef InSpec test files just focuses on tests and tries to avoid all clutter.

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

In Chef InSpec you would split up groups into files.

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

Of course. We still prefer the `should` syntax for UX reasons. We did surveys with various types of customers like devops engineers, auditors, managers. All participants who preferred the `expect` syntax have been Ruby experts. All non-Ruby developers found it easier to understand the `should` syntax.

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
