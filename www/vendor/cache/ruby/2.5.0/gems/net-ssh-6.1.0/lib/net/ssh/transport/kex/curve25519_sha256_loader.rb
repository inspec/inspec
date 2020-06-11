module Net
  module SSH
    module Transport
      module Kex
        # Loads Curve25519Sha256 support which requires optinal dependencies
        module Curve25519Sha256Loader
          begin
            require 'net/ssh/transport/kex/curve25519_sha256'
            LOADED = true
            ERROR = nil
          rescue LoadError => e
            ERROR = e
            LOADED = false
          end

          def self.raiseUnlessLoaded(message)
            description = ERROR.is_a?(LoadError) ? dependenciesRequiredForX25519 : ''
            description << "#{ERROR.class} : \"#{ERROR.message}\"\n" if ERROR
            raise NotImplementedError, "#{message}\n#{description}" unless LOADED
          end

          def self.dependenciesRequiredForX25519
            result = "net-ssh requires the following gems for x25519 support:\n"
            result << " * x25519\n"
          end
        end
      end
    end
  end
end
