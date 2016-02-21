# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe Fetchers::Url do
  let(:fetcher) { Fetchers::Url }

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    _(reg['url']).must_equal fetcher
  end

  describe 'applied to a valid url (mocked tar.gz)' do
    let(:mock_file) { mock_file = MockLoader.profile_tgz('complete-profile') }
    let(:target) { 'http://myurl/file.tar.gz' }
    let(:res) {
      mock_open = Minitest::Mock.new
      mock_open.expect :meta, {'content-type' => 'application/gzip'}
      mock_open.expect :read, File.read(mock_file)
      fetcher.expects(:open).returns(mock_open)
      fetcher.resolve(target)
    }

    it 'must be resolved to the final format' do
      _(res).must_be_kind_of Fetchers::Tar
    end

    it 'must be resolved to the final format' do
      _(res.parent).must_be_kind_of fetcher
    end

    it 'must contain all files' do
      _(res.files).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/filesystem_spec.rb}
    end

    it 'must not read if the file isnt included' do
      _(res.read(rand.to_s)).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read('inspec.yml')).must_match /^name: complete$/
    end
  end

  describe 'applied to a valid url (mocked zip)' do
    let(:mock_file) { mock_file = MockLoader.profile_zip('complete-profile') }
    let(:target) { 'http://myurl/file.tar.gz' }
    let(:res) {
      mock_open = Minitest::Mock.new
      mock_open.expect :meta, {'content-type' => 'application/zip'}
      mock_open.expect :read, File.read(mock_file)
      fetcher.expects(:open).returns(mock_open)
      fetcher.resolve(target)
    }

    it 'must be resolved to the final format' do
      _(res).must_be_kind_of Fetchers::Zip
    end

    it 'must contain all files' do
      _(res.files).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/filesystem_spec.rb}
    end

    it 'must not read if the file isnt included' do
      _(res.read(rand.to_s)).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read('inspec.yml')).must_match /^name: complete$/
    end
  end
end
