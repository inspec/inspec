require 'gssapi'
require 'base64'
require 'socket'


host = 'example.org'
service  = 'host'
keytab = "#{ENV['HOME']}/.gssapi/krb5.keytab"  # this is optional, but probably required if not running as root

tcpsrv = TCPServer.new(host, 8082)

loop do
  Thread.start(tcpsrv.accept) do |s|
    print(s, "Accepted Connection\n")
    stok = s.gets.chomp
    print(s, "Received string#{stok}\n")
    srv = GSSAPI::Simple.new(host, service, keytab)
    srv.acquire_credentials
    otok = srv.accept_context(Base64.strict_decode64(stok.chomp))
    s.write("#{Base64.strict_encode64(otok)}\n")

    begin
      emsg = s.gets.chomp
      msg = srv.unwrap_message(Base64.strict_decode64(emsg.chomp))
      puts "Received: #{msg}"
    end while msg != 'exit'

    print(s, "Closing Socket\n")
    s.close
  end
end
