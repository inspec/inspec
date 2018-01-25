require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::FileSystemResource' do
  describe 'when loading filesystem in linux' do
    let (:resource) { load_resource('filesystem', '/') }

    it 'resolves the / partition' do
      _(resource.partition).must_equal '/'
    end

    it 'has more than 1 MB' do
      _(resource.size).must_be :>=, 1
    end

    it 'must equal 28252316 MB' do
      _(resource.size).must_equal 28252316
    end
  end
  describe 'when loading filesystem in unsupported OS family' do
    it 'fails on Windows' do
      resource_fail = MockLoader.new(:windows).load_resource('filesystem', '/')
      expect = 'Resource Filesystem is not supported on platform windows/6.2.9200.'
      resource_fail.check_supports.must_equal expect
    end

    it 'fails on FreeBSD (unix-like)' do
      resource_fail = MockLoader.new(:freebsd10).load_resource('filesystem', '/')
      expect = 'Resource Filesystem is not supported on platform freebsd/10.'
      resource_fail.check_supports.must_equal expect
    end
  end
end
