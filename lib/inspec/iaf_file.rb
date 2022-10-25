require "base64" unless defined?(Base64)
require "openssl" unless defined?(OpenSSL)
require "set" unless defined?(Set)
require "uri" unless defined?(URI)

module Inspec
  class IafFile
    KEY_ALG = OpenSSL::PKey::RSA
    INSPEC_PROFILE_VERSION_1 = "INSPEC-PROFILE-1".freeze
    INSPEC_PROFILE_VERSION_2 = "INSPEC-PROFILE-2".freeze

    ARTIFACT_DIGEST = OpenSSL::Digest::SHA512
    ARTIFACT_DIGEST_NAME = "SHA512".freeze

    VALID_PROFILE_VERSIONS = Set.new [INSPEC_PROFILE_VERSION_1, INSPEC_PROFILE_VERSION_2]
    VALID_PROFILE_DIGESTS = Set.new [ARTIFACT_DIGEST_NAME]

    def self.find_validation_key(keyname)
      [
        ".",
        File.join(Inspec.config_dir, "keys"),
        File.join(Inspec.src_root, "etc", "keys"),
      ].each do |path|
        filename = File.join(path, "#{keyname}.pem.pub")
        return filename if File.exist?(filename)
      rescue ArgumentError => e
        puts e
        raise Inspec::Exceptions::ProfileValidationKeyNotFound.new("Validation key #{keyname} not found")
      end

      # Retry if we can fetch it from github
      return find_validation_key(keyname) if fetch_validation_key_from_github(keyname)

      raise Inspec::Exceptions::ProfileValidationKeyNotFound.new("Validation key #{keyname} not found")
    end

    def self.find_signing_key(keyname)
      [".", File.join(Inspec.config_dir, "keys")].each do |path|
        filename = File.join(path, "#{keyname}.pem.key")
        return filename if File.exist?(filename)
      end
      raise Inspec::Exceptions::ProfileSigningKeyNotFound.new("Signing key #{keyname} not found")
    end

    def self.fetch_validation_key_from_github(keyname)
      URI.open("https://raw.githubusercontent.com/inspec/inspec/main/etc/keys/#{keyname}.pem.pub") do |r|
        puts "Fetching validation key '#{keyname}' from github"
        dir = File.join(Inspec.config_dir, "keys")
        FileUtils.mkdir_p dir
        key_file = File.join(dir, "#{keyname}.pem.pub")
        File.open(key_file, "w") do |f|
          r.each_line do |line|
            f.puts line
          end
        end
      end
      true
    rescue OpenURI::HTTPError
      false
    end

    attr_reader :key_name, :version

    def initialize(path)
      @path = path
      @key_name = nil
    end

    def valid?
      header = []
      valid = true
      f = File.open(@path, "rb")
      @version = f.readline.strip!
      if version == INSPEC_PROFILE_VERSION_1
        header << version
        header << f.readline.strip!
        header << f.readline.strip!

        file_sig = ""
        # the signature is multi-line
        while (line = f.readline) != "\n"
          file_sig += line
        end
        header << file_sig.strip!
        f.close

        f = File.open(@path, "rb")
        while f.readline != "\n" do end
        content = f.read
        f.close
      elsif version == INSPEC_PROFILE_VERSION_2
        header << version
        header << f.readline.strip!
        content = f.read
        f.close

        header_content = content.unpack("h*").pack("H*")
        header << header_content.slice(0, 100).rstrip
        header << header_content.slice(100, 20).rstrip
        header << header_content.slice(120, 370).rstrip + "\n" # \n at the end is require in this field
        content = content.slice(490, content.length).lstrip
      else
        valid = false
      end

      @key_name = header[2]
      validation_key_path = Inspec::IafFile.find_validation_key(@key_name)

      unless valid_header?(header)
        valid = false
      end

      verification_key = KEY_ALG.new File.read validation_key_path
      signature = Base64.decode64(header[4])
      digest = ARTIFACT_DIGEST.new
      unless verification_key.verify digest, signature, content
        valid = false
      end

      valid
    end

    def valid_header?(header)
      VALID_PROFILE_VERSIONS.member?(header[0]) && VALID_PROFILE_DIGESTS.member?(header[3])
    end
  end
end
