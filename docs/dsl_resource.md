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

The following example shows a full resource which provides simple access to a configuration file. It allows you to specify the path to the configuraion file, and then exposes one matcher (`be_illuminated`) and one property (`color`).

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
  # You may also name matchers with a `has_` prefix, which will
  # be transformed to `have_`. 
  def illuminated?
    @config_contents['status'] == 'on'
  end

  private

  def read_content
<<<<<<< HEAD
    # Keep in mind the file is on the remote machine being tested, not
    # on the local machine running InSpec. This re-uses an existing
=======
    # Keep in mind the file is on the remote machine being tested, not 
    # on the local machine running InSpec. So, using traditional Ruby
    # file-reading methods won't work.  This example uses an existing 
>>>>>>> Sketching out details of design guide for resources
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

<<<<<<< HEAD
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
=======
## Adding tests to your resource

(TODO: brief intro to why testing is so important on a security product)

### Adding a test harness

(TODO: explain adding a Gemfile and Rakefile; provide a default)

### Unit testing InSpec Resources

(TODO: add a unit helper file)

### Integration testing InSpec Resources 

(TODO: explain adding integration tests that drive the inspec executable)

## Contributing a Resource to InSpec Core

InSpec core (that is, the InSpec project at [https://github.com/chef/inspec](https://github.com/chef/inspec)) is an open source project, and welcomes contributions from the community.  For details on the workflow and legal requirements, see our [CONTRIBUTING.md](https://github.com/chef/inspec/blob/master/CONTRIBUTING.md).

When moving from writing resource packs to writing for core, be aware that the standards are fairly high.  InSpec is a security product used by thousands of users.  When a feature or new resource is submitted, it should be complete with documentation, unit tests, and integration tests.

## Design Considerations for InSpec Resources

In addition to code and testing quality, there are a number of considerations involved when authoring resources.

### Two Major Audiences

(TODO: discuss user base split between inspec-as-integration-testing vs inspec-as-compliance-tool)

### Start Small

It's often best to start by creating a bare-bones resource.  If you limit functionality to being able detect the resource on the target and implementing the `exists` matcher, you will have an excellent, clean base from which to start.  A "skeletal" resource lays out the test files, documentation, and the structure of the resource source code, without implementing any difficult or controversial features.  That allows the pull request review process to proceed more quickly.

This also applies when dealing with APIs that return complex data structures.  Try to focus on exposing the elements of the data that directly apply to your use case.  You are not obliged to provide 100% exposure of every possible element or value of a data structure.  See ["Dealing with Complex Properties"](#dealing-with-complex-properties) and ["Low -evel and High-Level Features](#low-level-and-high-level-features).

### Singular vs Plural

One of the earliest distinctions you will need to make when designing a resource is whether you want to have in-depth auditing of a single resource, or bulk detection of groups of the same resource type.  For example, compare the [package](https://www.inspec.io/docs/reference/resources/package/) and [packages](https://www.inspec.io/docs/reference/resources/packages/) resources.

TODO: describe Mixins

### Properties vs Matchers

(TODO: clarify UX distinction between a property and a matcher.  Link to visual glossary.)

### Dealing with Complex Properties

Suppose you are dealing with a complex structure - such as this, which describes the local storage on an HPE OneView virtual machine:

```json

{
  "localStorage": {
    "controllers": [
      {
        "deviceSlot": "1",
        "initialize": true,
        "logicalDrives": [
          {
            "bootable": false,
            "driveTechnology": "",
            "name": "disk-1-1"
          }
        ]
      },
      {
        "deviceSlot": "2",
        "initialize": true,
        "mode": "RAID",
        "logicalDrives": [
          {
            "bootable": false,
            "driveTechnology": "",
            "name": "disk-2-1"
          },
          {
            "bootable": false,
            "driveTechnology": "",
            "name": "disk-2-2"
          }
        ]
      }
    ],
    "sasLogicalJBODs": [
      {
        "deviceSlot": "3",
        "driveMaxSizeGB": 10
      }
    ]
  }
}
```

There is a tremendous amount of information present.  Should it be exposed, and at what level?  The InSpec team recommends that you consider exposing the information at a low, mid, and high level.  You need not do all three on day one; functionality can be added over time as the need arises.

#### Expose the raw data as an unsupported property

One initial step is to expose the data as one or more raw structures, with documentation explaining that the property is unsupported (and directing users to higher-level matchers or properties). This allows users to perform difficult tests, at the expense of usability. 

```ruby
describe oneview_server_profile('my-server') do
  its('local_storage_controllers.first') { should include {"initialize": true}}
  its('local_storage_controllers.last.logical_drives.count') { should cmp 2 }
end
```

This approach is taken with the [bucket_policy](https://www.inspec.io/docs/reference/resources/aws_s3_bucket/#bucket_policy) property of `aws_s3_bucket`.  Users are able to access any policy element, but are encouraged to use higher-level matchers.

An advantage of this approach is that it make writing mid-level and high-level properties and matchers based on the low-level property straightforward.

#### Implement properties that return arrays of identifiers

As a mid-level approach, if the data structure contains meaningful identifiers that you can use to retrieve "child" objects, you can implement an InSpec resource for the child object, then add a property to the parent object that returns arrays of identifiers.

For example, suppose that HPE OneView provides an API to retrieve a disk by server ID and disk name.  Then you could do:

```ruby
oneview_server_profile('my-server').logical_drive_names.each |drive_name| do 
  describe oneview_logical_drive(server_id: 'my-server', drive_name: drive_name) do
    it { should_not be_bootable }
  end
end
```

Some things to note:

 * We aren't running any tests against the server - only against the logical drives.  The server is not in a describe block, so it is not treated as a test - merely as an object that can fetch information for us.
 * The `logical_drive_names` property returns a "dumb array" of strings.  It does not return an array of Hashes, or an array of `oneview_logical_drive` InSpec resources.  This is an example of [Use Raw Properties](#use-raw-properties).
 * The name `logical_drive_names` is carefully chosen to include the `names` suffix.  This clarifies that you are getting a list of names (Strings), not InSpec Resources or some other identifier.

An example of providing an array of identifiers is the [security_group_ids]() property of `aws_ec2_instance`.

#### Provide high-level matchers for common use-cases

Armed with low- and mid-level properties and matchers, it becomes easier to implement properties and matchers that reflect common use cases.  In some cases, you may start with the high-level features, and wait to expose the lower level features while they are in flux.

This approach is best when driven by the feedback and needs of the [community](#two-major-audiences).  In this case, suppose there was a need to ensure that all local storage was RAID.

```ruby
describe oneview_server_profile('my-server') do
  it { should have_all_raid_local_storage }
end
```

An example of this approach is the [`be_public`](https://www.inspec.io/docs/reference/resources/aws_s3_bucket/#be_public) matcher of `aws_s3_bucket`.

### Fluent Naming

* TODO: RSpec naming transforms
* TODO: Matcher.alias_matcher
* TODO: provide caluclated properties, like age
* TODO: use units in names

### Low-Level and High Level Features

High/Low level features were touched on a bit in [Dealing with Complex Properties](#dealing_with_complex_properties), but it's worth expanding a bit on why this distinction is important.

Low-level features expose the nuts-and-bolts of the resource.  If you are dealing with a `process`, you might be able to access information like the parent process ID, perhaps even a list of open files or a deep tree or subprocesses.  Thinking of our [two audiences](#two_major_audiences), this sort of information access is vital to infrastructure-as-code engineers; they need to verify that their provisioning code is behaving as expected, and are comfortable with the technical details, perhaps even writing Ruby code to traverse complex data structures. Compliance practitioners, on the other hand, may find the resulting code to be opaque.  They need to be able to understand the profile in order to certify that it represents the intent of a particular security standard.

High-level features directly address use cases of compliance practitioners, in clear, unambiguous language. While high-level features are less flexible, they can be very powerful. For example, the `be_public` matcher on the `aws_s3_bucket` is straighforward to understand. Its implementation relies on the presence of several low-level features. It is also somewhat future-proof: if additional checks are needed in the future, they can be added to the implementation of be_public, and all users of the matcher will benefit from the change. Alternatively, if someone made the same checks using only the low-level matchers, they would need to update their profile to match.

Overall, having both low- and high-level resources works out best.

### Use Raw Properties

(TODO: explain returning simple data structures instead of InSpec "child resources").

### Exception handling

### Lazy properties>>>>>>> Sketching out details of design guide for resources
