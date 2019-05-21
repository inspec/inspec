
require 'helper'

describe 'Inspec::Resources::InetdConf' do
  it 'verify limits.conf config parsing' do
    resource = load_resource('inetd_conf')
    _(resource.send('shell')).must_be_nil
    _(resource.send('login')).must_be_nil
    _(resource.send('ftp')).must_equal %w{stream tcp nowait root /usr/sbin/in.ftpd in.ftpd}
  end
end
