
require 'openssl'
require 'hashie/mash'
require 'utils/file_reader'

module Inspec::Resources
  class X509CertificateResource < Inspec.resource(1)
    name 'x509_certificate'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Used to test x.509 certificates'
    example <<~EXAMPLE
      describe x509_certificate('/etc/pki/www.mywebsite.com.pem') do
        its('subject') { should match /CN=My Website/ }
        its('validity_in_days') { should be > 30 }
      end

      describe x509_certificate('trials/x509/cert.pem') do
        it { should be_certificate }
        it { should be_valid }
        its('fingerprint') { should eq '62b137bdf427e7273dc2e487877b3033e4c8ce17' }
        its('signature_algorithm') { should eq 'sha1WithRSAEncryption' }
        its('validity_in_days') { should_not be < 100 }
        its('validity_in_days') { should be >= 100 }
        its('subject_dn') { should eq '/C=DE/ST=Berlin/L=Berlin/O=InSpec/OU=Chef Software, Inc/CN=inspec.io/emailAddress=support@chef.io' }
        its('subject.C') { should eq 'DE' }
        its('subject.emailAddress') { should_not be_empty }
        its('subject.emailAddress') { should eq 'support@chef.io' }
        its('issuer_dn') { should eq '/C=DE/ST=Berlin/L=Berlin/O=InSpec/OU=Chef Software, Inc/CN=inspec.io/emailAddress=support@chef.io' }
        its('key_length') { should be >= 2048 }
        its('extensions.subjectKeyIdentifier') { should cmp 'A5:16:0B:12:F4:48:0F:06:6C:32:29:67:98:12:DF:3D:0D:75:9D:5C' }
      end
    EXAMPLE

    include FileReader

    # @see https://tools.ietf.org/html/rfc5280#page-23
    def initialize(filename)
      @certpath = filename
      @issuer = nil
      @parsed_subject = nil
      @parsed_issuer = nil
      @extensions = nil
      @cert = OpenSSL::X509::Certificate.new read_file_content(@certpath)
    end

    # Forward these methods directly to OpenSSL::X509::Certificate instance
    %w{version not_before not_after signature_algorithm public_key}.each do |m|
      define_method m do |*args|
        @cert.send(m, *args)
      end
    end

    def certificate?
      !@cert.nil?
    end

    def fingerprint
      return if @cert.nil?
      OpenSSL::Digest::SHA1.new(@cert.to_der).to_s
    end

    def serial
      return if @cert.nil?
      @cert.serial.to_i
    end

    def subject_dn
      return if @cert.nil?
      @cert.subject.to_s
    end

    def subject
      return if @cert.nil?
      # Return cached subject if we have already parsed it
      return @parsed_subject if @parsed_subject
      # Use a Mash to make it easier to access hash elements in "its('subject') {should ...}"
      @parsed_subject = Hashie::Mash.new(Hash[@cert.subject.to_a.map { |k, v, _| [k, v] }])
    end

    def issuer_dn
      return if @cert.nil?
      @cert.issuer.to_s
    end

    def issuer
      return if @cert.nil?
      # Return cached subject if we have already parsed it
      return @parsed_issuer if @parsed_issuer
      # Use a Mash to make it easier to access hash elements in "its('issuer') {should ...}"
      @parsed_issuer = Hashie::Mash.new(Hash[@cert.issuer.to_a.map { |k, v, _| [k, v] }])
    end

    def key_length
      return if @cert.nil?
      @cert.public_key.n.num_bytes * 8
    end

    def validity_in_days
      (not_after - Time.now.utc) / 86400
    end

    def valid?
      now = Time.now
      certificate? && (now >= not_before && now <= not_after)
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
      extension_array = @cert.extensions.map(&:to_s)
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
