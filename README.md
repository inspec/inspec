# InSpec

## What is InSpec?

InSpec is an open-source testing framework for infrastructure with an easy language for specifying compliance, security, and policy requirements. The project name stands for "infrastructure specification" and can be thought of as an abbreviation of "inspect".

You can use InSpec to examine any node in your infrastructure. The InSpec framework runs locally or remotely on the node being inspected. It uses test rules written in the InSpec language as input. Detected security, compliance, or policy issues are flagged in a log.

The InSpec project includes many resources that help you write audit rules quickly and easily. Here are some examples.

 * Disallow insecure protocols - In this example, the package and inetd_conf resources ensure that insecure services and protocols, such as telnet, are not used.

```ruby
describe package('telnetd') do
  it { should_not be_installed }
end

describe inetd_conf do
  its("telnet") { should eq nil }
end
```

 * Only accept requests on secure ports - This test ensures, that a web server is only listening on well-secured ports.

```ruby
describe port(80) do
  it { should_not be_listening }
end

describe port(443) do
  it { should be_listening }
  its('protocol') {should eq 'tcp'}
end
```

 * Use approved strong ciphers - This test ensures, that only enterprise-compliant ciphers are used for SSH servers.

```ruby
describe sshd_config do
   its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
end
```

 * Test your `kitchen.yml` file, to verify that only Vagrant is configured as the driver.

```ruby
describe yaml('.kitchen.yml') do
  its('driver.name') { should eq('vagrant') }
end
```

## Test your Server, VM, or workstation.

Small example: Write a your checks in `test.rb`:

```ruby
describe file('/proc/cpuinfo') do
  it { should be_file }
end

describe ssh_config do
  its('Protocol') { should eq('2') }
end
```

Run this file locally:

```bash
inspec exec test.rb
```

## Installation

Requires Ruby ( >1.9 ).

To simply run it without installation, you must install [bundler](http://bundler.io/):

```bash
bundle install
bundle exec bin/inspec help
```

To install it as a gem locally, run:

```bash
gem build inspec.gemspec
gem install inspec-*.gem
```

You should now be able to run:

```bash
inspec --help
```

## Usage

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

## Custom resources

You can easily create your own resources. Here is a custom resource for an
application called Gordon and save it in `gordon_config.rb`:

```ruby
require 'yaml'

class GordonConfig < Inspec.resource
  name 'gordon_config'

  def initialize
    @path = '/etc/gordon/config.yaml'
    @config = inspec.file(@path).content
    @params = YAML.load(@config)
  end

  def method_missing(name)
    @params[name.to_s]
  end
end
```

Include this file in your `test.rb`:

```ruby
require_relative 'gordon_config'
```

Now you can start using your new resource:

```ruby
describe gordon_config do
  its('Version') { should eq('1.0') }
end
```

## Tests

We perform `unit`, `resource` and `integration` tests.

* `unit` tests ensure the intended behaviour of the implementation
* `resource` tests run against docker containers
* `integration` tests run against VMs via test-kitchen and [kitchen-inspec](https://github.com/chef/kitchen-inspec)

### Unit tests

Just
```bash
bundle exec rake test
```
as usual.

### Resource tests

Make sure the backend execution layer behaves as expected. These tests will take a while, as a lot of different operating systems and configurations are being tested.

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

## Learn More

For more information see the InSpec documentation: https://github.com/chef/inspec/tree/master/docs

## Kudos

InSpec is inspired by the wonderful [Serverspec](http://serverspec.org) project. Kudos to [mizzy](https://github.com/mizzy) and [all contributors](https://github.com/mizzy/serverspec/graphs/contributors)!

## Contributing

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request


Copyright 2015 Chef Software Inc. All rights reserved.

Copyright 2015 Vulcano Security GmbH. All rights reserved.

Copyright 2015 Dominik Richter. All rights reserved.
