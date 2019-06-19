require_relative "base"
require "inspec/dist"

#
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
#   .iaf = "InSpec Artifact File", easy to rename if you'd like something more appropriate.
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
# Extracting artifacts outside of InSpec
#   As in Habitat, the artifact format for InSpec allows the use of common
#   Unix tools to read the header and body of an artifact.
# To extract the header from a .iaf:
#        sed '/^$/q' foo.iaf
# To extract the raw content from a .iaf:
#        sed '1,/^$/d' foo.iaf

module InspecPlugins
  module Artifact
    class CLI < Inspec.plugin(2, :cli_command)
      include Inspec::Dist

      subcommand_desc "artifact SUBCOMMAND", "Manage #{PRODUCT_NAME} Artifacts"

      desc "generate", "Generate a RSA key pair for signing and verification"
      option :keyname, type: :string, required: true,
        desc: "Desriptive name of key"
      option :keydir, type: :string, default: "./",
        desc: "Directory to search for keys"
      def generate_keys
        puts "Generating keys"
        InspecPlugins::Artifact::Base.keygen(options)
      end

      desc "sign-profile", "Create a signed .iaf artifact"
      option :profile, type: :string, required: true,
        desc: "Path to profile directory"
      option :keyname, type: :string, required: true,
        desc: "Desriptive name of key"
      def sign_profile
        InspecPlugins::Artifact::Base.profile_sign(options)
      end

      desc "verify-profile", "Verify a signed .iaf artifact"
      option :infile, type: :string, required: true,
          desc: ".iaf file to verify"
      def verify_profile
        InspecPlugins::Artifact::Base.profile_verify(options)
      end

      desc "install-profile", "Verify and install a signed .iaf artifact"
      option :infile, type: :string, required: true,
          desc: ".iaf file to install"
      option :destdir, type: :string, required: true,
        desc: "Installation directory"
      def install_profile
        InspecPlugins::Artifact::Base.profile_install(options)
      end
    end
  end
end
