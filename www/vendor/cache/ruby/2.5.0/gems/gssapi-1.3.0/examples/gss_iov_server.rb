#!/usr/bin/env ruby
$: << '../lib'
$: << '.'
#require 'gssapi/heimdal'
require 'gssapi'
require 'gss_iov_helpers'
require 'base64'
require 'socket'

class GssIovServer
  include GssIOVHelpers

  def initialize
    @host = 'example.org'
    @service  = "host"
    @keytab = "#{ENV['HOME']}/.gssapi/krb5.keytab"  # this is optional, but probably required if not running as root
    @port = 8082
    @tcpsrv = TCPServer.new(@host, @port)
  end

  def runner
    loop do
      puts "Listening on port #{@port}"
      Thread.start(@tcpsrv.accept) do |s|
        init_krb
        handshake(s)

        begin
          emsg = (s.gets.chomp)
          puts "---> Received: #{emsg}"
          msg  = iov_decrypt(emsg)
          puts "===> Received: #{msg}"
        end while msg != 'exit'

        print(s, "Closing Socket\n")
        s.close
        puts "Closed...."
      end
    end
  end


  private

  def init_krb
    @gss = GSSAPI::Simple.new(@host, @service, @keytab)
    @gss.acquire_credentials
    puts "HELLO"
  end

  def handshake(sock)
    print(sock, "Accepted Connection\n")
    stok = sock.gets.chomp
    print(sock, "Received string#{stok}\n")
    otok = @gss.accept_context(Base64.strict_decode64(stok.chomp))
    sock.write("#{Base64.strict_encode64(otok)}\n")
  end

  # Decrypt message
  def msg_dec(msg)
    @gss.unwrap_message(Base64.strict_decode64(msg.chomp))
  end

end

gserv = GssIovServer.new
gserv.runner
