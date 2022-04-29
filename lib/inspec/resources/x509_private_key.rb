require "inspec/resources/file"

module Inspec::Resources
  class X509PrivateKey < Inspec.resource(1)
    # Resource internal name.
    name "x509_private_key"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the x509_private_key InSpec audit resource to test the x509 private key"

    example <<~EXAMPLE
      # With passphrase
      describe x509_private_key("/home/openssl_activity/alice_private.pem", "password@123") do
        it { should be_valid }
        it { should be_encrypted }
        it { should have_matching_certificate("/home/openssl_activity/alice_certificate.crt") }
      end

      # Without passphrase
      describe x509_private_key("/home/openssl_activity/bob_private.pem") do
        it { should be_valid }
        it { should_not be_encrypted }
        it { should have_matching_certificate("/home/openssl_activity/bob_certificate.crt") }
      end
    EXAMPLE

    # Resource initialization.
    attr_reader :secret_key_path, :passphrase, :openssl_utility

    def initialize(secret_key_path, passphrase = nil)
      @openssl_utility = check_openssl_or_error
      @secret_key_path = secret_key_path
      @passphrase = passphrase
    end

    # Resource appearance in test reports.
    def to_s
      "x509_private_key"
    end

    # Matcher to check if the given key is valid.
    def valid?
      # Below is the command to check if the key is valid.
      openssl_key_validity_cmd = "#{openssl_utility} rsa -in #{secret_key_path} -check -noout"

      # Additionally, if key is password protected, passphrase needs to be given with -passin argument
      openssl_key_validity_cmd.concat(" -passin pass:#{passphrase}") if passphrase

      openssl_key_validity = inspec.command(openssl_key_validity_cmd)
      openssl_key_validity.exit_status.to_i == 0
    end

    # Matcher to check if the given key is encrypted.
    def encrypted?
      raise Inspec::Exceptions::ResourceFailed, "The given secret key #{secret_key_path} does not exist." unless inspec.file(secret_key_path).exist?

      # All encrypted keys have the header of Proc-Type: 4,ENCRYPTED
      key_file = inspec.file(secret_key_path)
      key_file.content =~ /Proc-Type: 4,ENCRYPTED/
    end

    # Matcher to verify if the private key maatches the certificate
    def has_matching_certificate?(cert_file_or_path)
      cert_hash_cmd = "openssl x509 -noout -modulus -in #{cert_file_or_path} | openssl md5"
      cert_hash = inspec.command(cert_hash_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing #{cert_hash_cmd} failed: #{cert_hash.stderr}" if cert_hash.exit_status.to_i != 0

      key_hash_cmd = "openssl rsa -noout -modulus -in #{secret_key_path}"
      passphrase ? key_hash_cmd.concat(" -passin pass:#{passphrase} | openssl md5") : key_hash_cmd.concat(" | openssl md5")
      key_hash = inspec.command(key_hash_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing #{key_hash_cmd} failed: #{key_hash.stderr}" if key_hash.exit_status.to_i != 0

      cert_hash.stdout == key_hash.stdout
    end

    private

    # This resource requires openssl to be available on the system
    def check_openssl_or_error
      %w{/usr/sbin/openssl /usr/bin/openssl /sbin/openssl /bin/openssl openssl}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `openssl` on your system."
    end
  end
end
