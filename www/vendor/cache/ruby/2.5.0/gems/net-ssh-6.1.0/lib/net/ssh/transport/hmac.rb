require 'net/ssh/transport/key_expander'
require 'net/ssh/transport/hmac/md5'
require 'net/ssh/transport/hmac/md5_96'
require 'net/ssh/transport/hmac/sha1'
require 'net/ssh/transport/hmac/sha1_96'
require 'net/ssh/transport/hmac/sha2_256'
require 'net/ssh/transport/hmac/sha2_256_96'
require 'net/ssh/transport/hmac/sha2_512'
require 'net/ssh/transport/hmac/sha2_512_96'
require 'net/ssh/transport/hmac/sha2_256_etm'
require 'net/ssh/transport/hmac/sha2_512_etm'
require 'net/ssh/transport/hmac/ripemd160'
require 'net/ssh/transport/hmac/none'

# Implements a simple factory interface for fetching hmac implementations, or
# for finding the key lengths for hmac implementations.s
module Net::SSH::Transport::HMAC
  # The mapping of SSH hmac algorithms to their implementations
  MAP = {
    'hmac-md5'                      => MD5,
    'hmac-md5-96'                   => MD5_96,
    'hmac-sha1'                     => SHA1,
    'hmac-sha1-96'                  => SHA1_96,
    'hmac-sha2-256'                 => SHA2_256,
    'hmac-sha2-256-96'              => SHA2_256_96,
    'hmac-sha2-512'                 => SHA2_512,
    'hmac-sha2-512-96'              => SHA2_512_96,
    'hmac-sha2-256-etm@openssh.com' => SHA2_256_Etm,
    'hmac-sha2-512-etm@openssh.com' => SHA2_512_Etm,
    'hmac-ripemd160'                => RIPEMD160,
    'hmac-ripemd160@openssh.com'    => RIPEMD160,
    'none'                          => None
  }

  # Retrieves a new hmac instance of the given SSH type (+name+). If +key+ is
  # given, the new instance will be initialized with that key.
  def self.get(name, key="", parameters = {})
    impl = MAP[name] or raise ArgumentError, "hmac not found: #{name.inspect}"
    impl.new(Net::SSH::Transport::KeyExpander.expand_key(impl.key_length, key, parameters))
  end

  # Retrieves the key length for the hmac of the given SSH type (+name+).
  def self.key_length(name)
    impl = MAP[name] or raise ArgumentError, "hmac not found: #{name.inspect}"
    impl.key_length
  end
end
