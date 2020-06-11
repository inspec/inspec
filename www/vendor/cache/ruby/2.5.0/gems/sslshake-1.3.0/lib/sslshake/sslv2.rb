# encoding: utf-8
# copyright: 2016, Dominik Richter
# license: MPLv2

require 'sslshake/common'
require 'sslshake/ciphers'

module SSLShake
  class SSLv2
    # https://tools.ietf.org/html/draft-hickman-netscape-ssl-00
    # http://www.homeport.org/~adam/ssl.html
    include CommonHelpers

    VERSIONS = {
      'ssl2' => '0002',
    }.freeze

    CIPHERS = ::SSLShake::CIPHERS.select { |k, _| k.start_with? 'SSL_CK_' }

    MESSAGE_TYPES = {
      'ERROR'               => '00',
      'CLIENT_HELLO'        => '01',
      'CLIENT_MASTER_KEY'   => '02',
      'CLIENT_FINISHED'     => '03',
      'SERVER_HELLO'        => '04',
      'SERVER_VERIFY'       => '05',
      'SERVER_FINISHED'     => '06',
      'REQUEST_CERTIFICATE' => '07',
      'CLIENT_CERTIFICATE'  => '08',
    }.freeze

    def hello(cipher_search = nil)
      ciphers = cipher_string(CIPHERS, cipher_search)
      challenge = SecureRandom.hex(16)
      content = MESSAGE_TYPES['CLIENT_HELLO'] +
                VERSIONS['ssl2'] +
                int_bytes(ciphers.length / 2, 2) +
                '0000' + # session id length
                int_bytes(challenge.length / 2, 2) +
                ciphers +
                challenge
      length = int_bytes((content.length / 2) | 0x8000, 2)
      res = length + content
      [res].pack('H*')
    end

    def parse_hello(socket, opts)
      res = {}
      head = socket_read(socket, 2, opts[:timeout], opts[:retries])
             .unpack('H*')[0].upcase.to_i(16)
      if (head & 0x8000) == 0
        fail NotYetImplementedError, 'Cannot yet handle SSLv2 responses with first bit set to 0'
      end

      len = head & 0x7fff
      res['raw'] = response = socket_read(socket, len, opts[:timeout], opts[:retries])
                              .unpack('H*')[0].upcase
      raw = response.scan(/../)

      res['message_type'] = MESSAGE_TYPES.key(raw.shift)
      if res['message_type'] == 'ERROR'
        fail Alert, 'SSL handshake responded with an error.'
      end

      res['session_id_hit'] = raw.shift
      res['cert_type'] = raw.shift
      version = raw.shift(2).join
      res['version'] = VERSIONS.key(version)
      if res['version'].nil?
        fail Alert, 'This does not look like a valid SSLv2 response; version bits are empty, no response.'
      end

      cert_len = raw.shift(2).join.to_i(16)
      ciphers_len = raw.shift(2).join.to_i(16)
      connection_id_len = raw.shift(2).join.to_i(16)

      while raw.length < cert_len
        cur = socket.gets
        sleep 0.1 && next if cur.nil?
        raw += cur.unpack('H*')[0].upcase.scan(/../)
        print '.'
        print raw.length
      end

      res['certificate'] = raw.shift(cert_len).join
      res['ciphers'] = raw.shift(ciphers_len).join.scan(/....../).map do |id|
        CIPHERS.key(id)
      end
      res['connection_id'] = raw.shift(connection_id_len).join
      res['success'] = true

      res
    rescue SystemCallError, Alert => _
      return { 'error' => 'Failed to parse response. The connection was terminated.' }
    rescue NotYetImplementedError => e
      return { 'error' => 'Failed to parse response. ' + e.message }
    end
  end
end
