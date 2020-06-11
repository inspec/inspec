# encoding: utf-8
# copyright: 2016, Dominik Richter
# license: MPLv2

module SSLShake
  class Alert < ::StandardError; end
  class UserError < ::StandardError; end
  class NotYetImplementedError < ::StandardError; end

  module CommonHelpers
    def int_bytes(i, len = 1)
      format("%0#{len * 2}x", i)
    end

    def socket_read(socket, bytes, timeout, retries)
      timeout ||= 1
      retries ||= 2
      if socket.closed?
        fail Alert, 'No response, socket is closed.'
      end

      begin
        res = socket.read_nonblock(bytes)
      rescue IO::WaitReadable
        IO.select([socket], nil, nil, timeout)
        retries -= 1
        retry if retries >= 0
        raise Alert, 'Timeout while reading data.'
      rescue IO::WaitWritable
        IO.select(nil, [socket], nil, timeout)
        retries -= 1
        retry if retries >= 0
        raise Alert, 'Timeout while waiting for socket to be writable.'
      rescue EOFError
        raise Alert, 'Failed to read, EOF reached.'
      end

      fail Alert, 'No data received' if res.nil?
      res
    end

    def cipher_string(ciphers, search)
      case search
      when Proc
        ciphers.select(&search).values.join
      when String
        ciphers[search] || search
      when Regexp
        ciphers.select { |k, _| k =~ search }.values.join
      when Array
        search.map { |i| cipher_string(ciphers, i) }.join
      when nil
        ciphers.values.join
      else
        fail UserError, 'Please provide a search string, regex, or list for SSL ciphers.'
      end
    end
  end
end
