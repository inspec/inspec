
require 'helper'
require 'inspec/resource'
require 'inspec/resources/x509_certificate'

describe 'Inspec::Resources::X509Certificate' do
  let (:resource_cert) {
    load_resource(
      'x509_certificate',
      'test_certificate.rsa.crt.pem'
    )
  }

  # TODO: Regenerate certificate using `InSpec` not `Inspec`
  it 'verify subject distingushed name' do
    _(resource_cert.send('subject_dn')).must_match 'Inspec Test Certificate'
  end

  # TODO: Regenerate certificate using `InSpec` not `Inspec`
  it 'parses the certificate subject' do
    _(resource_cert.send('subject').CN).must_equal 'Inspec Test Certificate'
    _(resource_cert.send('subject').emailAddress).must_equal 'support@chef.io'
  end

  # TODO: Regenerate certificate using `InSpec` not `Inspec`
  it 'verify issue distingushed name' do
    _(resource_cert.send('issuer_dn')).must_match 'Inspec Test CA'
  end

  # TODO: Regenerate certificate using `InSpec` not `Inspec`
  it 'parses the issuer' do
    _(resource_cert.send('issuer').CN).must_equal 'Inspec Test CA'
  end

  it 'parses the public key' do
    _(resource_cert.send('public_key').to_s).must_match "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxi1Tp4dPQ+GU+RipsguU\nWT50a6fsBCpe+QT0YdW/7GG6kynRzR+fzQ0q1LDxpgqAH+eDIWEAFYoTPc8haAjZ\nvAYn7JlXUQpeoK7fc2BPgYA0lr33Ee0H9nqeZlnytQ+/EVUqqDx61cgeW3ARAK1I\nODwhuziuTi7XNu+HTx3feH4ohq/FppB26PYfJo1jCmt7YxHxl6AGrYrEX5zubQR0\nAtPAJzg0/aqDH5GJHJETjloIxh/KLnGlbG3DJylFU+vPxvns1TKM0dezg8UefXer\nRtxDAwSix7sNctXwa0xToc6O+e/StNPR0eLvILS8iR89fuML57Z4AGFWMNdqTYoj\nqwIDAQAB\n-----END PUBLIC KEY-----\n"
  end

  it 'can determine fingerprint' do
    _(resource_cert.send('fingerprint')).must_equal '62bb500b0190ae47fd593c29a0b92ddbeb6c1eb6'
  end

  it 'can determine the key length' do
    _(resource_cert.send('key_length')).must_equal 2048
  end

  it 'parses the serial number' do
    _(resource_cert.send('serial')).must_equal 37
  end

  it 'parses the signature algorithm' do
    _(resource_cert.send('signature_algorithm')).must_equal 'sha256WithRSAEncryption'
  end

  it 'parses the x.509 certificate version' do
    _(resource_cert.send('version')).must_equal 2
  end

  it 'includes the standard extensions even if they are not in the certificate' do
    _(resource_cert.send('extensions').length).must_equal 16
    _(resource_cert.send('extensions')).must_include 'keyUsage'
    _(resource_cert.send('extensions')).must_include 'extendedKeyUsage'
    _(resource_cert.send('extensions')).must_include 'subjectAltName'
  end

  it 'parses the x.509 certificate extensions' do
    _(resource_cert.send('extensions')['keyUsage']).must_include "Digital Signature"
    _(resource_cert.send('extensions')['keyUsage']).must_include "Non Repudiation"
    _(resource_cert.send('extensions')['keyUsage']).must_include "Data Encipherment"
    _(resource_cert.send('extensions')['extendedKeyUsage']).must_include "TLS Web Server Authentication"
    _(resource_cert.send('extensions')['extendedKeyUsage']).must_include "Code Signing"
    _(resource_cert.send('extensions')['subjectAltName']).must_include "email:support@chef.io"
  end

  it 'parses missing x.509 certificate extensions' do
    _(resource_cert.send('extensions')['nameConstraints']).wont_include "Fried Chicken"
  end

  it 'calculates the remaining days of validity' do
    # Still valid
    Time.stub :now, Time.new(2018, 2, 1, 1, 28, 57, '+00:00') do
      _(resource_cert.send('validity_in_days')).must_equal 28
    end
    # Expired
    Time.stub :now, Time.new(2018, 4, 1, 1, 28, 57, '+00:00') do
      _(resource_cert.send('validity_in_days')).must_equal (-31)
    end
  end
end
