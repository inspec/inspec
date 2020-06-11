require 'openssl'
require 'net/ssh/transport/ctr.rb'
require 'net/ssh/transport/key_expander'
require 'net/ssh/transport/identity_cipher'

module Net 
  module SSH 
    module Transport

      # Implements a factory of OpenSSL cipher algorithms.
      class CipherFactory
        # Maps the SSH name of a cipher to it's corresponding OpenSSL name
        SSH_TO_OSSL = {
          "3des-cbc"                    => "des-ede3-cbc",
          "blowfish-cbc"                => "bf-cbc",
          "aes256-cbc"                  => "aes-256-cbc",
          "aes192-cbc"                  => "aes-192-cbc",
          "aes128-cbc"                  => "aes-128-cbc",
          "idea-cbc"                    => "idea-cbc",
          "cast128-cbc"                 => "cast-cbc",
          "rijndael-cbc@lysator.liu.se" => "aes-256-cbc",
          "3des-ctr"                    => "des-ede3",
          "blowfish-ctr"                => "bf-ecb",

          'aes256-ctr'                  => 'aes-256-ctr',
          'aes192-ctr'                  => 'aes-192-ctr',
          'aes128-ctr'                  => 'aes-128-ctr',
          'cast128-ctr'                 => 'cast5-ecb',

          'none'                        => 'none'
        }

        # Returns true if the underlying OpenSSL library supports the given cipher,
        # and false otherwise.
        def self.supported?(name)
          ossl_name = SSH_TO_OSSL[name] or raise NotImplementedError, "unimplemented cipher `#{name}'"
          return true if ossl_name == "none"
          return OpenSSL::Cipher.ciphers.include?(ossl_name)
        end
    
        # Retrieves a new instance of the named algorithm. The new instance
        # will be initialized using an iv and key generated from the given
        # iv, key, shared, hash and digester values. Additionally, the
        # cipher will be put into encryption or decryption mode, based on the
        # value of the +encrypt+ parameter.
        def self.get(name, options={})
          ossl_name = SSH_TO_OSSL[name] or raise NotImplementedError, "unimplemented cipher `#{name}'"
          return IdentityCipher if ossl_name == "none"
          cipher = OpenSSL::Cipher.new(ossl_name)
    
          cipher.send(options[:encrypt] ? :encrypt : :decrypt)
    
          cipher.padding = 0
    
          if name =~ /-ctr(@openssh.org)?$/
            if ossl_name !~ /-ctr/
              cipher.extend(Net::SSH::Transport::CTR)
            else
              cipher = Net::SSH::Transport::OpenSSLAESCTR.new(cipher)
            end
          end
          cipher.iv = Net::SSH::Transport::KeyExpander.expand_key(cipher.iv_len, options[:iv], options)
    
          key_len = cipher.key_len
          cipher.key_len = key_len
          cipher.key = Net::SSH::Transport::KeyExpander.expand_key(key_len, options[:key], options)
    
          return cipher
        end
    
        # Returns a two-element array containing the [ key-length,
        # block-size ] for the named cipher algorithm. If the cipher
        # algorithm is unknown, or is "none", 0 is returned for both elements
        # of the tuple.
        # if :iv_len option is supplied the third return value will be ivlen
        def self.get_lengths(name, options = {})
          ossl_name = SSH_TO_OSSL[name]
          if ossl_name.nil? || ossl_name == "none"
            result = [0, 0]
            result << 0 if options[:iv_len]
          else
            cipher = OpenSSL::Cipher.new(ossl_name)
            key_len = cipher.key_len
            cipher.key_len = key_len
    
            block_size =
              case ossl_name
              when /\-ctr/
                Net::SSH::Transport::OpenSSLAESCTR.block_size
              else
                cipher.block_size
              end
    
            result = [key_len, block_size]
            result << cipher.iv_len if options[:iv_len]
          end
          result
        end
      end

    end
  end
end
