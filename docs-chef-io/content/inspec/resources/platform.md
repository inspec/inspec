+++
title = "platform resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "platform"
    identifier = "inspec/resources/os/platform.md platform resource"
    parent = "inspec/resources/os"
+++

Use the `platform` Chef InSpec audit resource to test the platform on which the system is running. While similar to the `os` resource, the platform resource provides additional functionality for platform family detection and support validation.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `platform` resource block declares the platform to be tested:

```ruby
describe platform do
  its('name') { should eq 'ubuntu' }
end
```

## Properties

The `platform` resource provides the following properties:

- `name` - The platform name (String)
- `family` - The platform family (String)
- `release` - The platform release version (String)
- `arch` - The system architecture (String)
- `families` - Array of platform families in hierarchical order

## Examples

### Test Platform Name and Family

```ruby
describe platform do
  its('name') { should eq 'ubuntu' }
  its('family') { should eq 'debian' }
end
```

### Test Platform Family Hierarchy

```ruby
describe platform do
  its('families') { should include 'unix' }
  its('families') { should include 'linux' }
  its('families') { should include 'debian' }
end
```

### Test Platform Support

```ruby
describe platform do
  it { should be_supported('ubuntu') }
  it { should be_supported({ platform: 'ubuntu', release: '22.04' }) }
  it { should be_supported([
    { platform_family: 'debian' },
    { platform_family: 'redhat', release: '8' }
  ]) }
end
```

### Test Platform Family Membership

```ruby
describe platform do
  it { should be_in_family('unix') }
  it { should be_in_family('debian') }
end
```

### Using the params Method

```ruby
describe platform.params do
  its(['name']) { should eq 'ubuntu' }
  its(['families']) { should include 'debian' }
  its(['release']) { should eq '22.04' }
  its(['arch']) { should eq 'x86_64' }
end
```

### Pattern Matching for Platform Names

```ruby
# Test using wildcard patterns
describe platform do
  it { should be_supported('ubuntu*') }    # Matches any Ubuntu version
  it { should be_supported('debian-*') }   # Matches any Debian variant
end
```

## Platform Support Validation

The platform resource can validate platform support requirements using various formats:

```ruby
# Single platform name
platform.supported?('ubuntu')

# Platform with specific version
platform.supported?({ platform: 'ubuntu', release: '22.04' })

# Multiple platform requirements
platform.supported?([
  { platform_family: 'debian' },
  { platform: 'centos', release: '7.*' }
])
```

Support can be specified using these keys:
- `platform` or `os` - Exact platform name
- `platform_family` or `os_family` - Platform family name
- `platform_name` or `os_name` - Platform name with pattern matching
- `release` - Release version (supports pattern matching)

## Platform Family Detection

The platform resource includes methods to detect platform families:

```ruby
describe platform do
  it { should be_in_family('unix') }   # Tests if platform belongs to unix family
  it { should be_in_family('linux') }  # Tests if platform belongs to linux family
  its('families') { should include 'debian' } # Tests family hierarchy
end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource provides the following special matchers:

- `be_supported` - Tests platform support requirements
- `be_in_family` - Tests platform family membership

For example:

```ruby
describe platform do
  it { should be_supported('ubuntu') }
  it { should be_in_family('debian') }
end
