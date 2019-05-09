
require 'openssl'
require 'hashie/mash'
require 'inspec/utils/file_reader'
require 'inspec/utils/pkey_reader'

module Inspec::Resources
  class RsaKey < Inspec.resource(1)
    name 'key_rsa'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'public/private RSA key pair test'
    example <<~EXAMPLE
      describe key_rsa('/etc/pki/www.mywebsite.com.key') do
        its('public_key') { should match /BEGIN RSA PUBLIC KEY/ }
      end

      describe key_rsa('/etc/pki/www.mywebsite.com.key', 'passphrase') do
        it { should be_private }
        it { should be_public }
      end
    EXAMPLE

    include FileReader
    include PkeyReader

    def initialize(keypath, passphrase = nil)
      @key_path = keypath
      @passphrase = passphrase
      @key = read_pkey(read_file_content(@key_path, allow_empty: true), @passphrase)
    end

    def public?
      return if @key.nil?
      @key.public?
    end

    def public_key
      return if @key.nil?
      @key.public_key.to_s
    end

    def private?
      return if @key.nil?
      @key.private?
    end

    def private_key
      return if @key.nil?
      @key.to_s
    end

    def key_length
      return if @key.nil?
      @key.public_key.n.num_bytes * 8
    end

    def to_s
      "rsa_key #{@key_path}"
    end
  end
end
