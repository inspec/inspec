+++
title = "key_rsa resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "key_rsa"
    identifier = "inspec/resources/os/key_rsa.md key_rsa resource"
    parent = "inspec/resources/os"
+++

Use the `key_rsa` Chef InSpec audit resource to test RSA public/private keypairs.

This resource is mainly useful when used in conjunction with the x509_certificate resource but it can also be used for checking SSH keys.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.18.0 of InSpec.

## Syntax

An `key_rsa` resource block declares a `key file` to be tested.

    describe key_rsa('certificate.key') do
      it { should be_private }
      it { should be_public }
      its('public_key') { should match "PUBLIC_KEY" }
      its('key_length') { should eq 2048 }
    end

You can use an optional passphrase with `key_rsa`

    describe key_rsa('certificate.key', 'passphrase') do
      it { should be_private }
    end

## Properties

### public_key (String)

The `public_key` property returns the public part of the RSA key pair

    describe key_rsa('/etc/pki/www.example.com.key') do
      its('public_key') { should match "RSA_PUBLIC_KEY" }
    end

### private_key (String)

The `private_key` property returns the private key or the RSA key pair.

    describe key_rsa('/etc/pki/www.example.com.key') do
      its('private_key') { should match "RSA_PRIVATE_KEY" }
    end

### key_length

The `key_length` property allows testing the number of bits in the key pair.

    describe key_rsa('/etc/pki/www.example.com.key') do
      its('key_length') { should eq 2048 }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### public?

To verify if a key is public use the following:

    describe key_rsa('/etc/pki/www.example.com.key') do
      it { should be_public }
    end

### private?

This property verifies that the key includes a private key:

    describe key_rsa('/etc/pki/www.example.com.key') do
      it { should be_private }
    end
