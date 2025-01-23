+++
title = "os resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "os"
    identifier = "inspec/resources/os/os.md os resource"
    parent = "inspec/resources/os"
+++

Use the `os` Chef InSpec audit resource to test the platform on which the system is running.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `os` resource block declares the platform to be tested. You can test the platform using matchers or a control block name:

```ruby
describe os do
  its('family') { should eq 'platform_family_name' }
end
```

where `'platform_family_name'` is one of:
- `aix`
- `bsd`
- `darwin`
- `debian`
- `hpux`
- `linux`
- `redhat`
- `solaris`
- `suse`
- `unix`
- `windows`

## Properties

The `os` resource provides the following properties:

- `name` - The operating system name (String)
- `family` - The operating system family (String)
- `release` - The operating system release version (String)
- `arch` - The system architecture (String)
- `version` - The operating system version as a semantic version object (`Gem::Version` instance)

### Version Object

The `version` property returns a `Gem::Version` object with the following methods:

- `major` - The major version number
- `minor` - The minor version number
- `patch` - The patch version number
- `build` - The build version string (platform-specific)

The Version object also supports semantic version comparison operators:
`==`, `===`, `<`, `>`, `<=`, `>=`

## Examples

### Test the Operating System Family

```ruby
describe os.family do
  it { should eq 'debian' }
end
```

### Test Version Information

```ruby
# Compare version strings
describe os.release do
  it { should eq '22.04' }
end

# Use semantic version comparison
describe os.version do
  it { should cmp >= '22.04' }
end

# Test specific version components
describe os.version do
  its('major') { should eq 22 }
  its('minor') { should eq 4 }
  its('patch') { should eq 0 }
  its('build') { should eq nil }
end
```

### Test Version Comparisons

```ruby
# Test version is exactly 22.04
describe os.version do
  it { should eq '22.04' }
end

# Test version is at least 22.04
describe os.version do
  it { should be >= '22.04' }
end

# Test version is less than 23.0
describe os.version do
  it { should be < '23.0' }
end

# Test version is between two versions
describe os.version do
  it { should be >= '22.04' }
  it { should be < '23.0' }
end

# Using cmp matcher for version comparison
describe os.version do
  it { should cmp >= '22.04' }
  it { should cmp <= '22.10' }
end

# Using loose version matching (only compares major version)
describe os.version do
  it { should cmp.loose '22' }     # Passes for 22.04, 22.10, etc
  it { should cmp.loose >= '20' }  # Passes for any version 20 or higher
end

# Using segment matching for specific version parts
describe os.version do
  it { should cmp.segments(1) '22' }     # Only checks major version (22)
  it { should cmp.segments(2) '22.04' }  # Checks major and minor version (22.04)
  it { should cmp.segments(3) '22.04.1'} # Checks major, minor and patch version
end

# Complex version comparisons
control 'os-version' do
  impact 1.0
  title 'Verify OS version requirements'
  desc 'Ensure OS version meets minimum requirements'
  
  if os.debian?
    describe os.version do
      it { should cmp >= '22.04' }
      it { should cmp.segments(2) >= '22.04' }  # Must be Ubuntu 22.04 or higher
    end
  elsif os.redhat?
    describe os.version do
      it { should cmp >= '8.0' }
      it { should cmp.loose >= '8' }  # Any RHEL 8 or higher
    end
  end
end
```

### Test Platform-Specific Information

```ruby
# Test for Windows
describe os do
  it { should be_windows }
  its('family') { should eq 'windows' }
end

# Test for Ubuntu
describe os do
  it { should be_debian }
  its('name') { should eq 'ubuntu' }
  its('release') { should eq '22.04' }
end
```

### Using the params Method

The `params` method returns a hash containing all platform information:

```ruby
describe os.params do
  its(['name']) { should eq 'ubuntu' }
  its(['family']) { should eq 'debian' }
  its(['release']) { should eq '22.04' }
  its(['arch']) { should eq 'x86_64' }
  its(['version', 'major']) { should eq 22 }
  its(['version', 'minor']) { should eq 4 }
end
```

## Platform Detection Helpers

The `os` resource includes helper methods for platform detection:

| Helper Method | Description |
|--------------|-------------|
| `aix?` | AIX platform |
| `bsd?` | BSD-based platforms (Darwin, FreeBSD, NetBSD, OpenBSD) |
| `darwin?` | macOS/Darwin platform |
| `debian?` | Debian-based platforms |
| `hpux?` | HP-UX platform |
| `linux?` | Linux-based platforms |
| `redhat?` | Red Hat-based platforms (including CentOS) |
| `solaris?` | Solaris-based platforms |
| `suse?` | SUSE-based platforms |
| `unix?` | Unix-based platforms |
| `windows?` | Windows platforms |

Example usage:

```ruby
describe 'Platform detection' do
  it 'identifies the platform correctly' do
    expect(os.debian?).to eq true if os.name == 'ubuntu'
    expect(os.redhat?).to eq true if os.name == 'centos'
  end
end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

The `os` resource supports all standard matchers and comparison operators. Additionally, it provides platform-specific helper matchers (e.g., `be_windows`, `be_linux`) that correspond to the helper methods listed above.
