---
title: Resource DSL
---

# Resource DSL

Chef InSpec provides a mechanism for defining custom resources. These become
available with their respective names and provide easy functionality to
profiles.

## Resource location

Resources may be added to profiles in the libraries folder:

```bash
$ tree examples/profile
examples/profile
...
├── libraries
│   └── gordon_config.rb
```

## Resource structure

The smallest possible resource takes this form:

```ruby
class Tiny < Inspec.resource(1)
  name 'tiny'
end
```

Resources are written as a regular Ruby class which inherits from
Inspec.resource. The number (1) specifies the version this resource
plugin targets. As Chef InSpec evolves, this interface may change and may
require a higher version.

The following attributes can be configured:

- name - Identifier of the resource (required)
- desc - Description of the resource (optional)
- example - Example usage of the resource (optional)
- supports - (Chef InSpec 2.0+) Platform restrictions of the resource (optional)

The following methods are available to the resource:

- inspec - Contains a registry of all other resources to interact with the operating system or target in general.
- skip\_resource - A resource may call this method to indicate that requirements aren't met. All tests that use this resource will be marked as skipped.

The following example shows a full resource using attributes and methods
to provide simple access to a configuration file:

```ruby
class GordonConfig < Inspec.resource(1)
  name 'gordon_config'

  # Restrict to only run on the below platforms (if none were given, all OS's supported)
  supports platform_family: 'fedora'
  supports platform: 'centos', release: '6.9'
  # Supports `*` for wildcard matcher in the release
  supports platform: 'centos', release: '7.*'

  desc '
    Resource description ...
  '

  example '
    describe gordon_config do
      its("signal") { should eq "on" }
    end
  '

  # Load the configuration file on initialization
  def initialize(path = nil)
    @path = path || '/etc/gordon.conf'
    @params = SimpleConfig.new( read_content )
  end

  # Expose all parameters of the configuration file.
  def method_missing(name)
    @params[name]
  end

  private

  def read_content
    f = inspec.file(@path)
    # Test if the path exist and that it's a file
    if f.file?
      # Retrieve the file's contents
      f.content
    else
      # If the file doesn't exist, skip all tests that use gordon_config
      raise Inspec::Exceptions::ResourceSkipped, "Can't read config at #{@path}"
    end
  end
end
```

For a full example, see our [example resource](https://github.com/chef/inspec/blob/master/examples/profile/libraries/gordon_config.rb).
