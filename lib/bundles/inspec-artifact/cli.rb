# encoding: utf-8
# frozen_string_literal: true
require 'base64'
require 'openssl'
require 'pathname'
require 'set'
require 'tempfile'
require 'yaml'

# Notes:
#
# Generate keys
#   The initial implementation uses 2048 bit RSA key pairs (public + private).
#   Public keys must be available for a customer to install and verify an artifact.
#   Private keys should be stored in a secure location and NOT be distributed.
#     (They're only for creating artifacts).
#
#
# .IAF file format
#   .iaf = "Inspec Artifact File", easy to rename if you'd like something more appropriate.
#   The iaf file wraps a binary artifact with some metadata. The first implementation
#   looks like this:
#
# INSPEC-PROFILE-1
# name_of_signing_key
# algorithm
# signature
# <empty line>
# binary-blob
# <eof>
#
# Let's look at each line:
# INSPEC-PROFILE-1:
#   This is the artifact version descriptor. It should't change unless the
#   format of the archive changes.
#
# name_of_signing_key
#   The name of the public key that can be used to verify an artifact
#
# algorithm
#   The digest used to sign, I picked SHA512 to start with.
#   If we support multiple digests, we'll need to have the verify() method
#   support each digest.
#
# signature
#   The result of passing the binary artifact through the digest algorithm above.
#   Result is base64 encoded.
#
# <empty line>
#   We use an empty line to separate artifact header from artifact body (binary blob).
#   The artifact body can be anything you like.
#
# binary-blob
#   A binary blob, most likely a .tar.gz or tar.xz file. We'll need to pick one and
#   stick with it as part of the "INSPEC-PROFILE-1" artifact version. If we change block
#   format, the artifact version descriptor must be incremented, and the sign()
#   and verify() methods must be updated to support a newer version.
#
#
# Key revocation
#   This implementation doesn't support key revocation. However, a customer
#   can remove the public cert file before installation, and artifacts will then
#   fail verification.
#
# Key locations
#   This implementation uses the current working directory to find public and
#   private keys. We should establish a common key directory (similar to /hab/cache/keys
#   or ~/.hab/cache/keys in Habitat).
#
# Extracting artifacts outside of Inspec
#   As in Habitat, the artifact format for Inspec allows the use of common
#   Unix tools to read the header and body of an artifact.
# To extract the header from a .iaf:
#        sed '/^$/q' foo.iaf
# To extract the raw content from a .iaf:
#        sed '1,/^$/d' foo.iaf

module Artifact
  KEY_BITS=2048
  KEY_ALG=OpenSSL::PKey::RSA

  INSPEC_PROFILE_VERSION_1='INSPEC-PROFILE-1'.freeze
  INSPEC_REPORT_VERSION_1='INSPEC-REPORT-1'.freeze

  ARTIFACT_DIGEST=OpenSSL::Digest::SHA512
  ARTIFACT_DIGEST_NAME='SHA512'.freeze

  VALID_PROFILE_VERSIONS=Set.new [INSPEC_PROFILE_VERSION_1]
  VALID_PROFILE_DIGESTS=Set.new [ARTIFACT_DIGEST_NAME]

  SIGNED_PROFILE_SUFFIX='iaf'.freeze
  SIGNED_REPORT_SUFFIX='iar'.freeze

  # rubocop:disable Metrics/ClassLength
  class CLI < Inspec::BaseCLI
    namespace 'artifact'

    # TODO: find another solution, once https://github.com/erikhuda/thor/issues/261 is fixed
    def self.banner(command, _namespace = nil, _subcommand = false)
      "#{basename} #{subcommand_prefix} #{command.usage}"
    end

    def self.subcommand_prefix
      namespace
    end

    desc 'generate', 'Generate a RSA key pair for signing and verification'
    option :keyname, type: :string, required: true,
      desc: 'Desriptive name of key'
    option :keydir, type: :string, default: './',
      desc: 'Directory to search for keys'
    def generate_keys
      puts 'Generating keys'
      keygen
    end

    desc 'sign-profile', 'Create a signed .iaf artifact'
    option :profile, type: :string, required: true,
      desc: 'Path to profile directory'
    option :keyname, type: :string, required: true,
      desc: 'Desriptive name of key'
    def sign_profile
      profile_sign
    end

    desc 'verify-profile', 'Verify a signed .iaf artifact'
    option :infile, type: :string, required: true,
        desc: '.iaf file to verify'
    def verify_profile
      profile_verify
    end

    desc 'install-profile', 'Verify and install a signed .iaf artifact'
    option :infile, type: :string, required: true,
        desc: '.iaf file to install'
    option :destdir, type: :string, required: true,
      desc: 'Installation directory'
    def install_profile
      profile_install
    end

    private

    def keygen
      key = KEY_ALG.new KEY_BITS
      puts 'Generating private key'
      open "#{options['keyname']}.pem.key", 'w' do |io| io.write key.to_pem end
      puts 'Generating public key'
      open "#{options['keyname']}.pem.pub", 'w' do |io| io.write key.public_key.to_pem end
    end

    def read_profile_metadata(path_to_profile)
      begin
        p = Pathname.new(path_to_profile)
        p = p.join('inspec.yml')
        if not p.exist?
          raise "#{path_to_profile} doesn't appear to be a valid Inspec profile"
        end
        yaml = YAML.load_file(p.to_s)
        yaml = yaml.to_hash

        if not yaml.key? 'name'
          raise 'Profile is invalid, name is not defined'
        end

        if not yaml.key? 'version'
          raise 'Profile is invalid, version is not defined'
        end
      rescue => e
        # rewrap it and pass it up to the CLI
        raise "Error reading Inspec profile metadata: #{e}"
      end

      yaml
    end

    def profile_compress(path_to_profile, profile_md, workdir)
      profile_name = profile_md['name']
      profile_version = profile_md['version']
      outfile_name = "#{workdir}/#{profile_name}-#{profile_version}.tar.gz"
      `tar czf #{outfile_name} -C #{path_to_profile} .`
      outfile_name
    end

    def profile_sign
      Dir.mktmpdir do |workdir|
        puts "Signing #{options['profile']} with key #{options['keyname']}"
        path_to_profile = options['profile']
        profile_md = read_profile_metadata(path_to_profile)
        artifact_filename = "#{profile_md['name']}-#{profile_md['version']}.#{SIGNED_PROFILE_SUFFIX}"
        tarfile = profile_compress(path_to_profile, profile_md, workdir)
        content = IO.binread(tarfile)
        signing_key = KEY_ALG.new File.read "#{options['keyname']}.pem.key"
        sha = ARTIFACT_DIGEST.new
        signature = signing_key.sign sha, content
        # convert the signature to Base64
        signature_base64 = Base64.encode64(signature)
        tar_content = IO.binread(tarfile)
        File.open(artifact_filename, 'wb') do |f|
          f.puts(INSPEC_PROFILE_VERSION_1)
          f.puts(options['keyname'])
          f.puts(ARTIFACT_DIGEST_NAME)
          f.puts(signature_base64)
          f.puts('') # newline separates artifact header with body
          f.write(tar_content)
        end
        puts "Successfully generated #{artifact_filename}"
      end
    end

    def valid_header?(file_alg, file_version, file_keyname)
      public_keyfile = "#{file_keyname}.pem.pub"
      puts "Looking for #{public_keyfile} to verify artifact"
      if not File.exist? public_keyfile
        raise "Can't find #{public_keyfile}"
      end

      if not VALID_PROFILE_DIGESTS.member? file_alg
        raise 'Invalid artifact digest algorithm detected'
      end

      if not VALID_PROFILE_VERSIONS.member? file_version
        raise 'Invalid artifact version detected'
      end
    end

    def verify(file_to_verifiy, &content_block)
      f = File.open(file_to_verifiy, 'r')
      file_version = f.readline.strip!
      file_keyname = f.readline.strip!
      file_alg = f.readline.strip!

      file_sig = ''
      # the signature is multi-line
      while (line = f.readline) != "\n"
        file_sig += line
      end
      file_sig.strip!
      f.close

      valid_header?(file_alg, file_version, file_keyname)

      public_keyfile = "#{file_keyname}.pem.pub"
      verification_key = KEY_ALG.new File.read public_keyfile

      f = File.open(file_to_verifiy, 'r')
      while f.readline != "\n" do end
      content = f.read

      signature = Base64.decode64(file_sig)
      digest = ARTIFACT_DIGEST.new
      if verification_key.verify digest, signature, content
        content_block.yield(content)
      else
        puts 'Artifact is invalid'
      end
    end

    def profile_verify
      file_to_verifiy = options['infile']
      puts "Verifying #{file_to_verifiy}"
      verify(file_to_verifiy) do ||
        puts 'Artifact is valid'
      end
    end

    def profile_install
      puts 'Installing profile'
      file_to_verifiy = options['infile']
      dest_dir = options['destdir']
      verify(file_to_verifiy) do |content|
        Dir.mktmpdir do |workdir|
          tmpfile = Pathname.new(workdir).join('artifact_to_install.tar.gz')
          File.write(tmpfile, content)
          puts "Installing to #{dest_dir}"
          `tar xzf #{tmpfile} -C #{dest_dir}`
        end
      end
    end
  end

  # register the subcommand to Inspec CLI registry
  Inspec::Plugins::CLI.add_subcommand(Artifact::CLI, 'artifact', 'artifact SUBCOMMAND ...', 'Sign, verify and install artifacts', {})
end
