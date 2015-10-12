# Train - Transport Interface

Train lets you talk to your local or remote operating systems with a unified interface.

It allows you to:

* execute commands via `run_command`
* interact with files via `file`
* identify the target operating system via `os`

Train supports:

* Local execution
* SSH
* WinRM
* Docker
* Mock (for testing and debugging)

# Examples

## Setup

**Local**

```ruby
require 'train'
train = Train.create('local')
```

**SSH**

```ruby
require 'train'
train = Train.create('ssh',
  host: '1.2.3.4', port: 22, user: 'root', keys: '/vagrant')
```

**WinRM**

```ruby
require 'train'
train = Train.create('winrm',
  host: '1.2.3.4', user: 'Administrator', password: '...', ssl: true, self_signed: true)
```

**Docker**

```ruby
require 'train'
train = Train.create('docker', host: 'container_id...')
```

## Configuration

To get a list of available options for a plugin:

```ruby
puts Train.options('ssh')
```
This will provide all configuration options:

```ruby
{
  :host     => { :required => true},
  :port     => { :default  => 22, :required => true},
  :user     => { :default  => "root", :required => true},
  :keys     => { :default  => nil},
  :password => { :default  => nil},
  ...
```

## Usage

```ruby
# start or reuse a connection
conn = train.connection

# run a command on Linux/Unix/Mac
puts conn.run_command('whoami').stdout

# get OS info
puts conn.os[:family]
puts conn.os[:release]

# access files
puts conn.file('/proc/version').content

# close the connection
conn.close
```

# Kudos and Contributors

Train is heavily based on the work of:

* [test-kitchen](https://github.com/test-kitchen/test-kitchen)  

    by [Fletcher Nichol](fnichol@nichol.ca)
    and [a great community of contributors](https://github.com/test-kitchen/test-kitchen/graphs/contributors)

* [ohai](https://github.com/chef/ohai)

    by Adam Jacob, Chef Software Inc.
    and [a great community of contributors](https://github.com/chef/ohai/graphs/contributors)


## Contributing

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request


Copyright 2015 Chef Software Inc. All rights reserved.
Copyright 2015 Vulcano Security GmbH. All rights reserved.
Copyright 2015 Dominik Richter. All rights reserved.
