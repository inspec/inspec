require "openssl" unless defined?(OpenSSL)
require "inspec/utils/file_reader"

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

    # Define a resource ID. This is used in reporting engines to uniquely identify the individual resource.
    # This might be a file path, or a process ID, or a cloud instance ID. Only meaningful to the implementation.
    # Must be a string. Defaults to the empty string if not implemented.
    def resource_id
      # replace value specific unique to this individual resource instance
      "something special"
    end

    # Define how you want your resource to appear in test reports. Commonly, this is just the resource name and the resource ID.
    def to_s
      "x509_private_key #{resource_id}"
    end

    def has_bells?
      # positive or negative expectations specific to this resource instance
      true # Jingle all the way
    end

    def valid?
      # - With passphrase
      # `openssl rsa -in alice_private.pem -check -noout -passin pass:alice123`
      # - Without passphrase - 1
      # `openssl rsa -in chloe_private.pem -check -noout -passin pass:stdin`
      # - Without passphrase - 2
      # `openssl rsa -in chloe_private.pem -check -noout`
      openssl_valid_cmd = "#{openssl_utility} rsa -in #{secret_key_path} -check -noout"
      openssl_valid_cmd.concat(" -passin pass:#{passphrase}") if passphrase
      exec_openssl_valid_cmd = inspec.command(openssl_valid_cmd)
      # require "byebug"; byebug
      exec_openssl_valid_cmd.exit_status.to_i == 0

    end

    def encrypted?
    end

    

    private

    # This resource requires openssl to be available on the system
    def check_openssl_or_error
      %w{/usr/sbin/openssl /usr/bin/openssl /sbin/openssl /bin/openssl openssl}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `openssl` on your system."
    end

    # def openssl_cmd
    #   "#{openssl_utility} rsa -in #{secret_key_path} -check -noout"
    # end
  end
end
