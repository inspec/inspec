require "base64" unless defined?(Base64)
require "openssl" unless defined?(OpenSSL)

# TODO: Refactor this once the binary format work gets merged.
module Inspec
  class VerifySignature
    def self.valid(path)
      # Validates the file using key authentication. Currently it look for the key file in the current working directory.

      f = File.open(path, "rb")
      version = f.readline.strip!
      header = []
      header << version

      if version == "INSPEC-PROFILE-1"
        header <<  f.readline.strip!
        header <<  f.readline.strip!

        file_sig = ""
        # the signature is multi-line
        while (line = f.readline) != "\n"
          file_sig += line
        end
        header << file_sig.strip!
        f.close

        f = File.open(path, "rb")
        while f.readline != "\n" do end
        content = f.read
        f.close
      elsif version == "INSPEC-PROFILE-2"
        header <<  f.readline.strip!
        content = f.read
        f.close

        header.concat(content[0..356].unpack("h*").pack("H*").split("."))
        content = content[358..content.length]
      else
        raise "Invalid artifact version detected."
      end

      unless %w{INSPEC-PROFILE-1 INSPEC-PROFILE-2}.member?(header[0]) && ["SHA512"].member?(header[2])
        raise "Artifact is invalid"
      end

      if File.exist? "#{header[1]}.pem.pub"
        verification_key = OpenSSL::PKey::RSA.new File.read "#{header[1]}.pem.pub"
      else
        raise "Can't find #{header[1]}.pem.pub}"
      end

      signature = Base64.decode64(header[3])
      digest = OpenSSL::Digest.new("SHA512")

      if verification_key.verify(digest, signature, content)
        true
      else
        raise "Artifact is invalid"
      end
    end
  end
end
