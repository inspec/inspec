require "base64" unless defined?(Base64)
require "openssl" unless defined?(OpenSSL)
require "pathname" unless defined?(Pathname)
require "set" unless defined?(Set)
require "tempfile" unless defined?(Tempfile)
require "yaml"
require "inspec/dist"
require "inspec/utils/json_profile_summary"
require "inspec/iaf_file"

module InspecPlugins
  module Sign
    class Base
      include Inspec::Dist

      KEY_BITS = 2048
      KEY_ALG = OpenSSL::PKey::RSA

      INSPEC_PROFILE_VERSION_1 = "INSPEC-PROFILE-1".freeze
      INSPEC_REPORT_VERSION_1 = "INSPEC-REPORT-1".freeze

      INSPEC_PROFILE_VERSION_2 = "INSPEC-PROFILE-2".freeze
      ARTIFACT_DIGEST = OpenSSL::Digest::SHA512
      ARTIFACT_DIGEST_NAME = "SHA512".freeze

      VALID_PROFILE_VERSIONS = Set.new [INSPEC_PROFILE_VERSION_1, INSPEC_PROFILE_VERSION_2]
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
        path_to_profile = options["profile"]

        # Write inspec.json file within artifact
        write_inspec_json(path_to_profile, options)

        Dir.mktmpdir do |workdir|
          puts "Signing #{options["profile"]} with key #{options["keyname"]}"
          profile_md = artifact.read_profile_metadata(path_to_profile)
          artifact_filename = "#{profile_md["name"]}-#{profile_md["version"]}.#{SIGNED_PROFILE_SUFFIX}"
          tarfile = artifact.profile_compress(path_to_profile, profile_md, workdir)
          content = IO.binread(tarfile)
          signing_key = KEY_ALG.new File.read "#{options["keyname"]}.pem.key"
          sha = ARTIFACT_DIGEST.new
          signature = signing_key.sign sha, content
          # convert the signature to Base64
          signature_base64 = Base64.encode64(signature)
          content = (format("%-100s", options[:keyname]) + format("%-20s", ARTIFACT_DIGEST_NAME) + format("%-370s", signature_base64)).gsub(" ", "\0").unpack("H*").pack("h*") + "#{content}"

          File.open(artifact_filename, "wb") do |f|
            f.puts INSPEC_PROFILE_VERSION_2
            f.write(content)
          end
          puts "Successfully generated #{artifact_filename}"
        end

        # Cleanup
        File.delete("#{path_to_profile}/inspec.json")
      end

      def self.profile_verify(options)
        file_to_verifiy = options["signed_profile"]
        puts "Verifying #{file_to_verifiy}"

        iaf_file = Inspec::IafFile.new(file_to_verifiy)
        if iaf_file.valid?
          puts "Profile is valid."
        else
          puts "Profile is invalid"
        end
      rescue Inspec::Exceptions::ProfileValidationKeyNotFound => e
        $stderr.puts e.message
        exit 1
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

      def self.write_inspec_json(root_path, opts)
        profile = Inspec::Profile.for_path(root_path, opts)
        Inspec::Utils::JsonProfileSummary.produce_json(
          info: profile.info,
          write_path: "#{root_path}/inspec.json",
          suppress_output: true
        )
      end
    end
  end
end
