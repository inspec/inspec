+++
title = "service resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "service"
    identifier = "inspec/resources/os/service.md service resource"
    parent = "inspec/resources/os"
+++

Use the `service` Chef InSpec audit resource to test whether the installation of the named service is successful and enabled.

It may be necessary to specify the service manager by using one of the following service manager-specific resources: `bsd_service`, `launchd_service`, `runit_service`, `systemd_service`, `sysv_service`, and `upstart_service`. These resources are based on the `service` resource.

## Availability

### Install

The Chef InSpec distributes this resource.

### Version

This resource is available from Chef Inspec version 1.0.0.

## Syntax

A `service` resource block declares the name of a service and one or more matchers to test the service state.

```ruby
    describe service('NAME') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
```

> where
>
> - `('service_name')` must specify a service name
> - `be_installed`, `be_enabled`, and `be_running` are valid matchers for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if the PostgreSQL service is both running and enabled

```ruby
    describe service('PostgreSQL') do
      it { should be_enabled }
      it { should be_running }
    end
```

### Test if the MYSQL service is running and enabled

```ruby
    describe service('MYSQL') do
      it { should be_enabled }
      it { should be_running }
    end
```

### Test if the installation of ClamAV (an antivirus engine) is successful  and running

```ruby
    describe package('clamav') do
      it { should be_installed }
      its('version') { should eq '0.98.7' }
    end

    describe service('clamd') do
      it { should_not be_enabled }
      it { should_not be_installed }
      it { should_not be_running }
    end
```

### Test Unix SystemV run levels

On targets that are using SystemV services, the existing run levels can also be checked:

```ruby
    describe service('SSH').runlevels do
      its('keys') { should include(2) }
    end

    describe service('SSH').runlevels(2,4) do
      it { should be_enabled }
    end
```

### Override the service manager

It may be required to override the logic to select the right service manager. For example, to check a service managed by Upstart.

```ruby
    describe upstart_service('SERVICE') do
      it { should_not be_enabled }
      it { should be_installed }
      it { should be_running }
    end
```

This is also possible with `systemd_service`, `runit_service`, `sysv_service`, `bsd_service`, and `launchd_service`. If not found at the default location, provide the **control** command. For example, if the `sv` command for services managed by `runit` is not in the `PATH`.

```ruby
    describe runit_service('SERVICE', '/opt/chef/embedded/sbin/sv') do
      it { should be_enabled }
      it { should be_installed }
      it { should be_running }
    end
```

### Verify IIS is running

```ruby
    describe service('W3SVC') do
      it { should be_installed }
      it { should be_running }
    end
```

## Matchers

For a full list of available matchers, please visit the [matchers page](/inspec/matchers/).

### be_enabled

The `be_enabled` matcher tests if the named service is enabled:

```ruby
    it { should be_enabled }
```

### be_installed

The `be_installed` matcher tests if the named service is installed.

```ruby
    it { should be_installed }
```

### be_running

The `be_running` matcher tests if the named service is running.

```ruby
    it { should be_running }
```

### be_monitored_by

The `be_monitored_by` matcher accepts the name of a monitoring tool as input and test if the named service is monitored respectively. The monitoring tool supports `monit` and `god` resources.

```ruby
    it { should be_monitored_by("god") }
```

### have_start_mode

The `have_start_mode` matcher tests accept a mode as input and test if the named service's start mode is the same as specified in the input. This matcher  is supported on the Windows systems only.

```ruby
    it { should have_start_mode('Manual') }
```
