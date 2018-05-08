title 'Verify `where` filter can survive an exception being thrown during trace generation'

require 'ipaddr'

control 'When we check an IPAddr' do
  describe simple_plural([{id: '192.168.1.23'}]).where {
    # IPAddr.new validates its arg.  When the where block 
    # is instance_eval'd for the Trace, this will fail. 
    # because 'id' will be a FilterTable::Trace object.
    # That exception should be absorbed. 
    IPAddr.new('192.168.1.0/24').include?(IPAddr.new(id))
   } do
    it { should exist }
  end
end
