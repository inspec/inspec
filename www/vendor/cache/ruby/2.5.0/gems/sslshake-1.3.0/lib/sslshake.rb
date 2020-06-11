# encoding: utf-8
# copyright: 2016, Dominik Richter
# license: MPLv2

require 'socket'
require 'securerandom'
require 'io/wait'
require 'sslshake/version'
require 'sslshake/ciphers'
require 'sslshake/sslv2'
require 'sslshake/tls'

module SSLShake
  def self.socket(host, opts = {})
    return [opts[:socket], nil] unless opts[:socket].nil?

    port = opts[:port] || 443
    timeout = opts[:timeout] || 2

    addr = Socket.getaddrinfo(host, nil)[0] ||
           fail("Cannot determine address for socket to #{host}:#{port}")
    family = addr[4]

    sockaddr = Socket.pack_sockaddr_in(port, addr[2])
    socket = Socket.new(family, Socket::SOCK_STREAM, 0)
    socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)

    begin
      socket.connect_nonblock(sockaddr)
    rescue IO::WaitWritable
      if IO.select(nil, [socket], nil, timeout)
        begin
          socket.connect_nonblock(sockaddr)
        rescue Errno::EISCONN
          true # done, it's connected
        rescue => err
          socket.close
          return [nil, "Connection error #{err.class}, can't connect to #{host}:#{port}."]
        end
      else
        socket.close
        return [nil, "Connection timeout after #{timeout}, can't connect to #{host}:#{port}."]
      end
    end

    [socket, nil]
  rescue SystemCallError, Alert => _
    return [nil, "Connection refused, can't connect to #{host}:#{port}."]
  end

  def self.hello(host, opts = {})
    cur_socket = opts[:socket]
    if cur_socket.nil?
      cur_socket, error = socket(host, opts)
      return { 'error' => error } unless error.nil?
    end

    protocol = opts[:protocol] || 'tls1.2'
    if protocol == 'ssl2'
      ssl = SSLShake::SSLv2.new
      cur_socket.send(ssl.hello(opts[:ciphers]), 0)
    else
      ssl = SSLShake::TLS.new

      sni = nil
      if opts[:servername] != nil && opts[:protocol] != 'ssl3'
        sni = '0000' + sprintf('%04x', opts[:servername].length + 5) +
            sprintf('%04x', opts[:servername].length + 3) + '00' +
            sprintf('%04x', opts[:servername].length) +
            opts[:servername].unpack('H*')[0]
      end

      cur_socket.send(ssl.hello(protocol, opts[:ciphers], sni), 0)
    end

    res = ssl.parse_hello(cur_socket, opts)
    cur_socket.close if opts[:socket].nil?
    res
  rescue SystemCallError => _
    return { 'error' => 'Failed to send hello. Socket closed.' }
  end
end
