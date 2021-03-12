# Chef InSpec: Inspect Your Infrastructure

* **Project State: Active**
* **Issues Response SLA: 14 business days**
* **Pull Request Response SLA: 14 business days**

For more information on project states and SLAs, see [this documentation](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md).

[![Slack](https://community-slack.chef.io/badge.svg)](https://community-slack.chef.io/)
[![Build status](https://badge.buildkite.com/bf4c5fdc3858cc9f8c8bab8376e8e40d625ad046df9d4d8619.svg?branch=master)](https://buildkite.com/chef-oss/inspec-inspec-master-verify)
[![Coverage Status](https://coveralls.io/repos/github/inspec/inspec/badge.svg?branch=master)](https://coveralls.io/github/inspec/inspec?branch=master)

Chef InSpec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.

```ruby
# Disallow insecure protocols by testing

describe package('telnetd') do
  it { should_not be_installed }
end

describe inetd_conf do
  its("telnet") { should eq nil }
end
```

Chef InSpec makes it easy to run your tests wherever you need. More options are found in our [CLI docs](https://docs.chef.io/inspec/cli/).

```bash
# run test locally
inspec exec test.rb

# run test on remote host via SSH
inspec exec test.rb -t ssh://user@hostname -i /path/to/key

# run test on remote host using SSH agent private key authentication. Requires Chef InSpec 1.7.1
inspec exec test.rb -t ssh://user@hostname

# run test on remote windows host via WinRM
inspec exec test.rb -t winrm://Administrator@windowshost --password 'your-password'

# run test on remote windows host via WinRM as a domain user
inspec exec test.rb -t winrm://windowshost --user 'UserName@domain' --password 'your-password'

# run test on docker container
inspec exec test.rb -t docker://container_id
```

# Features

- Built-in Compliance: Compliance no longer occurs at the end of the release cycle
- Targeted Tests: Chef InSpec writes tests that specifically target compliance issues
- Metadata: Includes the metadata required by security and compliance pros
- Easy Testing: Includes a command-line interface to run tests quickly

## Installation

Chef InSpec requires Ruby ( >= 2.6 ). Ruby 2.5 support is limited and requires Bundler with an entry in the Gemfile:

```
  # 16.7.23 required ruby 2.6+
  gem "chef-utils", "< 16.7.23"
```

Note: Versions of Chef InSpec 4.0 and later require accepting the EULA to use. Please visit the [license acceptance page](https://docs.chef.io/chef_license_accept.html) on the Chef docs site for more information.

### Install as package

The Chef InSpec package is available for MacOS, RedHat, Ubuntu and Windows. Download the latest package at [Chef InSpec Downloads](https://downloads.chef.io/inspec) or install Chef InSpec via script:

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
yum -y install ruby ruby-devel make gcc gcc-c++
```

For Ubuntu:

```bash
apt-get -y install ruby ruby-dev gcc g++ make
```

To install the `inspec` executable, which requires accepting the [Chef License](https://docs.chef.io/chef_license_accept.html), run:

```bash
gem install inspec-bin
```

You may also use `inspec` as a library, with no executable. This does not require accepting the license. To install the library as a gem, run:

```bash
gem install inspec
```


### Usage via Docker

Download the image and define a function for convenience:

For Linux:

```
docker pull chef/inspec
function inspec { docker run -it --rm -v $(pwd):/share chef/inspec "$@"; }
```

For Windows (PowerShell):

```
docker pull chef/inspec
function inspec { docker run -it --rm -v "$(pwd):/share" chef/inspec $args; }
```

If you call `inspec` from your shell, it automatically mounts the current directory into the Docker container. Therefore you can easily use local tests and key files. Note: Only files in the current directory and sub-directories are available within the container.

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

Note that installing from OS packages from [the download page](https://downloads.chef.io) is the preferred method.

That requires [bundler](http://bundler.io/):

```bash
bundle install
bundle exec inspec help
```

To install it as a gem locally, run:

```bash
gem build inspec.gemspec
gem install inspec-*.gem
```

On Windows, you need to install [Ruby](http://rubyinstaller.org/downloads/) with [Ruby Development Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) to build dependencies with its native extensions.

### Install via Chef Habitat

Currently, this method of installation only supports Linux. See the [Chef Habitat site](https://www.habitat.sh/) for more information.

Download the `hab` binary from the [Chef Habitat](https://www.habitat.sh/docs/get-habitat/) site.

```bash
hab pkg install chef/inspec --binlink

inspec
```

### Run Chef InSpec

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
pass rubocop linting and allow you to access nested mappings.

```ruby
describe yaml('.kitchen.yml') do
  its(%w(driver name)) { should eq('vagrant') }
end
```

Also have a look at our examples for:
- [Using Chef InSpec with Test Kitchen & Chef Infra](https://github.com/chef/inspec/tree/master/examples/kitchen-chef)
- [Using Chef InSpec with Test Kitchen & Puppet](https://github.com/chef/inspec/tree/master/examples/kitchen-puppet)
- [Using Chef InSpec with Test Kitchen & Ansible](https://github.com/chef/inspec/tree/master/examples/kitchen-ansible)
- [Implementing an Chef InSpec profile](https://github.com/chef/inspec/tree/master/examples/profile)

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

# run a profile targeting AWS using env vars
inspec exec test.rb -t aws://

# or store your AWS credentials in your ~/.aws/credentials profiles file
inspec exec test.rb -t aws://us-east-2/my-profile

# run a profile targeting Azure using env vars
inspec exec test.rb -t azure://

# or store your Azure credentials in your ~/.azure/credentials profiles file
inspec exec test.rb -t azure://subscription_id
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

| Platform                     | Versions                                         | Architectures |
| ---------------------------- | ------------------------------------------------ | ------------- |
| AIX                          | 6.1, 7.1, 7.2                                    | ppc64         |
| CentOS                       | 6, 7, 8                                          | i386, x86_64  |
| Debian                       | 9, 10                                            | i386, x86_64  |
| FreeBSD                      | 9, 10, 11                                        | i386, amd64   |
| macOS                        | 10.14, 10.15, 11.0                               | x86_64        |
| Oracle Enterprise Linux      | 6, 7, 8                                          | i386, x86_64  |
| Red Hat Enterprise Linux     | 6, 7, 8                                          | i386, x86_64  |
| Solaris                      | 10, 11                                           | sparc, x86    |
| Windows\*                    | 8, 8.1, 10, 2012, 2012R2, 2016, 2019             | x86, x86_64   |
| Ubuntu Linux                 |                                                  | x86, x86_64   |
| SUSE Linux Enterprise Server | 12, 15                                           | x86_64        |
| Scientific Linux             | 6, 7                                             | i386, x86_64  |
| Fedora                       |                                                  | x86_64        |
| OpenSUSE                     | 15                                               | x86_64        |
| OmniOS                       |                                                  | x86_64        |
| Gentoo Linux                 |                                                  | x86_64        |
| Arch Linux                   |                                                  | x86_64        |
| HP-UX                        | 11.31                                            | ia64          |

\**For Windows, PowerShell 5.0 or above is required.*

In addition, runtime support is provided for:

| Platform | Versions | Arch   |
| -------- | -------- | ------ |
| macOS    | 10.14+   | x86_64 |
| Debian   | 9, 10    | x86_64 |
| RHEL     | 6, 7, 8  | x86_64 |
| Ubuntu   | 16.04+   | x86_64 |
| Windows  | 8+       | x86_64 |
| Windows  | 2012+    | x86_64 |

## Documentation

Documentation

 * https://docs.chef.io/inspec/
 * https://docs.chef.io/inspec/resources/
 * https://github.com/inspec/inspec/tree/master/docs-chef-io

Learn Chef:

 * https://community.chef.io/products/chef-inspec/#learn

Relationship to other tools (RSpec, Serverspec):

 * https://docs.chef.io/inspec/inspec_and_friends/

## Share your Profiles

You may share your Chef InSpec Profiles in the [Tools &amp; Plugins section](https://supermarket.chef.io/tools-directory) of the [Chef Supermarket](https://supermarket.chef.io/). [Sign in](https://supermarket.chef.io/sign-in) and [add the details of your profile](https://supermarket.chef.io/tools/new).

You may also [browse the Supermarket for shared Compliance Profiles](https://supermarket.chef.io/tools?type=compliance_profile).

## Kudos

Chef InSpec is inspired by the wonderful [Serverspec](http://serverspec.org) project. Kudos to [mizzy](https://github.com/mizzy) and [all contributors](https://github.com/mizzy/serverspec/graphs/contributors)!

The AWS resources were inspired by [inspec-aws](https://github.com/arothian/inspec-aws) from [arothian](https://github.com/arothian).

## Contribute

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request

The Chef InSpec community and maintainers are very active and helpful. This project benefits greatly from this activity.

If you'd like to chat with the community and maintainers directly join us in the `#inspec` channel on the [Chef Community Slack](http://community-slack.chef.io/).

As a reminder, all participants are expected to follow the [Code of Conduct](https://github.com/inspec/inspec/blob/master/CODE_OF_CONDUCT.md).

[![Slack](https://community-slack.chef.io/badge.svg)](https://community-slack.chef.io/)

## Testing Chef InSpec

We offer `unit`, `integration`, and `aws` tests.

- `unit` tests ensure the intended behaviour of the implementation
- `integration` tests run against Docker-based VMs via test-kitchen and [kitchen-inspec](https://github.com/chef/kitchen-inspec)
- `aws` tests exercise the AWS resources against real AWS accounts

### Unit tests

```bash
bundle exec rake test
```

If you like to run only one test file:

```bash
bundle exec m test/unit/resources/user_test.rb
```

You may also run a single test within a file by line number:

```bash
bundle exec m test/unit/resources/user_test.rb -l 123
```

### Integration tests

These tests download various virtual machines, to ensure Chef InSpec is working as expected across different operating systems.

These tests require the following gems:

- test-kitchen
- kitchen-dokken
- kitchen-inspec

These gems are provided via the `integration` group in the project's Gemfile.

In addition, these test require Docker to be available on your machine or a remote Docker machine configured via the standard Docker environment variables.

#### Running Integration tests

List the various test instances available:

```bash
bundle exec kitchen list
```

The platforms and test suites are configured in the `.kitchen.yml` file. Once you know which instance you wish to test, test that instance:

```bash
bundle exec kitchen test <INSTANCE_NAME>
```

You may test all instances in parallel with:

```bash
bundle exec kitchen test -c
```

### AWS Tests

Use the rake task `bundle exec rake test:aws` to test the AWS resources against a pair of real AWS accounts.

Please see [TESTING_AGAINST_AWS.md](./test/integration/aws/TESTING_AGAINST_AWS.md) for details on how to setup the needed AWS accounts to perform testing.

### Azure Tests

Use the rake task `bundle exec rake test:azure` to test the Azure resources against an Azure account.

Please see [TESTING_AGAINST_AZURE.md](./test/integration/azure/TESTING_AGAINST_AZURE.md) for details on how to setup the needed Azure accounts to perform testing.

## License

|                |                                           |
| -------------- | ----------------------------------------- |
| **Author:**    | Dominik Richter (<drichter@chef.io>)      |
| **Author:**    | Christoph Hartmann (<chartmann@chef.io>)  |
| **Copyright:** | Copyright (c) 2015 Vulcano Security GmbH. |
| **Copyright:** | Copyright (c) 2017-2018 Chef Software Inc.|
| **License:**   | Apache License, Version 2.0               |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
