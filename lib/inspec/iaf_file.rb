require "base64" unless defined?(Base64)
require "openssl" unless defined?(OpenSSL)

module Inspec
  class IafFile
    KEY_ALG = OpenSSL::PKey::RSA
    INSPEC_PROFILE_VERSION_1 = "INSPEC-PROFILE-1".freeze
    INSPEC_PROFILE_VERSION_2 = "INSPEC-PROFILE-2".freeze

    ARTIFACT_DIGEST = OpenSSL::Digest::SHA512
    ARTIFACT_DIGEST_NAME = "SHA512".freeze

    VALID_PROFILE_VERSIONS = Set.new [INSPEC_PROFILE_VERSION_1, INSPEC_PROFILE_VERSION_2]
    VALID_PROFILE_DIGESTS = Set.new [ARTIFACT_DIGEST_NAME]

    def initialize(path)
      @path = path
    end

    def valid?
      header = []
      valid = true
      f = File.open(@path, "rb")
      version = f.readline.strip!
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

      unless File.exist?("#{header[1]}.pem.pub")
        raise Inspec::Exceptions::ProfileValidationKeyNotFound, "Profile validation key not found."
      end

      unless valid_header?(header)
        valid = false
      end

      verification_key = KEY_ALG.new File.read "#{header[1]}.pem.pub"
      signature = Base64.decode64(header[3])
      digest = ARTIFACT_DIGEST.new
      unless verification_key.verify digest, signature, content
        valid = false
      end

      valid
    end

    def valid_header?(header)
      VALID_PROFILE_VERSIONS.member?(header[0]) && VALID_PROFILE_DIGESTS.member?(header[2])
    end
  end
end