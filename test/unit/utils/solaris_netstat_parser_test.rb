
require 'helper'
require 'inspec/utils/parser'

describe SolarisNetstatParser do
  let (:parser) { Class.new() { include SolarisNetstatParser }.new }

  describe '#parse_solaris_netset' do
    it 'parses nil content' do
      parser.parse_netstat(nil).must_equal([])
    end

    it 'parses an empty line' do
      parser.parse_netstat('').must_equal([])
    end

    it 'parses udpv4' do
      content =
"""
UDP: IPv4
   Local Address        Remote Address      State
-------------------- -------------------- ----------
      *.631                               Idle
"""

      info = [{
        "protocol"=>"udp",
        "local-address"=>"*.631",
        "remote-address"=>"",
        "state"=>"Idle"
      }]
      parser.parse_netstat(content).must_equal(info)
    end

    it 'parses udpv6' do
      content =
"""
UDP: IPv6
   Local Address                     Remote Address                   State      If
--------------------------------- --------------------------------- ---------- -----
      *.546                                                         Idle
"""

      info = [{
        "protocol"=>"udp6",
        "local-address"=>"*.546",
        "remote-address"=>"",
        "state"=>"Idle",
        "if"=>"",
      }]
      parser.parse_netstat(content).must_equal(info)
    end

    it 'parses tcpv4' do
      content =
"""
TCP: IPv4
   Local Address        Remote Address     Swind  Send-Q  Rwind  Recv-Q    State
-------------------- -------------------- ------- ------ ------- ------ -----------
127.0.0.1.5999             *.*                  0      0  128000      0 LISTEN
"""

      info = [{
        "protocol"=>"tcp",
        "local-address"=>"127.0.0.1.5999",
        "remote-address"=>"*.*",
        "swind"=>"0",
        "send-q"=>"0",
        "rwind"=>"128000",
        "recv-q"=>"0",
        "state"=>"LISTEN",
      }]
      parser.parse_netstat(content).must_equal(info)
    end

    it 'parses tcpv6' do
      content =
"""
TCP: IPv6
   Local Address                     Remote Address                  Swind  Send-Q  Rwind  Recv-Q   State      If
--------------------------------- --------------------------------- ------- ------ ------- ------ ----------- -----
::1.5999                                *.*                               0      0  128000      0 LISTEN
"""

      info = [{
        "protocol"=>"tcp6",
        "local-address"=>"::1.5999",
        "remote-address"=>"*.*",
        "swind"=>"0",
        "send-q"=>"0",
        "rwind"=>"128000",
        "recv-q"=>"0",
        "state"=>"LISTEN",
        "if"=>"",
      }]
      parser.parse_netstat(content).must_equal(info)
    end

    it 'parses sctp' do
      content =
"""
SCTP:
        Local Address                   Remote Address          Swind  Send-Q Rwind  Recv-Q StrsI/O  State
------------------------------- ------------------------------- ------ ------ ------ ------ ------- -----------
0.0.0.0                         0.0.0.0                              0      0 102400      0  32/32  CLOSED
"""
    info = [{
      "protocol"=>"sctp",
      "local-address"=>"0.0.0.0",
      "remote-address"=>"0.0.0.0",
      "swind"=>"0",
      "send-q"=>"0",
      "rwind"=>"102400",
      "recv-q"=>"0",
      "strsi_o"=>"32/32",
      "state"=>"CLOSED",
    }]
    parser.parse_netstat(content).must_equal(info)
    end

  end
end
