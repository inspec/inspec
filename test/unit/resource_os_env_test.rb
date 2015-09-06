# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::OsEnv' do
  describe 'os_env' do
    let(:resource) { loadResource('os_env', 'PATH') }

    it 'verify ntp config parsing' do
      _(resource.split).must_equal %w{/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin}
    end

  end
end
