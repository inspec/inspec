# encoding: utf-8
# copyright: 2015, Chef Software Inc.
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'sslshake'
require 'utils/filter'

# Custom resource based on the InSpec resource DSL
class SSL < Inspec.resource(1)
  name 'ssl'

  desc "
    SSL test resource
  "

  example "
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
  "

  VERSIONS = [
    'ssl2',
    'ssl3',
    'tls1.0',
    'tls1.1',
    'tls1.2',
  ].freeze

  attr_reader :host, :port

  def initialize(opts = {})
    @host = opts[:host] ||
            inspec.backend.instance_variable_get(:@hostname)
    if @host.nil? && inspec.backend.class.to_s == 'Train::Transports::Local::Connection'
      @host = 'localhost'
    end
    if @host.nil?
      fail 'Cannot determine host for SSL test. Please specify it or use a different target.'
    end
    @port = opts[:port] || 443
    @timeout = opts[:timeout]
    @retries = opts[:retries]
  end

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:ciphers, field: 'cipher')
        .add(:protocols, field: 'protocol')
        .add(:enabled?) { |x| x.handshake.values.any? { |i| i['success'] } }
        .add(:handshake) { |x|
          groups = x.entries.group_by(&:protocol)
          res = groups.map do |proto, e|
            [proto, SSLShake.hello(x.resource.host, port: x.resource.port,
              protocol: proto, ciphers: e.map(&:cipher),
              timeout: @timeout, retries: @retries)]
          end
          Hash[res]
        }
        .connect(self, :scan_config)

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
