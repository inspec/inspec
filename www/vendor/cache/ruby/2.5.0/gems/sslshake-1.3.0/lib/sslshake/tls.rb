# encoding: utf-8
# copyright: 2016, Dominik Richter
# license: MPLv2

require 'sslshake/common'
require 'sslshake/ciphers'

module SSLShake
  class TLS # rubocop:disable Metrics/ClassLength
    include CommonHelpers

    VERSIONS = {
      'ssl3'   => '0300',
      'tls1.0' => '0301',
      'tls1.1' => '0302',
      'tls1.2' => '0303',
    }.freeze

    CONTENT_TYPES = {
      'ChangeCipherSpec' => '14',
      'Alert'            => '15',
      'Handshake'        => '16',
      'Application'      => '17',
      'Heartbeat'        => '18',
    }.freeze

    HANDSHAKE_TYPES = {
      'HelloRequest'       => '00',
      'ClientHello'        => '01',
      'ServerHello'        => '02',
      'NewSessionTicket'   => '04',
      'Certificate'        => '11',
      'ServerKeyExchange'  => '12',
      'CertificateRequest' => '13',
      'ServerHelloDone'    => '14',
      'CertificateVerify'  => '15',
      'ClientKeyExchange'  => '16',
      'Finished'           => '20',
    }.freeze

    # https://tools.ietf.org/html/rfc6101#appendix-A.6
    SSL3_CIPHERS = ::SSLShake::CIPHERS.select { |_, v| v.length == 4 }
    TLS_CIPHERS = ::SSLShake::CIPHERS.select { |k, _| k.start_with? 'TLS_' }
    TLS10_CIPHERS = TLS_CIPHERS.select { |_, v| v[0] == '0' && v[1] == '0' }

    # Additional collection of ciphers used by different apps and versions
    OPENSSL_1_0_2_TLS10_CIPHERS = 'c014c00ac022c021c02000390038003700360088008700860085c00fc00500350084c013c009c01fc01ec01d00330032008000810082008300310030009a0099009800970045004400430042c00ec004002f009600410007c011c0070066c00cc00200050004c012c008c01cc01bc01a001600130010000dc00dc003000a006300150012000f000c006200090065006400140011000e000b00080006000300ff'.freeze
    OPENSSL_1_0_2_TLS11_CIPHERS = 'c014c00ac022c021c02000390038003700360088008700860085c00fc00500350084c013c009c01fc01ec01d00330032008000810082008300310030009a0099009800970045004400430042c00ec004002f009600410007c011c0070066c00cc00200050004c012c008c01cc01bc01a001600130010000dc00dc003000a006300150012000f000c006200090065006400140011000e000b00080006000300ff'.freeze
    OPENSSL_1_0_2_TLS12_CIPHERS = 'cc14cc13cc15c030c02cc028c024c014c00a00a500a300a1009f006b006a006900680039003800370036c077c07300c400c300c200c1008800870086008500810080c032c02ec02ac026c00fc005c079c075009d003d003500c000840095c02fc02bc027c023c013c00900a400a200a0009e00670040003f003e0033003200310030c076c07200be00bd00bc00bb009a0099009800970045004400430042c031c02dc029c025c00ec004c078c074009c003c002f00ba0096004100070094c011c0070066c00cc002000500040092c012c008001600130010000dc00dc003000a009300150012000f000c000900ff'.freeze

    def ssl_record(content_type, content, version)
      res = content_type + version + int_bytes(content.length / 2, 2) + content
      [res].pack('H*')
    end

    def ssl_hello(content, version)
      ssl_record(
        CONTENT_TYPES['Handshake'],
        HANDSHAKE_TYPES['ClientHello'] + int_bytes(content.length / 2, 3) + content,
        version,
      )
    end

    def hello(version, cipher_search = nil, extensions = nil)
      case version
      when 'ssl3'
        ciphers = cipher_string(SSL3_CIPHERS, cipher_search)
      when 'tls1.0', 'tls1.1'
        ciphers = cipher_string(TLS_CIPHERS, cipher_search)
        (extensions ||= '') << '000f000101' # add Heartbeat
        extensions << '000d00140012040308040401050308050501080606010201' # add signature_algorithms
        extensions << '000b00020100' # add ec_points_format
        extensions << '000a000a0008fafa001d00170018' # add elliptic_curve
      when 'tls1.2'
        ciphers = cipher_string(TLS_CIPHERS, cipher_search)
        (extensions ||= '') << '000f000101' # add Heartbeat
        extensions << '000d00140012040308040401050308050501080606010201' # add signature_algorithms
        extensions << '000b00020100' # add ec_points_format
        extensions << '000a000a0008fafa001d00170018' # add elliptic_curve
      else
        fail UserError, "This version is not supported: #{version.inspect}"
      end
      hello_tls(version, ciphers, extensions || '')
    end

    def parse_hello(socket, opts) # rubocop:disable Meterics/AbcSize
      raw = socket_read(socket, 5, opts[:timeout], opts[:retries])
            .unpack('H*')[0].upcase.scan(/../)
      type = raw.shift
      if type == CONTENT_TYPES['Alert']
        return { 'error' => 'SSL Alert.' }
      end
      unless type == CONTENT_TYPES['Handshake']
        return { 'error' => 'Failed to parse response. It is not an SSL handshake.' }
      end

      res = {}
      res['version'] = VERSIONS.key(raw.shift(2).join(''))
      len = raw.shift(2).join.to_i(16)

      res['raw'] = response = socket_read(socket, len, opts[:timeout], opts[:retries])
                              .unpack('H*')[0].upcase
      raw = response.scan(/../)

      res['handshake_type'] = HANDSHAKE_TYPES.key(raw.shift)
      _len = raw.shift(3)

      res['handshake_tls_version'] = VERSIONS.key(raw.shift(2).join(''))
      res['random'] = raw.shift(32).join('')

      len = raw.shift.to_i(16)
      res['session_id'] = raw.shift(len).join('')
      ciphers =
        case res['version']
        when 'ssl3'
          SSL3_CIPHERS
        else
          TLS_CIPHERS
        end
      res['cipher_suite'] = ciphers.key(raw.shift(2).join(''))
      res['compression_method'] = raw.shift
      res['success'] = true
      res['success'] = (res['version'] == opts[:protocol]) unless opts[:protocol].nil?

      res
    rescue SystemCallError, Alert => _
      return { 'error' => 'Failed to parse response. The connection was terminated.' }
    end

    private

    def hello_tls(version, ciphers, extensions)
      random = SecureRandom.hex(32)
      session_id = ''
      compressions = '00'
      c = VERSIONS[version] +
          random +
          int_bytes(session_id.length / 2, 1) +
          session_id +
          int_bytes(ciphers.length / 2, 2) +
          ciphers +
          int_bytes(compressions.length / 2, 1) +
          compressions +
          int_bytes(extensions.length / 2, 2) +
          extensions
      ssl_hello(c, VERSIONS[version])
    end
  end
end
