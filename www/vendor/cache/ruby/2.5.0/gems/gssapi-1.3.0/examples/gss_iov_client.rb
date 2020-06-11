#!/usr/bin/env ruby
$: << '../lib'
$: << '.'
#require 'gssapi/heimdal'
require 'gssapi'
require 'gss_iov_helpers'
require 'base64'
require 'socket'

class GssIovClient
  include GssIOVHelpers

  def initialize
    @host = 'example.org'
    @service  = 'host'
    @sock = TCPSocket.new(@host, 8082)
    @gss = GSSAPI::Simple.new(@host, @service)
  end

  def run
    handshake
    begin
      print "> "
      msg = STDIN.gets.chomp
      emsg = iov_encrypt(msg)
      @sock.write("#{emsg.last}\n")
    end while msg != 'exit'

    @sock.close
  end


  private

  def handshake
    tok = @gss.init_context
    stok = Base64.strict_encode64(tok)

    @sock.write("#{stok}\n") # send initial token
    stok = @sock.gets.chomp  # get back continuation token
    ctx = @gss.init_context(Base64.strict_decode64(stok.chomp)) # complete security context
    puts "Connection #{(ctx ? 'succeeded' : 'failed')}"
  end

  # Encrypt message
  def msg_enc(msg)
    emsg = @gss.wrap_message(msg)
    Base64.strict_encode64(emsg)
  end

end


cli = GssIovClient.new
cli.run
