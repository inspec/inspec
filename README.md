# InSpec: Inspect Your Infrastructure

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

InSpec makes it easy to run your tests wherever you need.

```bash
# run test locally
inspec exec test.rb

# run test on remote host on SSH
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

### Install it via rubygems.org

```bash
gem install inspec
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
  inspec check PATH      # verify test structure in PATH
  inspec detect          # detect the target OS
  inspec exec PATHS      # run all test files
  inspec help [COMMAND]  # Describe available commands or one specific command
  inspec json PATH       # read all tests in PATH and generate a JSON profile
  inspec shell           # open an interactive debugging shell
  inspec version         # prints the version of this tool
```

# Examples

* Only accept requests on secure ports - This test ensures that a web server is only listening on well-secured ports.

```ruby
describe port(80) do
  it { should_not be_listening }
end

describe port(443) do
  it { should be_listening }
  its('protocol') {should eq 'tcp'}
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

Also have a look at our [example](https://github.com/chef/inspec/tree/master/examples/test-kitchen) that uses `inspec` in combination with `test-kitchen`

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

Run `integration` tests with

```bash
cd test/integration
bundle exec kitchen test -t .
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
