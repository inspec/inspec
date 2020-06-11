class Fuzzyurl::Protocols
  PORTS_BY_PROTOCOL = {
    'ssh' => '22',
    'http' => '80',
    'https' => '443'
  }

  PROTOCOLS_BY_PORT = {
    '22' => 'ssh',
    '80' => 'http',
    '443' => 'https'
  }

  class << self
    def get_port(protocol)
      return nil unless protocol
      base_protocol = protocol.split('+').last
      PORTS_BY_PROTOCOL[base_protocol.to_s]
    end

    def get_protocol(port)
      PROTOCOLS_BY_PORT[port.to_s]
    end
  end
end

