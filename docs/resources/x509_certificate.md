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
      its('validity_in_days') { should be > 30 }
    end

## Supported Properties

### subject.XX

`subject` property makes it easier to access individual subject elements.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('subject.CN') { should eq "www.mywebsite.com" }
    end

### subject_dn (String)

The `subject_dn` string returns the distinguished name of the subject field. It contains several fields separated by forward slashes. The field identifiers are the same ones used by OpenSSL to generate CSR's and certs. Use `subject.XX` instead to access the parsed version.

e.g. `/C=US/L=Seattle/O=Chef Software Inc/OU=Chefs/CN=Richard Nixon`

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('subject_dn') { should match "CN=www.mywebsite.com" }
    end

### issuer.XX

`issuer` makes it easier to access individual issuer elements.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('issuer.CN') { should eq "Acme Trust CA" }
    end

### issuer_dn (String)

The `issuer_dn` is the distinguished name from a CA (certificate authority) during the
certificate signing process. It describes which authority is guaranteeing the
identity of our certificate.

e.g. `/C=US/L=Seattle/CN=Acme Trust CA/emailAddress=support@acmetrust.org`

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('issuer_cn') { should match "CN=Acme Trust CA" }
    end

### public_key (String)

The `public_key` property returns a base64 encoded public key in PEM format.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('public_key') { should match "-----BEGIN PUBLIC KEY-----\nblah blah blah..." }
    end

### key_length (Integer)

The `key_length` property calculates the number of bits in the public key.
More bits increase security, but at the cost of speed and in extreme cases, compatibility.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('key_length') { should be 2048 }
    end

### signature_algorithm (String)

The `signature_algorithm` property describes which hash function was used by the CA to
sign the certificate.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('signature_algorithm') { should be 'sha256WithRSAEncryption' }
    end


### validity_in_days (Float)

The `validity_in_days` property can be used to check that certificates are not in
danger of expiring soon.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('validity_in_days') { should be > 30 }
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

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('serial') { should eq 9623283588743302433 }
    end

### version (Integer)

The `version` property exposes the certificate version.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
      its('version') { should eq 2 }
    end

### extensions (Hash)

The `extensions` hash property is mainly used to determine what the certificate can be used for.

    describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
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
