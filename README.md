# Inspec CLI

Test your Server, VM, or workstation.

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

### Runner

Runner tests will make sure the backend execution layer behaves as expected.
These tests will take a while, as a lot of different operating systems and configurations
are being tested.

You will require:

* vagrant with virtualbox
* test-kitchen
* docker

Run all tests via

```bash
rake test:runner

# configure concurrency:
CONCURRENCY=3 rake test:runner
```

This will go to `test/runner` and run `kitchen test`. You can test specific
operating systems and configurations via test-kitchen.

## Contributing

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request


Copyright 2015 Chef Software Inc. All rights reserved.
Copyright 2015 Vulcano Security GmbH. All rights reserved.
Copyright 2015 Dominik Richter. All rights reserved.
