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

  describe 'testing different urls' do
    let(:mock_file) { MockLoader.profile_path('complete-metadata') }
    let(:fetcher) {
      Class.new(Fetchers::Url) do
        attr_reader :target, :archive
        def initialize(target, opts)
          @target = target
          @archive = File.new(__FILE__)
        end
      end
    }

    it 'handles a http url' do
      url = 'http://chef.io/some.tar.gz'
      res = fetcher.resolve(url)
      _(res).must_be_kind_of Fetchers::Local
      _(res.parent).must_be_kind_of Fetchers::Url
      _(res.parent.target).must_equal 'http://chef.io/some.tar.gz'
    end

    it 'handles a https url' do
      url = 'https://chef.io/some.tar.gz'
      res = fetcher.resolve(url)
      _(res).must_be_kind_of Fetchers::Local
      _(res.parent).must_be_kind_of Fetchers::Url
      _(res.parent.target).must_equal 'https://chef.io/some.tar.gz'
    end

    it 'doesnt handle other schemas' do
      fetcher.resolve('gopher://chef.io/some.tar.gz').must_be_nil
    end

    it 'only handles URLs' do
      fetcher.resolve(__FILE__).must_be_nil
    end

    %w{https://github.com/chef/inspec
       https://github.com/chef/inspec.git
       https://www.github.com/chef/inspec.git
       http://github.com/chef/inspec
       http://github.com/chef/inspec.git
       http://www.github.com/chef/inspec.git}.each do |github|
      it "resolves a github url #{github}" do
        res = fetcher.resolve(github)
        _(res).wont_be_nil
        _(res.parent.target).must_equal 'https://github.com/chef/inspec/archive/master.tar.gz'
      end
    end

    it "resolves a github branch url" do
      github = 'https://github.com/hardening-io/tests-os-hardening/tree/2.0'
      res = fetcher.resolve(github)
      _(res).wont_be_nil
      _(res.parent.target).must_equal 'https://github.com/hardening-io/tests-os-hardening/archive/2.0.tar.gz'
    end

    it "resolves a github commit url" do
      github = 'https://github.com/hardening-io/tests-os-hardening/tree/48bd4388ddffde68badd83aefa654e7af3231876'
      res = fetcher.resolve(github)
      _(res).wont_be_nil
      _(res.parent.target).must_equal 'https://github.com/hardening-io/tests-os-hardening/archive/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz'
    end
  end

  describe 'applied to a valid url (mocked tar.gz)' do
    let(:mock_file) { MockLoader.profile_tgz('complete-profile') }
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
      _(res.files.sort).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/filesystem_spec.rb}.sort
    end

    it 'must not read if the file isnt included' do
      _(res.read('file-not-in-archive')).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read('inspec.yml')).must_match /^name: complete$/
    end
  end

  describe 'applied to a valid url (mocked zip)' do
    let(:mock_file) { MockLoader.profile_zip('complete-profile') }
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
      _(res.files.sort).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/filesystem_spec.rb}.sort
    end

    it 'must not read if the file isnt included' do
      _(res.read('file-not-in-archive')).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read('inspec.yml')).must_match /^name: complete$/
    end
  end

  describe 'applied to a valid url with wrong content-type' do
    let(:mock_file) { MockLoader.profile_zip('complete-profile') }
    let(:target) { 'http://myurl/file.tar.gz' }

    it 'must be resolved to the final format' do
      mock_open = Minitest::Mock.new
      mock_open.expect :meta, {'content-type' => 'wrong'}
      fetcher.expects(:open).returns(mock_open)
      proc { fetcher.resolve(target) }.must_throw RuntimeError
    end
  end
end
