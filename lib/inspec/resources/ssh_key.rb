require "openssl" unless defined?(OpenSSL)
require "inspec/utils/file_reader"
require "net/ssh"

# Change module if required
module Inspec::Resources
  class SshKey < Inspec.resource(1)
    # Every resource requires an internal name.
    name "ssh_key"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "public/private SSH key pair test"

    example <<~EXAMPLE
      describe ssh_key('~/.ssh/id_rsa') do
        its("shoe_size") { should cmp 10 }
      end
      describe "ssh_key" do
        it { should be_purple }
      end
    EXAMPLE

    include FileReader

    def initialize(keypath, passphrase = nil)
      skip_resource "The `ssh_key` resource is not yet available on your OS." unless inspec.os.unix? || inspec.os.windows?
      @key_path = keypath
      passphrase = passphrase
      @key = read_ssh_key(read_file_content(@key_path, allow_empty: true), passphrase)
    end

    # So this will be called as:
    #  describe "ssh_key" do
    #    it { should be_public }
    #  end
    def public?
      @key[:public]
    end

     # So this will be called as:
    #  describe "ssh_key" do
    #    it { should be_private }
    #  end
    def private?
      @key[:private]
    end

    # So this will be called as:
    #  describe "ssh_key" do
    #    its('key_length') { should eq 2048 }
    #  end
    def key_length
      return if @key.nil?

      @key[:key_length]
    end

    # So this will be called as:
    #  describe "ssh_key" do
    #    its('type') { should_be "RSA" }
    #  end
    def type
      return if @key.nil?

      @key[:type]
    end

    # Define a resource ID. This is used in reporting engines to uniquely identify the individual resource.
    # This might be a file path, or a process ID, or a cloud instance ID. Only meaningful to the implementation.
    # Must be a string. Defaults to the empty string if not implemented.
    def resource_id
      @key_path || "SSH key"
    end

    def to_s
      "ssh_key #{@key_path}"
    end

    private

    def read_ssh_key(filecontent, passphrase)
      key_data = {}
      key = nil
      if filecontent.split("\n")[0].include?("PRIVATE")
        key =  Net::SSH::KeyFactory.load_private_key(@key_path, passphrase, false)
        unless key.nil?
          key_data[:private] = true
          key_data[:public] = true
        end
      else
        key = Net::SSH::KeyFactory.load_public_key(@key_path)
        unless key.nil?
          key_data[:public] = true
          key_data[:private] = false
        end
      end

      unless key.nil?
        key_data[:type] = key.ssh_type.split("-")[1]
        key_data[:key_length] = key.public_key.n.num_bits unless key_data[:type] == "ed25519" || key_data[:type] == "dss"
      end

      key_data
    rescue OpenSSL::PKey::PKeyError
      raise Inspec::Exceptions::ResourceFailed, "passphrase error"
    end
  end
end
