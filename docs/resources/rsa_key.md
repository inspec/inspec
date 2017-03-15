---
title: The rsa_key Resource
---

# rsa_key

Use the `rsa_key` InSpec audit resource to test RSA public/private keypairs.

This resource is mainly useful when used in conjunction with the x509_certificate resource but it can also be used for checking SSH keys.


## Syntax

An `rsa_key` resource block declares a `key file` to be tested.

    describe rsa_key('mycertificate.key') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\n3597459df9f3982" }
      its('key_length') { should eq 2048 }
    end

## Supported Properties

### public_key (String)

The `public_key` property returns the public part of the RSA keypair

    describe rsa_key('/etc/pki/www.mywebsite.com.key') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\n3597459df9f3982......" }
    end

### private_key (String)

See the `public key` property

### key_length

The key_length` property allows testing the number of bits in the keypair.

    describe rsa_key('/etc/pki/www.mywebsite.com.key') do
      its('key_length') { should eq 2048 }
    end
