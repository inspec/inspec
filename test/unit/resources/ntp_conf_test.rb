
require 'helper'
require 'inspec/resource'
require 'inspec/resources/ntp_conf'

describe 'Inspec::Resources::NtpConf' do
  it 'verify ntp config parsing' do
    resource = load_resource('ntp_conf')
    _(resource.driftfile).must_equal '/var/lib/ntp/ntp.drift'
    _(resource.server).must_equal %w{
      0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org
    }
  end
end
