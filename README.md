# InSpec: Inspect Your Infrastructure

[![Slack](https://community-slack.chef.io/badge.svg)](https://community-slack.chef.io/)
[![Build Status Master](https://travis-ci.org/chef/inspec.svg?branch=master)](https://travis-ci.org/chef/inspec)
[![Build Status Master](https://ci.appveyor.com/api/projects/status/github/chef/inspec?branch=master&svg=true&passingText=master%20-%20Ok&pendingText=master%20-%20Pending&failingText=master%20-%20Failing)](https://ci.appveyor.com/project/Chef/inspec/branch/master)

InSpec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.

```ruby
# Disallow insecure protocols by testing

describe package('telnetd') do
  it { should_not be_installed }
end

describe inetd_conf do
  its("telnet") { should eq nil }
end
```

InSpec makes it easy to run your tests wherever you need. More options are found in our [CLI docs](https://www.inspec.io/docs/reference/cli/).

```bash
# run test locally
inspec exec test.rb

# run test on remote host on SSH
inspec exec test.rb -t ssh://user@hostname -i /path/to/key

# run test on remote host using SSH agent private key authentication. Requires InSpec 1.7.1
inspec exec test.rb -t ssh://user@hostname

# run test on remote windows host on WinRM
inspec exec test.rb -t winrm://Administrator@windowshost --password 'your-password'

# run test on docker container
inspec exec test.rb -t docker://container_id
```

# Features

- Built-in Compliance: Compliance no longer occurs at the end of the release cycle
- Targeted Tests: InSpec writes tests that specifically target compliance issues
- Metadata: Includes the metadata required by security and compliance pros
- Easy Testing: Includes a command-line interface to run tests quickly

## Installation

InSpec requires Ruby ( >1.9 ).

### Install as package

The InSpec package is available for MacOS, RedHat, Ubuntu and Windows. Download the latest package at [InSpec Downloads](https://downloads.chef.io/inspec) or install InSpec via script:

```
# RedHat, Ubuntu, and macOS
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec

# Windows
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project inspec
```

### Install it via rubygems.org

When installing from source, gem dependencies may require ruby build tools to be installed.

For CentOS/RedHat/Fedora:

```bash
yum -y install ruby ruby-devel make gcc
```

For Ubuntu:

```bash
apt-get -y install ruby ruby-dev gcc make
```

To install inspec from [rubygems](https://rubygems.org/):

```bash
gem install inspec
```

### Usage via Docker

Download the image and define an alias for convenience:

```
docker pull chef/inspec
alias inspec='docker run -it --rm -v $(pwd):/share chef/inspec'
```

If you call inspec from cli, it automatically mounts the current directory into the work directory. Therefore you can easily use local tests and key files. Note: Only files in the current directory are available to the container.

```
$ ls -1
vagrant
test.rb


$ inspec exec test.rb -t ssh://root@192.168.64.2:11022 -i vagrant
..

Finished in 0.04321 seconds (files took 0.54917 seconds to load)
2 examples, 0 failures
```


### Install it from source

That requires [bundler](http://bundler.io/):

```bash
bundle install
bundle exec bin/inspec help
```

To install it as a gem locally, run:

```bash
gem build inspec.gemspec
gem install inspec-*.gem
```

On Windows, you need to install [Ruby](http://rubyinstaller.org/downloads/) with [Ruby Development Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) to build dependencies with its native extensions.

### Install via Habitat

Currently, this method of installation only supports Linux. See the [Habitat site](https://www.habitat.sh/) for more information.

Download the `hab` binary from the [Habitat](https://www.habitat.sh/docs/get-habitat/) site.

```bash
hab pkg install chef/inspec
export PATH="$(hab pkg path core/ruby)/bin:$(hab pkg path chef/inspec)/bin:$PATH"

inspec
```

### Run InSpec

You should now be able to run:

```bash
$ inspec --help
Commands:
  inspec archive PATH                # archive a profile to tar.gz (default) ...
  inspec check PATH                  # verify all tests at the specified PATH
  inspec compliance SUBCOMMAND ...   # Chef Compliance commands
  inspec detect                      # detect the target OS
  inspec exec PATH(S)                # run all test files at the specified PATH.
  inspec help [COMMAND]              # Describe available commands or one spe...
  inspec init TEMPLATE ...           # Scaffolds a new project
  inspec json PATH                   # read all tests in PATH and generate a ...
  inspec shell                       # open an interactive debugging shell
  inspec supermarket SUBCOMMAND ...  # Supermarket commands
  inspec version                     # prints the version of this tool

Options:
  [--diagnose], [--no-diagnose]  # Show diagnostics (versions, configurations)
```

# Examples

* Only accept requests on secure ports - This test ensures that a web server is only listening on well-secured ports.

```ruby
describe port(80) do
  it { should_not be_listening }
end

describe port(443) do
  it { should be_listening }
  its('protocols') {should include 'tcp'}
end
```

* Use approved strong ciphers - This test ensures that only enterprise-compliant ciphers are used for SSH servers.

```ruby
describe sshd_config do
   its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
end
```

* Test your `kitchen.yml` file to verify that only Vagrant is configured as the driver.  The %w() formatting will
pass rubocop lintng and allow you to access nested mappings.

```ruby
describe yaml('.kitchen.yml') do
  its(%w(driver name)) { should eq('vagrant') }
end
```

Also have a look at our examples for:
- [Using InSpec with Test Kitchen & Chef](https://github.com/chef/inspec/tree/master/examples/kitchen-chef)
- [Using InSpec with Test Kitchen & Puppet](https://github.com/chef/inspec/tree/master/examples/kitchen-puppet)
- [Using InSpec with Test Kitchen & Ansible](https://github.com/chef/inspec/tree/master/examples/kitchen-ansible)
- [Implementing an InSpec profile](https://github.com/chef/inspec/tree/master/examples/profile)

## Or tests: Testing for a OR b

* Using describe.one, you can test for a or b.  The control will be marked as passing if EITHER condition is met.

```ruby
control 'or-test' do
  impact 1.0
  title 'This is a OR test'
  describe.one do
    describe ssh_config do
      its('Protocol') { should eq('3') }
    end
    describe ssh_config do
      its('Protocol') { should eq('2') }
    end
  end
end
```

## Command Line Usage

### exec

Run tests against different targets:

```bash
# run test locally
inspec exec test.rb

# run test on remote host on SSH
inspec exec test.rb -t ssh://user@hostname

# run test on remote windows host on WinRM
inspec exec test.rb -t winrm://Administrator@windowshost --password 'your-password'

# run test on docker container
inspec exec test.rb -t docker://container_id

# run with sudo
inspec exec test.rb --sudo [--sudo-password ...] [--sudo-options ...] [--sudo_command ...]

# run in a subshell
inspec exec test.rb --shell [--shell-options ...] [--shell-command ...]
```

### detect

Verify your configuration and detect

```bash
id=$( docker run -dti ubuntu:14.04 /bin/bash )
inspec detect -t docker://$id
```

Which will provide you with:

```
{"family":"ubuntu","release":"14.04","arch":null}
```

## Supported OS

Remote Targets

Platform | Versions | Architectures
 --- | --- | ---
AIX | 6.1, 7.1, 7.2 | ppc64
CentOS | 5, 6, 7 | i386, x86_64
Debian | 7, 8 | i386, x86_64
FreeBSD | 9, 10 | i386, amd64
Mac OS X | 10.9, 10.10, 10.11 | x86_64
Oracle Enterprise Linux | 5, 6, 7 | i386, x86_64
Red Hat Enterprise Linux | 5, 6, 7 | i386, x86_64
Solaris | 10, 11 | sparc, x86
Windows | 7, 8, 8.1, 10, 2008, 2008R2 , 2012, 2012R2, 2016 | x86, x86_64
Ubuntu Linux | | x86, x86_64
SUSE Linux Enterprise Server  | 11, 12 | x86_64
Scientific Linux | 5.x, 6.x and 7.x | i386, x86_64
Fedora  | | x86_64
OpenSUSE | 13.1/13.2/42.1 | x86_64
OmniOS | | x86_64
Gentoo Linux | | x86_64
Arch Linux | | x86_64
HP-UX | 11.31 | ia64

*For Windows 2008 and 2008 R2 an updated Powershell (Windows Management Framework 5.0) is required.*

In addition, runtime support is provided for:

Platform | Versions
 ---- | ----
Debian | 8
RHEL | 6, 7
Ubuntu | 12.04+
Windows | 7+
Windows | 2012+

## Documentation

Documentation

 * https://www.inspec.io/docs/
 * https://www.inspec.io/docs/reference/resources/
 * https://github.com/chef/inspec/tree/master/docs

Tutorials/Blogs/Podcasts:

 * https://www.inspec.io/tutorials/

Relationship to other tools (RSpec, Serverspec):

 * https://www.inspec.io/docs/reference/inspec_and_friends/

## Share your Profiles

You may share your InSpec Profiles in the [Tools &amp; Plugins section](https://supermarket.chef.io/tools-directory) of the [Chef Supermarket](https://supermarket.chef.io/).  [Sign in](https://supermarket.chef.io/sign-in) and [add the details of your profile](https://supermarket.chef.io/tools/new).

You may also [browse the Supermarket for shared Compliance Profiles](https://supermarket.chef.io/tools?type=compliance_profile).

## Kudos

InSpec is inspired by the wonderful [Serverspec](http://serverspec.org) project. Kudos to [mizzy](https://github.com/mizzy) and [all contributors](https://github.com/mizzy/serverspec/graphs/contributors)!


## Contribute

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request


The InSpec community and maintainers are very active and helpful. This project benefits greatly from this activity.

[![InSpec health](https://graphs.waffle.io/chef/inspec/throughput.svg)](https://waffle.io/chef/inspec/metrics/throughput)


## Testing InSpec

We perform `unit`, `resource` and `integration` tests.

* `unit` tests ensure the intended behaviour of the implementation
* `resource` tests run against docker containers
* `integration` tests run against VMs via test-kitchen and [kitchen-inspec](https://github.com/chef/kitchen-inspec)

### Unit tests

```bash
bundle exec rake test
```

If you like to run only one test, use

```bash
bundle exec ruby -W -Ilib:test test/unit/resources/user_test.rb
```

### Resource tests

Resource tests make sure the backend execution layer behaves as expected. These tests will take a while, as a lot of different operating systems and configurations are being tested.

You will require:

* docker

Run `resource` tests with

```bash
bundle exec rake test:resources config=test/test.yaml
bundle exec rake test:resources config=test/test-extra.yaml
```

### Integration tests

These tests download various virtual machines, to ensure InSpec is working as expected across different operating systems.

You will require:

* vagrant with virtualbox
* test-kitchen

**Run `integration` tests with vagrant:**

```bash
KITCHEN_YAML=.kitchen.vagrant.yml bundle exec kitchen test
```

**Run `integration` tests with AWS EC2:**

```bash
export AWS_ACCESS_KEY_ID=enteryouryourkey
export AWS_SECRET_ACCESS_KEY=enteryoursecreykey
export AWS_KEYPAIR_NAME=enteryoursshkeyid
export EC2_SSH_KEY_PATH=~/.ssh/id_aws.pem
KITCHEN_YAML=.kitchen.ec2.yml bundle exec kitchen test
```

In addition you may need to add your ssh key to `.kitchen.ec2.yml`

```
transport:
  ssh_key: /Users/chartmann/aws/aws_chartmann.pem
  username: ec2-user
```


## License

|  |  |
| ------ | --- |
| **Author:** | Dominik Richter (<drichter@chef.io>) |
| **Author:** | Christoph Hartmann (<chartmann@chef.io>) |
| **Copyright:** | Copyright (c) 2015 Chef Software Inc. |
| **Copyright:** | Copyright (c) 2015 Vulcano Security GmbH. |
| **License:** | Apache License, Version 2.0 |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
