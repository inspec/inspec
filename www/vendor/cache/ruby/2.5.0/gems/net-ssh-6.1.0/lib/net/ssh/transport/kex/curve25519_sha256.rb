gem 'x25519' # raise if the gem x25519 is not installed

require 'x25519'
require 'net/ssh/transport/constants'
require 'net/ssh/transport/kex/abstract5656'

module Net
  module SSH
    module Transport
      module Kex
        # A key-exchange service implementing the "curve25519-sha256@libssh.org"
        # key-exchange algorithm. (defined in https://tools.ietf.org/html/draft-ietf-curdle-ssh-curves-06)
        class Curve25519Sha256 < Abstract5656
          def digester
            OpenSSL::Digest::SHA256
          end

          private

          def generate_key #:nodoc:
            ::X25519::Scalar.generate
          end

          ## string   Q_C, client's ephemeral public key octet string
          def ecdh_public_key_bytes
            ecdh.public_key.to_bytes
          end

          # compute shared secret from server's public key and client's private key
          def compute_shared_secret(server_ecdh_pubkey)
            pk = ::X25519::MontgomeryU.new(server_ecdh_pubkey)
            OpenSSL::BN.new(ecdh.diffie_hellman(pk).to_bytes, 2)
          end
        end
      end
    end
  end
end
