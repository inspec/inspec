require 'net/ssh/transport/kex/abstract'

module Net
  module SSH
    module Transport
      module Kex
        # A key-exchange service implementing the "diffie-hellman-group1-sha1"
        # key-exchange algorithm.
        class DiffieHellmanGroup1SHA1 < Abstract
          # The value of 'P', as a string, in hexadecimal
          P_s = "FFFFFFFF" "FFFFFFFF" "C90FDAA2" "2168C234" +
                "C4C6628B" "80DC1CD1" "29024E08" "8A67CC74" +
                "020BBEA6" "3B139B22" "514A0879" "8E3404DD" +
                "EF9519B3" "CD3A431B" "302B0A6D" "F25F1437" +
                "4FE1356D" "6D51C245" "E485B576" "625E7EC6" +
                "F44C42E9" "A637ED6B" "0BFF5CB6" "F406B7ED" +
                "EE386BFB" "5A899FA5" "AE9F2411" "7C4B1FE6" +
                "49286651" "ECE65381" "FFFFFFFF" "FFFFFFFF"

          # The radix in which P_s represents the value of P
          P_r = 16

          # The group constant
          G = 2

          def digester
            OpenSSL::Digest::SHA1
          end

          private

          # Returns the DH key parameters for the current connection. [p, q]
          def get_parameters
            [
              OpenSSL::BN.new(self.class::P_s, self.class::P_r),
              self.class::G
            ]
          end

          # Returns the INIT/REPLY constants used by this algorithm.
          def get_message_types
            [KEXDH_INIT, KEXDH_REPLY]
          end

          # Build the signature buffer to use when verifying a signature from
          # the server.
          def build_signature_buffer(result)
            response = Net::SSH::Buffer.new
            response.write_string data[:client_version_string],
                                  data[:server_version_string],
                                  data[:client_algorithm_packet],
                                  data[:server_algorithm_packet],
                                  result[:key_blob]
            response.write_bignum dh.pub_key,
                                  result[:server_dh_pubkey],
                                  result[:shared_secret]
            response
          end

          # Generate a DH key with a private key consisting of the given
          # number of bytes.
          def generate_key #:nodoc:
            dh = OpenSSL::PKey::DH.new

            if dh.respond_to?(:set_pqg)
              p, g = get_parameters
              dh.set_pqg(p, nil, g)
            else
              dh.p, dh.g = get_parameters
            end

            dh.generate_key!
            until dh.valid? && dh.priv_key.num_bytes == data[:need_bytes]
              if dh.respond_to?(:set_key)
                dh.set_key(nil, OpenSSL::BN.rand(data[:need_bytes] * 8))
              else
                dh.priv_key = OpenSSL::BN.rand(data[:need_bytes] * 8)
              end
              dh.generate_key!
            end
            dh
          end

          # Send the KEXDH_INIT message, and expect the KEXDH_REPLY. Return the
          # resulting buffer.
          #
          # Parse the buffer from a KEXDH_REPLY message, returning a hash of
          # the extracted values.
          def send_kexinit #:nodoc:
            init, reply = get_message_types

            # send the KEXDH_INIT message
            buffer = Net::SSH::Buffer.from(:byte, init, :bignum, dh.pub_key)
            connection.send_message(buffer)

            # expect the KEXDH_REPLY message
            buffer = connection.next_message
            raise Net::SSH::Exception, "expected REPLY" unless buffer.type == reply

            result = Hash.new

            result[:key_blob] = buffer.read_string
            result[:server_key] = Net::SSH::Buffer.new(result[:key_blob]).read_key
            result[:server_dh_pubkey] = buffer.read_bignum
            result[:shared_secret] = OpenSSL::BN.new(dh.compute_key(result[:server_dh_pubkey]), 2)

            sig_buffer = Net::SSH::Buffer.new(buffer.read_string)
            sig_type = sig_buffer.read_string
            if sig_type != algorithms.host_key_format
              raise Net::SSH::Exception,
                "host key algorithm mismatch for signature " +
                "'#{sig_type}' != '#{algorithms.host_key_format}'"
            end
            result[:server_sig] = sig_buffer.read_string

            return result
          end
        end
      end
    end
  end
end
