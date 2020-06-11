require 'net/ssh/transport/kex/abstract'

module Net
  module SSH
    module Transport
      module Kex
        # Implement key-exchange algorithm from Elliptic Curve Algorithm Integration
        # in the Secure Shell Transport Layer (RFC 5656)
        class Abstract5656 < Abstract
          alias ecdh dh

          def curve_name
            raise NotImplementedError, 'abstract class: curve_name not implemented'
          end

          private

          def get_message_types
            [KEXECDH_INIT, KEXECDH_REPLY]
          end

          def build_signature_buffer(result)
            response = Net::SSH::Buffer.new
            response.write_string data[:client_version_string],
                                  data[:server_version_string],
                                  data[:client_algorithm_packet],
                                  data[:server_algorithm_packet],
                                  result[:key_blob],
                                  ecdh_public_key_bytes,
                                  result[:server_ecdh_pubkey]
            response.write_bignum result[:shared_secret]
            response
          end

          def send_kexinit #:nodoc:
            init, reply = get_message_types

            # send the KEXECDH_INIT message
            ## byte     SSH_MSG_KEX_ECDH_INIT
            ## string   Q_C, client's ephemeral public key octet string
            buffer = Net::SSH::Buffer.from(:byte, init, :mstring, ecdh_public_key_bytes)
            connection.send_message(buffer)

            # expect the following KEXECDH_REPLY message
            ## byte     SSH_MSG_KEX_ECDH_REPLY
            ## string   K_S, server's public host key
            ## string   Q_S, server's ephemeral public key octet string
            ## string   the signature on the exchange hash
            buffer = connection.next_message
            raise Net::SSH::Exception, 'expected REPLY' unless buffer.type == reply

            result = {}
            result[:key_blob] = buffer.read_string
            result[:server_key] = Net::SSH::Buffer.new(result[:key_blob]).read_key
            result[:server_ecdh_pubkey] = buffer.read_string
            result[:shared_secret] = compute_shared_secret(result[:server_ecdh_pubkey])

            sig_buffer = Net::SSH::Buffer.new(buffer.read_string)
            sig_type = sig_buffer.read_string
            if sig_type != algorithms.host_key_format
              raise Net::SSH::Exception, "host key algorithm mismatch for signature '#{sig_type}' != '#{algorithms.host_key_format}'"
            end

            result[:server_sig] = sig_buffer.read_string

            result
          end
        end
      end
    end
  end
end
