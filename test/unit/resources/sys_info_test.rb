
require 'helper'
require 'inspec/resource'
require 'inspec/resources/sys_info'

describe 'Inspec::Resources::SysInfo' do
  describe 'sys_info' do
    it 'check ssh config parsing for Ubuntu' do
      resource = MockLoader.new(:ubuntu1504).load_resource('sys_info')
      _(resource.hostname).must_equal 'example.com'
    end

    it 'check ssh config parsing for Ubuntu' do
      resource = MockLoader.new(:windows).load_resource('sys_info')
      _(resource.hostname).must_equal 'WIN-CIV7VMLVHLD'
    end

    it 'check ssh config parsing for freebsd' do
      resource = MockLoader.new(:freebsd10).load_resource('sys_info')
      _(resource.hostname).must_equal 'The `sys_info.hostname` resource is not supported on your OS yet.'
    end
  end
end
