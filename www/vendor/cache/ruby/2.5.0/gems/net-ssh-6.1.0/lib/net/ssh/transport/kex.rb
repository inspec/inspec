require 'net/ssh/transport/kex/diffie_hellman_group1_sha1'
require 'net/ssh/transport/kex/diffie_hellman_group14_sha1'
require 'net/ssh/transport/kex/diffie_hellman_group_exchange_sha1'
require 'net/ssh/transport/kex/diffie_hellman_group_exchange_sha256'
require 'net/ssh/transport/kex/ecdh_sha2_nistp256'
require 'net/ssh/transport/kex/ecdh_sha2_nistp384'
require 'net/ssh/transport/kex/ecdh_sha2_nistp521'
require 'net/ssh/transport/kex/curve25519_sha256_loader'

module Net::SSH::Transport
  module Kex
    # Maps the supported key-exchange algorithms as named by the SSH protocol
    # to their corresponding implementors.
    MAP = {
      'diffie-hellman-group1-sha1'           => DiffieHellmanGroup1SHA1,
      'diffie-hellman-group14-sha1'          => DiffieHellmanGroup14SHA1,
      'diffie-hellman-group-exchange-sha1'   => DiffieHellmanGroupExchangeSHA1,
      'diffie-hellman-group-exchange-sha256' => DiffieHellmanGroupExchangeSHA256,
      'ecdh-sha2-nistp256'                   => EcdhSHA2NistP256,
      'ecdh-sha2-nistp384'                   => EcdhSHA2NistP384,
      'ecdh-sha2-nistp521'                   => EcdhSHA2NistP521
    }

    if Net::SSH::Transport::Kex::Curve25519Sha256Loader::LOADED
      MAP['curve25519-sha256'] = Curve25519Sha256
      MAP['curve25519-sha256@libssh.org'] = Curve25519Sha256
    end
  end
end
