# encoding: utf-8
# author: Richard Nixon

require 'openssl'
require 'hashie/mash'

module Inspec::Resources
  class RsaKey < Inspec.resource(1)
    name 'rsa_key'
    desc 'Used to test RSA keys'
    example "
      describe rsa_key('/etc/pki/www.mywebsite.com.key') do
        its('public_key') { should match /BEGIN RSA PUBLIC KEY/ }
      end
    "
    def initialize(keypath)
      @keypath = keypath
      @keyfile = inspec.backend.file(@keypath)
      if @keyfile.exist?
        load_key
      else
        @key = RuntimeError.new('Key file not found')
      end
    end

    private def load_key
      @keyraw ||= @keyfile.content
      @key ||= OpenSSL::PKey::RSA.new(@keyraw)
    rescue OpenSSL::X509::RSAError => error_code
      @key ||= error_code
    end

    def public_key
      @key.public_key.to_s
    end

    def private_key
      @key.to_s
    end

    def key_length
      n.num_bytes * 8 # Answer in bits
    end

    def exist?
      @keyfile.exist?
    end

    def key_length
      @key.public_key.n.num_bytes * 8
    end

    def to_s
      "rsa_key #{@keypath}"
    end
  end
end
