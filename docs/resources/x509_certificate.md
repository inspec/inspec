---
title: The x509_certificate Resource
---

# x509_certificate

Use the `x509_certificate` InSpec audit resource to test the fields and validity of an x.509 certificate.

X.509 certificates use public/private key pairs to sign and encrypt documents
or communications over a network. They may also be used for authentication.

Examples include SSL certificates, S/MIME certificates and VPN authentication
certificates.

## Syntax

An `x509_certificate` resource block declares a certificate `key file` to be tested.

    describe x509_certificate('mycertificate.pem') do
      its('days_remaining') { should be > 30 }
    end

It can optionally specify a private key file and a ca public key file for key verification

    describe x509_certificate('mycertificate.cert','mycertificate.key','ca_key.pub') do
      its('private_key_matches?') { should be true }
      its('ca_key_matches?') { should be true }
    end

## Supported Properties

### subject (String)

The `subject` string contains several fields seperated by forward slashes. The
field identifiers are the same ones used by OpenSSL to generate CSR's and certs.

e.g. `/C=US/L=Seattle/O=Chef Software Inc/OU=Chefs/CN=Richard Nixon`

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('subject') { should match "CN=www.mywebsite.com" }
    end

### parsed_subject.XX

`parsed_subject` property makes it easier to access individual subject elements.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('parsed_subject.CN') { should eq "www.mywebsite.com" }
    end

### issuer (String)

The `issuer` string is copied from a CA (certificate authority) during the
certificate signing process. It describes which authority is guaranteeing the
identity of our certificate.

e.g. `/C=US/L=Seattle/CN=Acme Trust CA/emailAddress=support@acmetrust.org`

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('issuer') { should match "CN=Acme Trust CA" }
    end

### parsed_issuer.XX

`parsed_issuer` makes it easier to access individual issuer elements.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('parsed_issuer.CN') { should eq "Acme Trust CA" }
    end

### public_key (String)

The `public_key` property returns a base64 encoded public key in PEM format.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\nblah blah blah..." }
    end

### key_length (Integer)

The `key_length` property calculates the number of bits in the public key.
More bits increase security, but at the cost of speed and in extreme cases, compatibility.

    describe x509_certificate('mycert.pem') do
      its('key_length') { should be 2048 }
    end

### signature_algorithm (String)

The `signature_algorithm` property describes which hash function was used by the CA to
sign the certificate.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('signature_algorithm') { should be 'sha256WithRSAEncryption' }
    end

### private_key_matches?  (Boolean)   ca_key_matches?  (Boolean)

The `private_key_matches?` and `ca_key_matches?` methods check

* If the supplied private key matches the certificate
* If the CA public key belongs to the CA that signed the certificate


    describe x509_certificate('mycertificate.cert','mycertificate.key','ca_key.pub') do
      its('private_key_matches?') { should be true }
      its('ca_key_matches?') { should be true }
    end


### days_remaining (Float)

The `days_remaining` property can be used to check that certificates are not in
danger of expiring soon.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('days_remaining') { should be > 30 }
    end

### not_before and not_after (Time)

The `not_before` and `not_after` properties expose the start and end dates of certificate
validity. They are exposed as ruby Time class so that date arithmetic can be easily performed.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('not_before') { should be <= Time.utc.now }
      its('not_after')  { should be >= Time.utc.now }
    end

### serial (Integer)

The `serial` property exposes the serial number of the certificate. The serial number is set by the CA during the signing process and should be unique within that CA.

### version (Integer)

The `version` property exposes the certificate version.

### extensions (Hash)

The `extensions` hash property is mainly used to determine what the certificate can be used for.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('extensions').length) {should eq 3 }

      # Check what extension categories we have
      its('extensions')) { should include 'keyUsage' }
      its('extensions')) { should include 'extendedKeyUsage' }
      its('extensions')) { should include 'subjectAltName' }

      # Check examples of basic 'keyUsage'
      its('extensions')['keyUsage']) { should include "Digital Signature" }
      its('extensions')['keyUsage']).must_include "Non Repudiation"
      its('extensions')['keyUsage']).must_include "Data Encipherment"

      # Check examples of newer 'extendedKeyUsage'
      its('extensions')['extendedKeyUsage']) { should include "TLS Web Server Authentication" }
      its('extensions')['extendedKeyUsage']) { should include "Code Signing" }

      # Check examples of 'subjectAltName'
      its('extensions')['subjectAltName']) { should include "email:support@chef.io" }
    end
