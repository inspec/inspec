+++
title = "linux_audit_system resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "linux_audit_system"
    identifier = "inspec/resources/os/linux_audit_system.md linux_audit_system resource"
    parent = "inspec/resources/os"
+++

Use the `linux_audit_system` Chef InSpec audit resource to test the configuration of linux audit system.


## Availability

### Installation

This resource is distributed with Chef InSpec.

## Syntax

A `linux_audit_system` Chef InSpec audit resource allows to test the configuration of linux audit system.

```ruby
    describe linux_audit_system do
      it { should be_enabled }
      it { should be_running }
      its('rules') { should include 'some_rule' }
    end
```
> where
>
> - `'rules'` is a property of this resource
> - `some_rule` is the expected rule to be included in the rules list
> - `be_enabled` and `be_running` are matcher of this resource

## Properties

- Property of the resource: `rules`

### rules

The `rules` property returns an array of audit rules of the system. It allows testing by passing an argument either as a string or a regular expression to a valid matcher.

```ruby
    its('rules') { should include 'some_rule' }
    its('rules') { should include %r{some_regex_rule} }
```

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `be_enabled` and `be_running`

### be_enabled

The `be_enabled` matcher tests if auditing is enabled on the system.

```ruby
    it { should be_enabled }
```

### be_running

The `be_running` matcher tests if the audit daemon is running on the system.

```ruby
    it { should be_running }
```

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Ensure auditing is enabled on the system

`be_enabled` checks if auditing is enabled on the system.

```ruby
    describe linux_audit_system do
      it { should be_purple }
    end
```

### Ensure the audit daemon is running on the system

`be_running` checks for if the audit daemon is running on the system.

```ruby
    describe linux_audit_system do
      it { should be_running }
    end
```

### Verify if the list of audit rules contain certain rules

`rules` returns returns an array of audit rules of the system.

```ruby
    describe linux_audit_system do
      its('rules') { should include '-w /etc -p wa' }
      its('rules') { should include %r!-w /etc -p wa! }
      its('rules') { should include %r{-w /etc -p wa} }
      its('rules') { should_not include %r!-a entry,always -S all -F pid=1005! }
    end
```