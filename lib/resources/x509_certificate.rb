# encoding: utf-8
# author: Richard Nixon

require 'openssl'
require 'hashie/mash'

module Inspec::Resources
  class X509CertificateResource < Inspec.resource(1)
    name 'x509_certificate'
    desc 'Used to test x.509 certificates'
    example "
      describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
        its('subject') { should match /CN=My Website/ }
        its('days_remaining') { should be > 30 }
      end
    "

    def initialize(certpath,private_keypath=nil,ca_public_keypath=nil)
      @certpath = certpath
      @issuer = nil
      @parsed_subject = nil
      @parsed_issuer = nil
      @extensions = nil
      @cert = cert_from_file(certpath)
      @key = key_from_file(private_keypath)
      @cakey = key_from_file(ca_public_keypath)
    end

    private def cert_from_file(certpath)
      certfile = inspec.backend.file(certpath)
      if certfile.exist?
        certraw = certfile.content
        certcooked = OpenSSL::X509::Certificate.new(certraw)
      else
        certcooked = RuntimeError.new("Certificate #{certpath} not found")
      end
      certcooked
    rescue OpenSSL::X509::CertificateError => error_code
      error_code
    end

    private def key_from_file(keypath)
      keyfile = inspec.backend.file(keypath)
      if keyfile.exist?
        keyraw = keyfile.content
        keycooked = OpenSSL::PKey::RSA.new(keyraw)
      else
        keycooked = RuntimeError.new("Keyfile #{keypath} not found")
      end
      keycooked
    rescue OpenSSL::PKey::RSAError => error_code
      error_code
    end


    # Forward these methods directly to OpenSSL::X509::Certificate instance
    %w{serial version not_before not_after signature_algorithm public_key }.each do |m|
      define_method m.to_sym do |*args|
        @cert.method(m.to_sym).call(*args)
      end
    end

    def exist?
      @certfile.exist?
    end

    def private_key_matches?
      @cert.check_private_key(@key)
    end

    def ca_key_matches?
      @cert.verify(@cakey)
    end

    def subject
      @cert.subject.to_s
    end

    def parsed_subject
      # Return cached subject if we have already parsed it
      return @parsed_subject if @parsed_subject
      # Use a Mash to make it easier to access hash elements in "its('subject') {should ...}"
      @parsed_subject = Hashie::Mash.new(Hash[@cert.subject.to_a.map { |k, v, _| [k, v] }])
    end

    def issuer
      @cert.issuer.to_s
    end

    def parsed_issuer
      # Return cached subject if we have already parsed it
      return @parsed_issuer if @parsed_issuer
      # Use a Mash to make it easier to access hash elements in "its('issuer') {should ...}"
      @parsed_issuer = Hashie::Mash.new(Hash[@cert.issuer.to_a.map { |k, v, _| [k, v] }])
    end

    def key_length
      @cert.public_key.n.num_bytes * 8
    end

    def days_remaining
      (@cert.not_after - Time.now.utc) / 86400
    end

    def extensions
      # Return cached Mash if we already parsed the certificate extensions
      return @extensions if @extensions
      # Return the exception class if we failed to instantiate a Cert from file
      return @cert unless @cert.respond_to? :extensions
      # Use a Mash to make it easier to access hash elements in "its('entensions') {should ...}"
      @extensions = Hashie::Mash.new({})
      # Make sure standard extensions exist so we don't get nil for nil:NilClass
      # when the user tests for extensions which aren't present
      %w{
        keyUsage extendedKeyUsage basicConstraints subjectKeyIdentifier
        authorityKeyIdentifier subjectAltName issuerAltName authorityInfoAccess
        crlDistributionPoints issuingDistributionPoint certificatePolicies
        policyConstraints nameConstraints noCheck tlsfeature nsComment
      }.each { |extension| @extensions[extension] ||= [] }
      # Now parse the extensions into the Mash
      extension_array = @cert.extensions.map { |e| e.to_s }
      extension_array.each do |extension|
        kv = extension.split(/ *= */, 2)
        @extensions[kv.first] = kv.last.split(/ *, */)
      end
      @extensions
    end

    def to_s
      "x509_certificate #{@certpath}"
    end
  end
end
