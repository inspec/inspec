require "base64"
require "openssl"
require "pathname"
require "set"
require "tempfile"
require "yaml"
require "inspec/dist"

module InspecPlugins
  module Artifact
    class Base
      include Inspec::Dist

      KEY_BITS = 2048
      KEY_ALG = OpenSSL::PKey::RSA

      INSPEC_PROFILE_VERSION_1 = "INSPEC-PROFILE-1".freeze
      INSPEC_REPORT_VERSION_1 = "INSPEC-REPORT-1".freeze

      ARTIFACT_DIGEST = OpenSSL::Digest::SHA512
      ARTIFACT_DIGEST_NAME = "SHA512".freeze

      VALID_PROFILE_VERSIONS = Set.new [INSPEC_PROFILE_VERSION_1]
      VALID_PROFILE_DIGESTS = Set.new [ARTIFACT_DIGEST_NAME]

      SIGNED_PROFILE_SUFFIX = "iaf".freeze
      SIGNED_REPORT_SUFFIX = "iar".freeze

      def self.keygen(options)
        key = KEY_ALG.new KEY_BITS
        puts "Generating private key"
        open "#{options["keyname"]}.pem.key", "w" do |io|
          io.write key.to_pem
        end
        puts "Generating public key"
        open "#{options["keyname"]}.pem.pub", "w" do |io|
          io.write key.public_key.to_pem
        end
      end

      def self.profile_sign(options)
        artifact = new
        Dir.mktmpdir do |workdir|
          puts "Signing #{options["profile"]} with key #{options["keyname"]}"
          path_to_profile = options["profile"]
          profile_md = artifact.read_profile_metadata(path_to_profile)
          artifact_filename = "#{profile_md["name"]}-#{profile_md["version"]}.#{SIGNED_PROFILE_SUFFIX}"
          tarfile = artifact.profile_compress(path_to_profile, profile_md, workdir)
          content = IO.binread(tarfile)
          signing_key = KEY_ALG.new File.read "#{options["keyname"]}.pem.key"
          sha = ARTIFACT_DIGEST.new
          signature = signing_key.sign sha, content
          # convert the signature to Base64
          signature_base64 = Base64.encode64(signature)
          tar_content = IO.binread(tarfile)
          File.open(artifact_filename, "wb") do |f|
            f.puts(INSPEC_PROFILE_VERSION_1)
            f.puts(options["keyname"])
            f.puts(ARTIFACT_DIGEST_NAME)
            f.puts(signature_base64)
            f.puts("") # newline separates artifact header with body
            f.write(tar_content)
          end
          puts "Successfully generated #{artifact_filename}"
        end
      end

      def self.profile_verify(options)
        artifact = new
        file_to_verifiy = options["infile"]
        puts "Verifying #{file_to_verifiy}"
        artifact.verify(file_to_verifiy) do ||
          puts "Artifact is valid"
        end
      end

      def self.profile_install(options)
        artifact = new
        puts "Installing profile"
        file_to_verifiy = options["infile"]
        dest_dir = options["destdir"]
        artifact.verify(file_to_verifiy) do |content|
          Dir.mktmpdir do |workdir|
            tmpfile = Pathname.new(workdir).join("artifact_to_install.tar.gz")
            File.write(tmpfile, content)
            puts "Installing to #{dest_dir}"
            `tar xzf #{tmpfile} -C #{dest_dir}`
          end
        end
      end

      def read_profile_metadata(path_to_profile)
        begin
          p = Pathname.new(path_to_profile)
          p = p.join("inspec.yml")
          unless p.exist?
            raise "#{path_to_profile} doesn't appear to be a valid #{PRODUCT_NAME} profile"
          end

          yaml = YAML.load_file(p.to_s)
          yaml = yaml.to_hash

          unless yaml.key? "name"
            raise "Profile is invalid, name is not defined"
          end

          unless yaml.key? "version"
            raise "Profile is invalid, version is not defined"
          end
        rescue => e
          # rewrap it and pass it up to the CLI
          raise "Error reading #{PRODUCT_NAME} profile metadata: #{e}"
        end

        yaml
      end

      def profile_compress(path_to_profile, profile_md, workdir)
        profile_name = profile_md["name"]
        profile_version = profile_md["version"]
        outfile_name = "#{workdir}/#{profile_name}-#{profile_version}.tar.gz"
        `tar czf #{outfile_name} -C #{path_to_profile} .`
        outfile_name
      end

      def valid_header?(file_alg, file_version, file_keyname)
        public_keyfile = "#{file_keyname}.pem.pub"
        puts "Looking for #{public_keyfile} to verify artifact"
        unless File.exist? public_keyfile
          raise "Can't find #{public_keyfile}"
        end

        raise "Invalid artifact digest algorithm detected" unless VALID_PROFILE_DIGESTS.member?(file_alg)
        raise "Invalid artifact version detected" unless VALID_PROFILE_VERSIONS.member?(file_version)
      end

      def verify(file_to_verifiy, &content_block)
        f = File.open(file_to_verifiy, "r")
        file_version = f.readline.strip!
        file_keyname = f.readline.strip!
        file_alg = f.readline.strip!

        file_sig = ""
        # the signature is multi-line
        while (line = f.readline) != "\n"
          file_sig += line
        end
        file_sig.strip!
        f.close

        valid_header?(file_alg, file_version, file_keyname)

        public_keyfile = "#{file_keyname}.pem.pub"
        verification_key = KEY_ALG.new File.read public_keyfile

        f = File.open(file_to_verifiy, "r")
        while f.readline != "\n" do end
        content = f.read

        signature = Base64.decode64(file_sig)
        digest = ARTIFACT_DIGEST.new
        if verification_key.verify digest, signature, content
          content_block.yield(content)
        else
          puts "Artifact is invalid"
        end
      end
    end
  end
end
