+++
title = "pam resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "pam"
    identifier = "inspec/resources/os/pam.md pam resource"
    parent = "inspec/resources/os"
+++

Use the `pam` Chef InSpec audit resource to test Pluggable Authentication Modules (PAM) configuration files, typically located in `/etc/pam.d/`.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in InSpec vX.Y.Z.

## Syntax

A `pam` resource block declares the PAM configuration file to test and the assertions on its rules:

```ruby
describe pam('/etc/pam.d/system-auth') do
  its('modules') { should include 'pam_unix.so' }
end
```

To filter the rules, use `where`:

```ruby
describe pam('/etc/pam.d/password-auth').where(type: 'password') do
  its('modules') { should include 'pam_pwquality.so' }
  its('controls') { should include 'required' }
end
```

## Properties

### types

Returns an array of the PAM module types (e.g., `auth`, `account`, `password`, `session`).

### missing_oks

Returns a boolean array indicating whether the module type was prefixed with `-` (e.g., `-session`), meaning PAM should not log an error if the module is missing.

### controls

Returns an array of the control flags (e.g., `required`, `requisite`, `sufficient`, `optional`, or complex bracketed controls like `[success=1 default=ignore]`).

### modules

Returns an array of the module paths/names specified in the rules (e.g., `pam_unix.so`).

### module_arguments

Returns an array of strings representing the exact arguments passed to each module.

### module_args

Returns a two-dimensional array of arguments split by whitespace.

## Examples

### Verify that `pam_faillock.so` is required for authentication

```ruby
describe pam('/etc/pam.d/system-auth').where(type: 'auth', module_path: 'pam_faillock.so') do
  its('controls') { should include 'required' }
end
```

### Check that `pam_pwquality.so` includes a specific argument

```ruby
describe pam('/etc/pam.d/system-auth').where(module_path: 'pam_pwquality.so') do
  its('module_args.flatten') { should include 'retry=3' }
end
```

### Validate Ubuntu-specific `@include` directives

```ruby
describe pam('/etc/pam.d/su') do
  its('types') { should include '@include' }
  its('modules') { should include 'common-auth' }
end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).
