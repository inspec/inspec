require 'net/ssh/transport/kex/abstract5656'

module Net
  module SSH
    module Transport
      module Kex
        # A key-exchange service implementing the "ecdh-sha2-nistp256"
        # key-exchange algorithm. (defined in RFC 5656)
        class EcdhSHA2NistP256 < Abstract5656
          def digester
            OpenSSL::Digest::SHA256
          end

          def curve_name
            OpenSSL::PKey::EC::CurveNameAlias['nistp256']
          end

          private

          def generate_key #:nodoc:
            OpenSSL::PKey::EC.new(curve_name).generate_key
          end

          # compute shared secret from server's public key and client's private key
          def compute_shared_secret(server_ecdh_pubkey)
            pk = OpenSSL::PKey::EC::Point.new(OpenSSL::PKey::EC.new(curve_name).group,
                                              OpenSSL::BN.new(server_ecdh_pubkey, 2))
            OpenSSL::BN.new(ecdh.dh_compute_key(pk), 2)
          end

          ## string   Q_C, client's ephemeral public key octet string
          def ecdh_public_key_bytes
            ecdh.public_key.to_bn.to_s(2)
          end
        end
      end
    end
  end
end
