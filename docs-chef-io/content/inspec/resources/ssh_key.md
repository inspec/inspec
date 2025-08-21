+++
title = "ssh_key resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "ssh_key"
    identifier = "inspec/resources/os/ssh_key.md ssh_key resource"
    parent = "inspec/resources/os"
+++

Use the `ssh_key` Chef InSpec audit resource to test ssh keys. Supported key types RSA, DSA(Limited support. Not verifies private key) , ECDSA, Ed25519

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.18.0 of Chef InSpec.

## Syntax

The `ssh_key` resource tests the properties of an SSH key file. Provide the path to a key file or a key filename. If you pass in a filename, this resource checks for keys on default path  `~/.ssh/`.

```rb
describe ssh_key('~/.ssh/id_rsa') do
  it { should be_private }
  it { should be_public }
  its('type') { should cmp /rsa/ }
  its('key_length') { should eq 2048 }
  its('mode') { should cmp '0400' }
end
```

You can use an optional passphrase with `ssh_key`:

```rb
describe ssh_key('~/.ssh/id_rsa', '<PASSPHRASE>') do
  it { should be_private }
end
```

Replace `<PASSPHRASE>` with the private key passphrase.

## Properties

### key_length

The `key_length` property tests the number of bits in the key pair. This only works with RSA keys.

```rb
describe ssh_key('~/.ssh/id_rsa') do
  its('key_length') { should eq 4096 }
end
```

### type

The `type` property verifies the key type.

```rb
describe ssh_key('~/.ssh/id_ecdsa') do
  its('type') { should cmp /ecdsa/ }
end
```

Allowed values:

- `rsa`
- `ecdsa`
- `ed25519`
- `dsa`

### file properties

The ssh_key resource also tests the same properties that the [file resource](/inspec/resources/file#properties) tests.
For example, you can use the `mode` property to test if the mode assigned to the SSH key matches the specified value.

```rb
describe ssh_key('~/.ssh/id_rsa') do
  its('mode') { should cmp '0400' }
end
```

## Matchers

For a full list of available matchers, see the [matchers page](/inspec/matchers/).

### be_public

Use `be_public` to verify that a key is public key:

```rb
describe ssh_key('~/.ssh/id_ed25519.pub') do
  it { should be_public }
end
```

### be_private

Use `be_private` to verify that a key is a private key:

```rb
describe ssh_key('~/.ssh/id_ecdsa', '<PASSPHRASE>') do
  it { should be_private }
end
```

Replace `<PASSPHRASE>` with the private key passphrase.
