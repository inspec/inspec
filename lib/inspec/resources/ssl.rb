# copyright: 2015, Chef Software Inc.

require 'sslshake'
require 'inspec/utils/filter'
require 'uri'
require 'parallel'

# Custom resource based on the InSpec resource DSL
class SSL < Inspec.resource(1)
  name 'ssl'
  supports platform: 'unix'
  supports platform: 'windows'

  desc "
    SSL test resource
  "

  example <<~EXAMPLE
    describe ssl(port: 443) do
      it { should be_enabled }
    end

    # protocols: ssl2, ssl3, tls1.0, tls1.1, tls1.2
    describe ssl(port: 443).protocols('ssl2') do
      it { should_not be_enabled }
    end

    # any ciphers, filter by name or regex
    describe ssl(port: 443).ciphers(/rc4/i) do
      it { should_not be_enabled }
    end
  EXAMPLE

  VERSIONS = [
    'ssl2',
    'ssl3',
    'tls1.0',
    'tls1.1',
    'tls1.2',
  ].freeze

  attr_reader :host, :port, :timeout, :retries

  def initialize(opts = {})
    @host = opts[:host]
    if @host.nil?
      # Transports like SSH and WinRM will provide a hostname
      if inspec.backend.respond_to?('hostname')
        @host = inspec.backend.hostname
      elsif inspec.backend.class.to_s == 'Train::Transports::Local::Connection'
        @host = 'localhost'
      end
    end
    @port = opts[:port] || 443
    @timeout = opts[:timeout]
    @retries = opts[:retries]
  end

  filter = FilterTable.create
  filter.register_custom_matcher(:enabled?) do |x|
    raise 'Cannot determine host for SSL test. Please specify it or use a different target.' if x.resource.host.nil?
    x.handshake.values.any? { |i| i['success'] }
  end
  filter.register_column(:ciphers, field: 'cipher')
        .register_column(:protocols, field: 'protocol')
        .register_custom_property(:handshake) { |x|
          groups = x.entries.group_by(&:protocol)
          res = Parallel.map(groups, in_threads: 8) do |proto, e|
            [proto, SSLShake.hello(x.resource.host, port: x.resource.port,
              protocol: proto, ciphers: e.map(&:cipher),
              timeout: x.resource.timeout, retries: x.resource.retries, servername: x.resource.host)]
          end
          Hash[res]
        }
        .install_filter_methods_on_resource(self, :scan_config)

  def to_s
    "SSL/TLS on #{@host}:#{@port}"
  end

  private

  def scan_config
    [
      { 'protocol' => 'ssl2', 'ciphers' => SSLShake::SSLv2::CIPHERS.keys },
      { 'protocol' => 'ssl3', 'ciphers' => SSLShake::TLS::SSL3_CIPHERS.keys },
      { 'protocol' => 'tls1.0', 'ciphers' => SSLShake::TLS::TLS10_CIPHERS.keys },
      { 'protocol' => 'tls1.1', 'ciphers' => SSLShake::TLS::TLS10_CIPHERS.keys },
      { 'protocol' => 'tls1.2', 'ciphers' => SSLShake::TLS::TLS_CIPHERS.keys },
    ].map do |line|
      line['ciphers'].map do |cipher|
        { 'protocol' => line['protocol'], 'cipher' => cipher }
      end
    end.flatten
  end
end
