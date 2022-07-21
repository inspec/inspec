+++
title = "x509_certificate resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "x509_certificate"
    identifier = "inspec/resources/os/x509_certificate.md x509_certificate resource"
    parent = "inspec/resources/os"
+++

Use the `x509_certificate` Chef InSpec audit resource to test the fields and validity of an x.509 certificate.

X.509 certificate uses public or private key pairs to sign and encrypt communications and documents over a network. These certificates are also used for network authentication. Examples include Secure Sockets Layer (SSL) certificates, Secure/Multipurpose Internet Mail Extensions (S/MIME) certificates, and Virtual Private Network (VPN) authentication certificates.

## Availability

### Installation

Chef InSpec distributes this resource.

### Version

This resource is available from InSpec version 1.18.

## Syntax

An `x509_certificate` resource block declares a certificate `key file` to be tested.

    describe x509_certificate('certificate.pem') do
      its('validity_in_days') { should be > 30 }
    end

The `filepath` property can also be used.

    describe x509_certificate(filepath: 'certificate.pem') do
      its('validity_in_days') { should be > 30 }
    end

This resource also supports passing the content of the certificate.

    cert_content = file('certificate.pem').content

    describe x509_certificate(content: cert_content) do
      its('validity_in_days') { should be > 30 }
    end

The `content` value is used if the `content` and `filepath` are specified.

## Properties

### subject.XX

The `subject` (string) property accesses the individual subject elements.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('subject.CN') { should eq "www.example.com" }
    end

### subject_dn

The `subject_dn` (string) property returns the distinguished name of the subject field. It contains many fields separated by forward slashes (/). The field identifiers are the same ones used by OpenSSL to generate Certificate Signing Requests (CSR's) and certificates. To access the parsed version, use `subject.XX` instead.

For example, `/C=US/L=Seattle/O=Chef Software Inc/OU=Chefs/CN=Richard Nixon`

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('subject_dn') { should match "CN=www.example.com" }
    end

### issuer.XX

The `issuer` (string) property accesses the individual issuer elements.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('issuer.CN') { should eq "Acme Trust CA" }
    end

### issuer_dn

During the certificate signing process, the `issuer_dn` (string) property is the distinguished name from a Certificate Authority (CA). This property states which authority is guaranteeing the identity of the certificate.

For example, `/C=US/L=Seattle/CN=Acme Trust CA/emailAddress=support@acmetrust.org`

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('issuer_cn') { should match "CN=NAME CA" }
    end

### public_key

The `public_key` (string) property returns a base64 encoded public key in PEM format.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\nblah blah blah..." }
    end

### key_length

The `key_length` (integer) property calculates the number of bits in the public key. If the length of bits in the public key increases, the public keys are secure. However, at the cost of speed and compatibility.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('key_length') { should be 2048 }
    end

### keylength

The `keylength` (integer) property is an alias of the `key_length` property.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('keylength') { should be 2048 }
    end

### signature_algorithm

The `signature_algorithm` (string) property describes the CA's hash function to sign the certificate.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('signature_algorithm') { should be 'sha256WithRSAEncryption' }
    end

### validity_in_days

The `validity_in_days` (float) property is used to check the validity of the certificates.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('validity_in_days') { should be > 30 }
    end

### not_before and not_after

The `not_before` and `not_after` (time) properties expose the start and end dates of certificate validity. These dates are exposed as Ruby **Time** class and perform date calculations.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('not_before') { should be <= Time.utc.now }
      its('not_after')  { should be >= Time.utc.now }
    end

### serial

The `serial` (integer) property exposes the certificate's serial number. The CA sets the serial number during the signing process and should be unique within that CA.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('serial') { should eq 9623283588743302433 }
    end

### version

The `version` (integer) property exposes the certificate version.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('version') { should eq 2 }
    end

### extensions

The `extensions` (hash) property is mainly used to determine the purpose of the certificate.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      # Check what extension categories we have
      its('extensions') { should include 'keyUsage' }
      its('extensions') { should include 'extendedKeyUsage' }
      its('extensions') { should include 'subjectAltName' }

      # Check examples of basic 'keyUsage'
      its('extensions.keyUsage') { should include 'Digital Signature' }
      its('extensions.keyUsage') { should include 'Non Repudiation' }
      its('extensions.keyUsage') { should include 'Data Encipherment' }

      # Check examples of newer 'extendedKeyUsage'
      its('extensions.extendedKeyUsage') { should include 'TLS Web Server Authentication' }
      its('extensions.extendedKeyUsage') { should include 'Code Signing' }

      # Check examples of 'subjectAltName'
      its('extensions.subjectAltName') { should include 'email:support@chef.io' }
    end

### email

The `email` (string) property checks for the email address of the certificate. This is equivalent to invoking the property `subject.emailAddress`.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('email') { should_not be_empty }
      its('email') { should eq 'admin@example.com' }
    end

### subject_alt_names

The `subject_alt_names` (string) property checks for the subject alternative names (additional host names) of the certificate.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      its('subject_alt_names') { should include 'DNS:example.com' }
      its('subject_alt_names') { should include 'DNS:www.example.com' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](https://docs.chef.io/inspec/matchers/).

The specific matchers of this resource are: `be_valid`, `be_certificate` and `have_purpose`.

### be_valid

The `be_valid` matcher tests if the specified certificate is valid.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      it { should be_valid }
    end

### be_certificate

The `be_certificate` matcher tests if the specified content or file is a certificate.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      it { should be_certificate }
    end

### have_purpose

The `have_purpose` matcher tests if the certificate meets the specified purpose.

    describe x509_certificate('/etc/pki/www.example.com.pem') do
      it { should have_purpose('SSL client CA : Yes') }
      it { should have_purpose('SSL server CA : Yes') }
    end
