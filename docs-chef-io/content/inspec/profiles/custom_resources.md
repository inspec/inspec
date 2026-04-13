+++
title = "InSpec Custom Resources"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Custom Resources"
    identifier = "inspec/profiles/libraries"
    parent = "inspec/profiles"
    weight = 40
+++

You can extend the functionality of Chef InSpec profiles by creating custom resources.

For hands-on examples, check out [Extending InSpec: InSpec Wrappers and Custom Resources](https://learn.chef.io/courses/course-v1:chef+InSpec201+Perpetual/about) on Learn Chef.

## Resource location

Create custom resources in a profile's libraries directory.

```bash
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

### Resource attributes

Use the following attributes to configure a resource.

`name`
: Identifier of the resource.

  Required

`desc`
: Description of the resource

  Optional

`example`
: Example usage of the resource

  Optional

`supports`
: Platform restrictions of the resource

  Optional

### Resource methods

The following methods are available to the resource.

`inspec`

: Contains a registry of all other resources to interact with the operating system or target in general.

`skip_resource`

: A resource may call this method to indicate that requirements aren't met. All tests that use this resource will be marked as skipped.

The additional methods may be defined within the resource:

`resource_id`
: An instance method. Place logic here to determine the unique identifier for a resource, and set it using the superclass method. 

  Following is an example of its usage in an InSpec test:

  ```ruby
  # example_config resource can have unique conf file path as an identifier.
  describe example_config do
    its("resource_id") { should eq PATH_OF_CONF_FILE }
  end
  ```

### Example

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

  def resource_id
    value = example_method_to_determine_resource_id # define logic to determine resource_id value
    super(value)
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

## Alternate custom resource names

If you have a profile that includes another profile with custom resources as a dependency, the custom resources from the dependent profile are included by default.
If two custom resource names conflict, you can use the `require_resource` InSpec DSL function to rename a custom resource in control code.

```ruby
require_resource(
  profile: '<DEPENDENCY_NAME>',
  resource: '<RESOURCE_NAME>',
  as: '<ALTERNATE_RESOURCE_NAME>'
)
```

where:

- `<DEPENDENCY_NAME>` is the dependent profile
- `<RESOURCE_NAME>` is the resource name in the dependent profile
- `<ALTERNATE_RESOURCE_NAME>` is an alternate name for that resource

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
