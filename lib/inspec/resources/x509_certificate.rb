require "openssl" unless defined?(OpenSSL)
require "hashie/mash"
require "inspec/utils/file_reader"

module Inspec::Resources
  class X509CertificateResource < Inspec.resource(1)
    name "x509_certificate"
    supports platform: "unix"
    supports platform: "windows"
    desc "Used to test x.509 certificates"
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
    def initialize(opts)
      @opts = options(opts)
      @issuer = nil
      @parsed_subject = nil
      @parsed_issuer = nil
      @extensions = nil
      @content = @opts[:content]
      @content ||= read_file_content(@opts[:filepath])
      @cert = OpenSSL::X509::Certificate.new @content
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

      OpenSSL::Digest.new("SHA1", @cert.to_der).to_s
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

    # This property is equivalent to subject.emailAddress
    def email
      subject.emailAddress
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

    alias :keylength :key_length

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

    # check purpose of the certificate
    def has_purpose?(purpose)
      # If we have the filepath in our options we use the filepath to fetch the purposes.
      # Else, we create a temporary file and write the content to that file.
      # Then, use the temporary file to fetch the purposes.
      # Todo: Check if this can be optimized or improved.

      if @opts[:filepath]
        cert_purpose = fetch_purpose(@opts[:filepath])
      else
        begin
          f = File.open("temporary_certificate.pem", "w")
          f.write(@cert.to_pem)
          f.rewind
          cert_purpose = fetch_purpose("temporary_certificate.pem")
        ensure
          f.close unless f.nil? || f.closed?
          File.delete("temporary_certificate.pem") if File.exist? "temporary_certificate.pem"
        end
      end
      cert_purpose =~ /purpose/ ? true : false
    end

    def fetch_purpose(cert_file_or_path)
      openssl_utility = check_openssl_or_error

      # The below command is used to view the Certificate purposes
      # The -in argument expects a certificate file or path to certificate file.
      cert_purpose_cmd = "#{openssl_utility} x509 -noout -purpose -in #{cert_file_or_path}"
      cert_purpose = inspec.command(cert_purpose_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing #{cert_purpose_cmd} failed: #{cert_purpose.stderr}" if cert_purpose.exit_status.to_i != 0

      cert_purpose.stdout
    end

    def subject_alt_names
      extensions["subjectAltName"]
    end

    def resource_id
      @opts[:filepath] || subject.CN || "x509 Certificate"
    end

    def to_s
      cert = @opts[:filepath]
      cert ||= subject.CN
      "x509_certificate #{cert}"
    end

    private

    def options(opts)
      if opts.is_a?(String)
        { filepath: opts }
      else
        opts
      end
    end

    def check_openssl_or_error
      %w{/usr/sbin/openssl /usr/bin/openssl /sbin/openssl /bin/openssl openssl}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `openssl` on your system."
    end
  end
end
