require 'helper'
require 'inspec/resource'
require 'inspec/resources/port'
require 'inspec/utils/parser'

class TestLinuxPorts < Minitest::Test
  def setup
    @linuxports = Inspec::Resources::LinuxPorts.new('')
  end

  def test_parse_ss_line_asterisk
    ss_line = 'tcp    LISTEN     0      128                                                 *:22                                                              *:*                   users:(("sshd",pid=1222,fd=3)) ino:15973 sk:2 <->'

    assert_equal ({"port"=>22,
                   "address"=>"0.0.0.0",
                   "protocol"=>"tcp",
                   "process"=>"sshd",
                   "pid"=>1222}),
                   @linuxports.parse_ss_line(ss_line)
  end

  def test_parse_ss_line_ipv4
    ss_line = 'tcp    LISTEN     0      128                                                 192.168.1.1:22                                                              *:*                   users:(("sshd",pid=1222,fd=3)) ino:15973 sk:2 <->'

    assert_equal ({"port"=>22,
                   "address"=>"192.168.1.1",
                   "protocol"=>"tcp",
                   "process"=>"sshd",
                   "pid"=>1222}),
                   @linuxports.parse_ss_line(ss_line)
  end

  def test_parse_ss_line_ipv6
    ss_line = 'tcp    LISTEN     0      128                   fe80::a00:27ff:fe32:ed09%enp0s3:9200                                                           :::*                   users:(("java",pid=1722,fd=124)) uid:112 ino:19542 sk:9 v6only:1 <->'
    assert_equal ({"port"=>9200,
                   "address"=>"fe80::a00:27ff:fe32:ed09",
                   "protocol"=>"tcp6",
                   "process"=>"java",
                   "pid"=>1722}),
                   @linuxports.parse_ss_line(ss_line)
  end

  def test_parse_ss_line_ipv6_wildcard
    ss_line = 'tcp    LISTEN     0      128                                                :::22                                                             :::*                   users:(("sshd",pid=1222,fd=4)) ino:15982 sk:3 v6only:1 <->'
    assert_equal ({"port"=>22,
                   "address"=>"::",
                   "protocol"=>"tcp6",
                   "process"=>"sshd",
                   "pid"=>1222}),
                   @linuxports.parse_ss_line(ss_line)
  end

  def test_parse_ss_line_ipv6_wildcard_brackets
    ss_line = 'tcp    LISTEN     0      128                                                [::]:22                                                             :::*                   users:(("sshd",pid=1222,fd=4)) ino:15982 sk:3 v6only:1 <->'
    assert_equal ({"port"=>22,
                   "address"=>"::",
                   "protocol"=>"tcp6",
                   "process"=>"sshd",
                   "pid"=>1222}),
                   @linuxports.parse_ss_line(ss_line)
  end

  def test_parse_ss_line_ipv6_address_brackets
    ss_line = 'tcp    LISTEN     0      128                   [fe80::a00:27ff:fe32:ed09]%enp0s3:9200                                                           :::*                   users:(("java",pid=1722,fd=124)) uid:112 ino:19542 sk:9 v6only:1 <->'
    assert_equal ({"port" => 9200,
                  "address" => "fe80::a00:27ff:fe32:ed09",
                  "protocol" => "tcp6",
                  "process" =>"java",
                  "pid" => 1722}),
                   @linuxports.parse_ss_line(ss_line)
  end
end
