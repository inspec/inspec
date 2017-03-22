# encoding: utf-8
# author: Richard Nixon
# author: Christoph Hartmann

require 'openssl'
require 'hashie/mash'

module Inspec::Resources
  class RsaKey < Inspec.resource(1)
    name 'key_rsa'
    desc 'public/private RSA key pair test'
    example "
      describe rsa_key('/etc/pki/www.mywebsite.com.key') do
        its('public_key') { should match /BEGIN RSA PUBLIC KEY/ }
      end

      describe rsa_key('/etc/pki/www.mywebsite.com.key', 'passphrase') do
        it { should be_private }
        it { should be_public }
      end
    "

    def initialize(keypath, passphrase = nil)
      @key_path = keypath
      @key_file = inspec.file(@key_path)
      @key = nil
      @passphrase = passphrase

      return skip_resource "Unable to find key file #{@key_path}" unless @key_file.exist?

      begin
        @key = OpenSSL::PKey.read(@key_file.content, @passphrase)
      rescue OpenSSL::PKey::RSAError => _
        return skip_resource "Unable to load key file #{@key_path}"
      end
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
