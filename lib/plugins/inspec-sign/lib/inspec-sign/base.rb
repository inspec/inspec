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

        path = File.join(Inspec.config_dir, "keys")
        FileUtils.mkdir_p(path)

        puts "Generating signing key in #{path}/#{options["keyname"]}.pem.key"
        open "#{path}/#{options["keyname"]}.pem.key", "w" do |io|
          io.write key.to_pem
        end
        puts "Generating validation key in #{path}/#{options["keyname"]}.pem.pub"
        open "#{path}/#{options["keyname"]}.pem.pub", "w" do |io|
          io.write key.public_key.to_pem
        end
      end

      def self.profile_sign(profile_path, options)
        artifact = new

        # Writes the profile content id in the inspec.yml
        if options[:profile_content_id] && !options[:profile_content_id].strip.empty?
          artifact.write_profile_content_id(profile_path, options[:profile_content_id])
        end

        puts "Signing #{profile_path} with key #{options["keyname"]}"
        keypath = Inspec::IafFile.find_signing_key(options["keyname"])

        # Read name and version from metadata and use them to form the filename
        profile_md = artifact.read_profile_metadata(profile_path)

        # Behave same as archive filename for iaf filename
        slug = profile_md["name"].downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "_")
        filename = "#{slug}-#{profile_md["version"]}"
        artifact_filename = "#{filename}.#{SIGNED_PROFILE_SUFFIX}"

        # Generating tar.gz file using archive method of Inspec Cli
        Inspec::InspecCLI.new.archive(profile_path, "error")
        tarfile = "#{filename}.tar.gz"
        tar_content = IO.binread(tarfile)
        FileUtils.rm(tarfile)

        # Generate the signature
        signing_key = KEY_ALG.new File.read keypath
        sha = ARTIFACT_DIGEST.new
        signature = signing_key.sign sha, tar_content
        # convert the signature to Base64
        signature_base64 = Base64.encode64(signature)

        content = (format("%-100s", options[:keyname]) +
                  format("%-20s", ARTIFACT_DIGEST_NAME) +
                  format("%-370s", signature_base64)).gsub(" ", "\0").unpack("H*").pack("h*") + "#{tar_content}"

        File.open(artifact_filename, "wb") do |f|
          f.puts INSPEC_PROFILE_VERSION_2
          f.puts "Use \"inspec export\" to view this file"
          f.write(content)
        end
        puts "Successfully generated #{artifact_filename}"
      rescue Inspec::Exceptions::ProfileValidationKeyNotFound => e
        $stderr.puts e.message
        Inspec::UI.new.exit(:usage_error)
      end

      def self.profile_verify(signed_profile_path, silent = false)
        file_to_verify = signed_profile_path
        puts "Verifying #{file_to_verify}" unless silent

        iaf_file = Inspec::IafFile.new(file_to_verify)
        if iaf_file.valid?
          # Signed profile verification is called from runner and not from CLI
          # Do not exit and do not print logs
          return if silent

          puts "Detected format version '#{iaf_file.version}'"
          puts "Attempting to verify using key '#{iaf_file.key_name}'"
          puts "Profile is valid."
          Inspec::UI.new.exit(:normal)
        else
          puts "Detected format version '#{iaf_file.version}'"
          puts "Attempting to verify using key '#{iaf_file.key_name}'" if iaf_file.key_name
          puts "Profile is invalid"
          Inspec::UI.new.exit(:bad_signature)
        end
      rescue Inspec::Exceptions::ProfileValidationKeyNotFound => e
        $stderr.puts e.message
        Inspec::UI.new.exit(:usage_error)
      end

      def read_profile_metadata(profile_path)
        begin
          p = Pathname.new(profile_path)
          p = p.join("inspec.yml")
          unless p.exist?
            raise "#{profile_path} doesn't appear to be a valid #{PRODUCT_NAME} profile"
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
          $stderr.puts "Error reading profile metadata file #{e.message}"
          Inspec::UI.new.exit(:usage_error)
        end

        yaml
      end

      def write_profile_content_id(profile_path, profile_content_id)
        p = Pathname.new(profile_path)
        p = p.join("inspec.yml")
        yaml = YAML.load_file(p.to_s)
        existing_profile_content_id = yaml["profile_content_id"]

        unless existing_profile_content_id.nil?
          ui = Inspec::UI.new
          ui.error("Cannot use --profile-content-id when profile_content_id already exists in metadata file.")
          ui.exit(:usage_error)
        end

        lines = IO.readlines(p)
        lines << "\nprofile_content_id: #{profile_content_id}\n"

        File.open("#{p}", "w" ) do |f|
          f.puts lines
        end
      end
    end
  end
end
