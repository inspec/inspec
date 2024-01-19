require "inspec/utils/file_reader"
require "net/ssh" unless defined?(Net::SSH)

# Change module if required
module Inspec::Resources
  class SshKey < FileResource
    # Every resource requires an internal name.
    name "ssh_key"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "public/private SSH key pair test"

    example <<~EXAMPLE
      describe ssh_key('path: ~/.ssh/id_rsa') do
        its('key_length') { should eq 4096 }
        its('type') { should cmp /rsa/ }
        it { should be_private }
      end
    EXAMPLE

    include FileReader

    def initialize(keypath, passphrase = nil)
      skip_resource "The `ssh_key` resource is not yet available on your OS." unless inspec.os.unix? || inspec.os.windows?
      @key_path = set_ssh_key_path(keypath)
      @passphrase = passphrase
      @key = read_ssh_key
      super(@key_path)
    end

    def public?
      return if @key.nil?

      @key[:public]
    end

    def private?
      return if @key.nil?

      @key[:private]
    end

    def key_length
      return if @key.nil?

      @key[:key_length]
    end

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

    def set_ssh_key_path(keypath)
      if File.exist?(keypath)
        @key_path = keypath
      elsif File.exist?(File.join("#{Dir.home}/.ssh/", keypath))
        @key_path = File.join("#{Dir.home}/.ssh/", keypath)
      else
        raise Inspec::Exceptions::ResourceSkipped, "Can't find file: #{keypath}"
      end
    end

    def read_ssh_key
      key_data = {}
      key = nil
      filecontent = read_file_content((@key_path), @passphrase)
      raise Inspec::Exceptions::ResourceSkipped, "File is empty: #{@key_path}" if filecontent.split("\n").empty?

      if filecontent.split("\n")[0].include?("PRIVATE")
        # Net::SSH::KeyFactory does not have support to load private key for DSA
        key = Net::SSH::KeyFactory.load_private_key(@key_path, @passphrase, false)
        unless key.nil?
          key_data[:private] = true
          key_data[:public] = false
          # The data send for ssh type is not in same format so it's good to match on the string
          key_data[:type] = key.ssh_type
          key_data[:key_length] = key_lengh(key)
        end
      else
        key = Net::SSH::KeyFactory.load_public_key(@key_path)
        unless key.nil?
          key_data[:private] = false
          key_data[:public] = true
          # The data send for ssh type is not in same format so it's good to match on the string
          key_data[:type] = key.ssh_type
          key_data[:key_length] = key_lengh(key)
        end
      end

      key_data
    rescue OpenSSL::PKey::PKeyError => e
      raise Inspec::Exceptions::ResourceFailed, "#{e.message}"
    end

    def key_lengh(key)
      if key.class.to_s == "OpenSSL::PKey::RSA"
        key.public_key.n.num_bits
      else
        # Unable to get the key lenght data for other types of keys
        # TODO: Need to check if there is any method that will get this info.
        nil
      end
    end
  end
end
