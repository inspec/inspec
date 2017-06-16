require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::ParseConfig' do

  it 'verify parse_config resource' do
    options = {
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/
    }
    resource = MockLoader.new(:centos6).load_resource('parse_config', 'kernel.domainname = example.com', options)
    result = {"kernel.domainname"=>"example.com"}
    _(resource.params).must_equal result
    _(resource.content).must_equal 'kernel.domainname = example.com'
    _(resource.send('kernel.domainname')).must_equal 'example.com'
  end

  it 'verify parse_config_file resource' do
    options = {
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/
    }
    resource = MockLoader.new(:centos6).load_resource('parse_config_file', '/etc/sysctl.conf', options)
    result = {"kernel.domainname"=>"example.com"}
    _(resource.params).must_equal result
    _(resource.send('kernel.domainname')).must_equal 'example.com'
  end
end
