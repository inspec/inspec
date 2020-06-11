require 'gssapi'
require 'base64'
require 'socket'

host = 'example.org'
service  = 'host'

sock = TCPSocket.new(host, 8082)

cli = GSSAPI::Simple.new(host, service)
tok = cli.init_context
stok = Base64.strict_encode64(tok)

sock.write("#{stok}\n") # send initial token
stok = sock.gets.chomp  # get back continuation token
ctx = cli.init_context(Base64.strict_decode64(stok.chomp)) # complete security context
puts "Connection #{(ctx ? 'succeeded' : 'failed')}"

begin
  print "> "
  msg = STDIN.gets.chomp
  emsg = cli.wrap_message(msg)
  sock.write("#{Base64.strict_encode64(emsg)}\n")
end while msg != 'exit'

sock.close
