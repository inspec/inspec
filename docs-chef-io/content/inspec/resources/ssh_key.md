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

Use the `ssh_key` Chef InSpec audit resource to test ssh key generated using OpenSSH format. Supported key types RSA, DSA(Limited support. Not verifies private key) , ECDSA, Ed25519

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.18.0 of InSpec.

## Syntax

An `ssh_key` resource block declares a path to `key file` to be tested.

    describe ssh_key('~/.ssh/id_rsa') do
      it { should be_private }
      it { should be_public }
      its('type') { should cmp /rsa/ }
      its('key_length') { should eq 2048 }
    end

You can use an optional passphrase with `ssh_key`

    describe ssh_key('~/.ssh/id_rsa', 'passphrase') do
      it { should be_private }
    end

## Properties

### key_length

The `key_length` property allows testing the number of bits in the key pair. (Works only with RSA type key)

    describe ssh_key('~/.ssh/id_rsa') do
      its('key_length') { should eq 4096 }
    end

### type

This property verifies the type of key. (RSA, ECDSA, ED25519, DSA)

    describe ssh_key('~/.ssh/id_ecdsa') do
      its('type') { should cmp /ecdsa/ }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### public?

To verify if a key is public use the following:

    describe ssh_key('~/.ssh/id_ed25519.pub', 'passphrase') do
      it { should be_public }
    end

### private?

This property verifies that the key includes a private key:

    describe ssh_key('~/.ssh/id_ecdsa') do
      it { should be_private }
    end
