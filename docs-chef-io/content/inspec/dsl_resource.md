+++
title = "Resource DSL"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Custom Resources"
    identifier = "inspec/reference/dsl_resource.md Custom Resources"
    parent = "inspec/reference"
    weight = 90
+++

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
│   └── example_config.rb
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
class ExampleConfig < Inspec.resource(1)
  name 'example_config'

  # Restrict to only run on the below platforms (if none were given, all OS's supported)
  supports platform_family: 'fedora'
  supports platform: 'centos', release: '6.9'
  # Supports `*` for wildcard matcher in the release
  supports platform: 'centos', release: '7.*'

  desc '
    Resource description ...
  '

  example '
    describe example_config do
      its("signal") { should eq "on" }
    end
  '

  # Load the configuration file on initialization
  def initialize(path = nil)
    @path = path || '/etc/example.conf'
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
      # If the file doesn't exist, skip all tests that use example_config
      raise Inspec::Exceptions::ResourceSkipped, "Can't read config at #{@path}"
    end
  end
end
```

For a full example, see our [example resource](https://github.com/chef/inspec/blob/main/examples/profile/libraries/example_config.rb).

## Lazy Loading

Prior to InSpec v4.16, resources were pre-loaded for every invocation
of `inspec`. This was a heavy and unnecessary burden on the system and
exacerbated startup times (especially on Windows).

As of InSpec v4.16, resources are lazily loaded into the `inspec`
process upon use. This greatly speeds up the initial startup costs of
the `inspec` process and only loads what you need to use. For example, `inspec
--version` no longer runs for 10 seconds!.

### Overriding Core Resources

Lazy loading does change the way the resource registry is handled in
ways that might break some assumptions. Specifically,
`inspec.<resource>` isn't pre-populated with the core resources that
InSpec ships with. If you make a local/custom resource of the same
name, referring to the core resource via `inspec.<resource>` will not
resolve to the core resource.

As such, overriding core resources is not recommended best practice.

If you really do need to do this, it is easiest to make a local
resource with a new name and refer to the core resource directly.
Otherwise, you need to ensure that the core resource you want is
registered (via `require "inspec/resource/<name>"`) _before_ your
profile is run to ensure it is eagerly loaded and in the global
resource registry.
