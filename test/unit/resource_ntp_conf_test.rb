# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::NtpConf' do
  describe 'ntp_conf' do
    let(:resource) { loadResource('ntp_conf') }

    it 'verify ntp config parsing' do
      _(resource.driftfile).must_equal '/var/lib/ntp/ntp.drift'
      _(resource.server).must_equal %w{
        0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org
      }
    end

  end
end
