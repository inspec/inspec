---
title: The key_rsa Resource
---

# key_rsa

Use the `key_rsa` InSpec audit resource to test RSA public/private keypairs.

This resource is mainly useful when used in conjunction with the x509_certificate resource but it can also be used for checking SSH keys.


## Syntax

An `key_rsa` resource block declares a `key file` to be tested.

    describe key_rsa('mycertificate.key') do
      it { should be_private }
      it { should be_public }
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\n3597459df9f3982" }
      its('key_length') { should eq 2048 }
    end

You can use an optional passphrase with `key_rsa`

    describe key_rsa('mycertificate.key', 'passphrase') do
      it { should be_private }
    end

## Supported Properties

### public?

To verify if a key is public use the following:

    describe key_rsa('/etc/pki/www.mywebsite.com.key') do
      it { should be_public }
    end

### public_key (String)

The `public_key` property returns the public part of the RSA key pair

    describe key_rsa('/etc/pki/www.mywebsite.com.key') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\n3597459df9f3982......" }
    end

### private?

This property verifies that the key includes a private key:

    describe key_rsa('/etc/pki/www.mywebsite.com.key') do
      it { should be_private }
    end


### private_key (String)

The `private_key` property returns the private key or the RSA key pair.

    describe key_rsa('/etc/pki/www.mywebsite.com.key') do
      its('private_key') { should match "-----BEGIN RSA PRIVATE KEY-----\nMIIJJwIBAAK......" }
    end

### key_length

The `key_length` property allows testing the number of bits in the key pair.

    describe key_rsa('/etc/pki/www.mywebsite.com.key') do
      its('key_length') { should eq 2048 }
    end
