require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::FileSystemResource' do
  # arch linux
  it 'verify filesystem on linux' do
    resource = MockLoader.new(:ubuntu1404).load_resource('filesystem','/') 
    _(resource.size).must_be :>=, 1
    _(resource.name).must_equal '/'
  end
  
  # arch windows
  it 'verify filesystem on windows' do
    resource = MockLoader.new(:windows).load_resource('filesystem','c:')
    _(resource.size).must_be :>=, 1
    _(resource.name).must_equal 'c:'
  end

  # unsuported os
  describe 'when loading filesystem in unsupported OS family' do
    it 'fails on FreeBSD (unix-like)' do
      resource_fail = MockLoader.new(:freebsd10).load_resource('filesystem', '/')
      resource_fail.check_supports.must_equal false
    end
  end
end
