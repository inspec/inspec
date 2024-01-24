+++
title = "x509_private_key resource"
draft = false
gh_repo = "inspec"
platform = "unix"

[menu]
  [menu.inspec]
    title = "x509_private_key"
    identifier = "inspec/resources/os/x509_private_key.md x509_private_key resource"
    parent = "inspec/resources/os"
+++

Use the `x509_private_key` Chef InSpec audit resource to test the x509 private key.

## Availability

### Install

The Chef InSpec distributes this resource.

## Syntax

An `x509_private_key` Chef InSpec audit resource allows you to test the x509 private key.

```ruby
    describe x509_private_key("/home/x509_private_key.pem", "key_password") do
      it { should be_valid }
      it { should be_encrypted }
      it { should have_matching_certificate("/home/x509_certificate.crt") }
    end
```

> where
>
> - `"/home/x509_private_key.pem"` is the path of the private key.
> - `"key_password"` is the password of the private key. This is optional for private keys without password.
> - `be_valid`, `be_encrypted`, and `have_matching_certificate` are matchers of this resource
> - `"/home/x509_certificate.crt"` is a x509 certificate generated using the specified private key.

## Matchers

For a full list of available matchers, please visit the [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `be_valid`, `be_encrypted`, and `have_matching_certificate`.

### be_valid

The `be_valid` matcher tests if the specified private key is valid.

```ruby
    it { should be_valid }
```

### be_encrypted

The `be_encrypted` matcher tests if the specified private key is encrypted.

```ruby
    it { should be_encrypted }
```

### have_matching_certificate

The `have_matching_certificate` matcher tests if the x509 private key has a matching certificate.

```ruby
    it { should have_matching_certificate("/home/x509_certificate.crt") }
```

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Checks if the x509 private key is valid

`be_valid` checks if the x509 private key is valid.

```ruby
    describe x509_private_key("/home/x509_private_key.pem", "key_password") do
      it { should be_valid }
    end
```

### Checks if the x509 private key is valid without a password

`be_valid` checks if the x509 private key is valid.

```ruby
    describe x509_private_key("/home/x509_private_key.pem") do
      it { should be_valid }
    end
```

### Checks if the x509 private key is encrypted

`be_encrypted` checks if the x509 private key is encrypted.

```ruby
    describe x509_private_key("/home/x509_private_key.pem", "key_password") do
      it { should be_encrypted }
    end
```

### Checks if the x509 private key has a matching certificate

`be_valid` checks if the x509 private key has a matching certificate.

```ruby
    describe x509_private_key("/home/x509_private_key.pem", "key_password") do
      it { should have_matching_certificate("/home/x509_certificate.crt") }
    end
```
