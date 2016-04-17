# InSpec: Inspect Your Infrastructure

[![Join the chat at https://gitter.im/chef/inspec](https://badges.gitter.im/chef/inspec.svg)](https://gitter.im/chef/inspec?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
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

InSpec makes it easy to run your tests wherever you need. More options listed here: https://github.com/chef/inspec/blob/master/docs/ctl_inspec.rst

```bash
# run test locally
inspec exec test.rb

# run test on remote host on SSH
inspec exec test.rb -t ssh://user@hostname -i /path/to/key

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

### Install it via rubygems.org

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

* Test your `kitchen.yml` file to verify that only Vagrant is configured as the driver.

```ruby
describe yaml('.kitchen.yml') do
  its('driver.name') { should eq('vagrant') }
end
```

Also have a look at our examples for:
- [Using InSpec with Test Kitchen & Chef](https://github.com/chef/inspec/tree/master/examples/kitchen-chef)
- [Using InSpec with Test Kitchen & Puppet](https://github.com/chef/inspec/tree/master/examples/kitchen-puppet)
- [Using InSpec with Test Kitchen & Ansible](https://github.com/chef/inspec/tree/master/examples/kitchen-ansible)
- [Implementing an InSpec profile](https://github.com/chef/inspec/tree/master/examples/profile)

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
inspec exec test.rb --sudo [--sudo-password ...] [--sudo-options ...]
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

## Documentation

Documentation is available: https://github.com/chef/inspec/tree/master/docs

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
cd test/integration
bundle exec kitchen test
```

**Run `integration` tests with AWS EC2:**

```bash
export AWS_ACCESS_KEY_ID=enteryouryourkey
export AWS_SECRET_ACCESS_KEY=enteryoursecreykey
export AWS_KEYPAIR_NAME=enteryoursshkeyid
export EC2_SSH_KEY_PATH=~/.ssh/id_aws.pem
cd test/integration
KITCHEN_LOCAL_YAML=.kitchen.ec2.yml bundle exec kitchen test
```

In addition you may need to add your ssh key to `.kitchen.ec2.yml`

```
transport:
  ssh_key: /Users/chartmann/aws/aws_chartmann.pem
  username: ec2-user
```


### Chef Delivery Tests

It may be informative to look at what [tests Chef Delivery](https://github.com/chef/inspec/blob/master/.delivery/build-cookbook/recipes/unit.rb) is running for CI.

## License

| **Author:**          | Dominik Richter (<drichter@chef.io>)

| **Author:**          | Christoph Hartmann (<chartmann@chef.io>)

| **Copyright:**       | Copyright (c) 2015 Chef Software Inc.

| **Copyright:**       | Copyright (c) 2015 Vulcano Security GmbH.

| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
