# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::NtpConf' do
  it 'verify ntp config parsing' do
    resource = load_resource('ntp_conf')
    _(resource.driftfile).must_equal '/var/lib/ntp/ntp.drift'
    _(resource.server).must_equal %w{
      0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org
    }
  end
end
