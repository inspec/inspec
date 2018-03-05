---
title: Resource Authoring Guide
---

# Resource Authoring Guide

Chef InSpec provides a mechanism for defining custom resources. These become
available with their respective names and provide easy functionality to
profiles.

You may choose to distribute your custom resources as a `resource pack` (a special form of an InSpec profile that contains only resources but no controls). Alternatively, you may be developing resources that you would like to contribute to the InSpec project itself (a `core resource`). The syntax and general guidelines are the same for either approach, but there are some differences in file locations and expectations of code quality.

This document will first explore writing a resource to be distributed in a resource pack, then expand into important considerations when writing for a broader audience, such as a resource you'd like to contribute to InSpec core.

## File Structure of a Resource Pack

This is the smallest possible resource pack, containing one custom resource (`signal_lamp_config`).

```bash
$ tree examples/profile
examples/profile
├── libraries
│   └── example_config.rb
```

The inspec.yml file is minimal, containing only the name of the profile / resource pack:

```yaml
name: vigilante_notification
```

 A more realistic resource pack would include some other files - mostly related to testing - which we will build up and discuss later.


## Resource structure

The smallest possible resource file takes this form:

```ruby
class SignalLampConfig < Inspec.resource(1)
  name 'signal_lamp_config'
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

The following example shows a full resource to provide simple access to a configuration file.  It allows you to specify the path to the configuraion file, and then exposes one matcher (`be_illuminated`) and one property (`color`).

```ruby
class ExampleConfig < Inspec.resource(1)
  name 'example_config'

  # Restrict to only run on the below platforms (if none were given, all OS's supported)
  supports platform_family: 'fedora'
  supports platform: 'centos', release: '6.9'
  # Supports `*` for wildcard matcher in the release
  supports platform: 'centos', release: '7.*'

  desc '
    Examines the configuration file of the Chiroptera Signal.
  '

  example '
    describe example_config do
      its("signal") { should eq "on" }
    end
  '

  # Load the configuration file on initialization
  def initialize(path = nil)
    @path = path || '/etc/example.conf'
    # SimpleConfig is a InSpec helper class, often used
    # to read INI-style or `key = value ` configuration files
    @params = SimpleConfig.new( read_content )
  end

  # Expose the property, 'color'.
  def color
    @config_contents['color']
  end

  # Expose a matcher, be_illuminated.  Anything ending in '?'
  # will be treated as a matcher, and will have 'be_' prefixed.
  def illuminated?
    @config_contents['status'] == 'on'
  end

  private

  def read_content
    # Keep in mind the file is on the remote machine being tested, not
    # on the local machine running InSpec. This re-uses an existing
    # InSpec resource, `file`, to read the config file's contents.
    f = inspec.file(@path)
    # Test if the path exists and that it's a file
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

For a full example, see our [example resource](https://github.com/chef/inspec/blob/master/examples/profile/libraries/example_config.rb).

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
