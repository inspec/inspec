require 'net/ssh/buffer'
require 'net/ssh/errors'
require 'net/ssh/loggable'
require 'net/ssh/transport/openssl'
require 'net/ssh/transport/constants'

module Net
  module SSH
    module Transport
      module Kex
        # Abstract class that implement Diffie-Hellman Key Exchange
        # See https://tools.ietf.org/html/rfc4253#page-21
        class Abstract
          include Loggable
          include Constants

          attr_reader :algorithms
          attr_reader :connection
          attr_reader :data
          attr_reader :dh

          # Create a new instance of the Diffie-Hellman Key Exchange algorithm.
          # The Diffie-Hellman (DH) key exchange provides a shared secret that
          # cannot be determined by either party alone.  The key exchange is
          # combined with a signature with the host key to provide host
          # authentication.
          def initialize(algorithms, connection, data)
            @algorithms = algorithms
            @connection = connection

            @data = data.dup
            @dh = generate_key
            @logger = @data.delete(:logger)
          end

          # Perform the key-exchange for the given session, with the given
          # data. This method will return a hash consisting of the
          # following keys:
          #
          # * :session_id
          # * :server_key
          # * :shared_secret
          # * :hashing_algorithm
          #
          # The caller is expected to be able to understand how to use these
          # deliverables.
          def exchange_keys
            result = send_kexinit
            verify_server_key(result[:server_key])
            session_id = verify_signature(result)
            confirm_newkeys

            {
              session_id: session_id,
              server_key: result[:server_key],
              shared_secret: result[:shared_secret],
              hashing_algorithm: digester
            }
          end

          def digester
            raise NotImplementedError, 'abstract class: digester not implemented'
          end

          private

          # Verify that the given key is of the expected type, and that it
          # really is the key for the session's host. Raise Net::SSH::Exception
          # if it is not.
          def verify_server_key(key) #:nodoc:
            if key.ssh_type != algorithms.host_key
              raise Net::SSH::Exception, "host key algorithm mismatch '#{key.ssh_type}' != '#{algorithms.host_key}'"
            end

            blob, fingerprint = generate_key_fingerprint(key)

            unless connection.host_key_verifier.verify(key: key, key_blob: blob, fingerprint: fingerprint, session: connection)
              raise Net::SSH::Exception, 'host key verification failed'
            end
          end

          def generate_key_fingerprint(key)
            blob = Net::SSH::Buffer.from(:key, key).to_s

            fingerprint = Net::SSH::Authentication::PubKeyFingerprint.fingerprint(blob, @connection.options[:fingerprint_hash] || 'SHA256')

            [blob, fingerprint]
          rescue StandardError => e
            [nil, "(could not generate fingerprint: #{e.message})"]
          end

          # Verify the signature that was received. Raise Net::SSH::Exception
          # if the signature could not be verified. Otherwise, return the new
          # session-id.
          def verify_signature(result) #:nodoc:
            response = build_signature_buffer(result)

            hash = digester.digest(response.to_s)

            unless connection.host_key_verifier.verify_signature { result[:server_key].ssh_do_verify(result[:server_sig], hash) }
              raise Net::SSH::Exception, 'could not verify server signature'
            end

            hash
          end

          # Send the NEWKEYS message, and expect the NEWKEYS message in
          # reply.
          def confirm_newkeys #:nodoc:
            # send own NEWKEYS message first (the wodSSHServer won't send first)
            response = Net::SSH::Buffer.new
            response.write_byte(NEWKEYS)
            connection.send_message(response)

            # wait for the server's NEWKEYS message
            buffer = connection.next_message
            raise Net::SSH::Exception, 'expected NEWKEYS' unless buffer.type == NEWKEYS
          end
        end
      end
    end
  end
end
