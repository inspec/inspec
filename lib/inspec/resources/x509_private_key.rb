require "openssl" unless defined?(OpenSSL)
require "inspec/utils/file_reader"
require "inspec/resources/file"

module Inspec::Resources
  class X509PrivateKey < Inspec.resource(1)
    # Resource internal name.
    name "x509_private_key"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the ipnat InSpec audit resource to test the x509 private key"

    example <<~EXAMPLE
      describe "x509_private_key" do
        its("shoe_size") { should cmp 10 }
      end
      describe "x509_private_key" do
        it { should be_purple }
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
      # If passphrase is provided append it to check_key_validity_cmd with passin argument.
      cmd = passphrase ? check_key_validity_cmd.concat(" -passin pass:#{passphrase}") : check_key_validity_cmd
      exec_cmd = inspec.command(cmd)
      exec_cmd.exit_status.to_i == 0
    end

    # Matcher to check if the given key is encrypted.
    def encrypted?
      raise Inspec::Exceptions::ResourceFailed, "The given secret key #{secret_key_path} does not exist." unless inspec.file(secret_key_path).exist?

      # All encrypted keys have the header of Proc-Type: 4,ENCRYPTED
      key_file = inspec.file(secret_key_path)
      key_file.content =~ /Proc-Type: 4,ENCRYPTED/
    end

    private

    # This resource requires openssl to be available on the system
    def check_openssl_or_error
      %w{/usr/sbin/openssl /usr/bin/openssl /sbin/openssl /bin/openssl openssl}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `openssl` on your system."
    end

    # Returns the general command to check for validity of a key
    def check_key_validity_cmd
      "#{openssl_utility} rsa -in #{secret_key_path} -check -noout"
    end
  end
end
