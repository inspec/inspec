# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::OsEnv' do
  let(:resource) { load_resource('os_env', 'PATH') }

  it 'verify ntp config parsing' do
    _(resource.split).must_equal %w{/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin}
  end
end
