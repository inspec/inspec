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
      _(res).must_be_kind_of Fetchers::Url
      _(res.resolved_source).must_equal({url: 'http://chef.io/some.tar.gz'})
    end

    it 'handles a https url' do
      url = 'https://chef.io/some.tar.gz'
      res = fetcher.resolve(url)
      _(res).must_be_kind_of Fetchers::Url
      _(res.resolved_source).must_equal({url: 'https://chef.io/some.tar.gz'})

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
        _(res.resolved_source).must_equal({url: 'https://github.com/chef/inspec/archive/master.tar.gz'})
      end
    end

    it "resolves a github branch url" do
      github = 'https://github.com/hardening-io/tests-os-hardening/tree/2.0'
      res = fetcher.resolve(github)
      _(res).wont_be_nil
      _(res.resolved_source).must_equal({url: 'https://github.com/hardening-io/tests-os-hardening/archive/2.0.tar.gz'})
    end

    it "resolves a github commit url" do
      github = 'https://github.com/hardening-io/tests-os-hardening/tree/48bd4388ddffde68badd83aefa654e7af3231876'
      res = fetcher.resolve(github)
      _(res).wont_be_nil
      _(res.resolved_source).must_equal({url: 'https://github.com/hardening-io/tests-os-hardening/archive/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz'})
    end
  end

  describe 'applied to a valid url (mocked tar.gz)' do
    let(:mock_file) { MockLoader.profile_tgz('complete-profile') }
    let(:target) { 'http://myurl/file.tar.gz' }
    let(:subject) { fetcher.resolve(target) }
    let(:mock_open) {
      m = Minitest::Mock.new
      m.expect :meta, {'content-type' => 'application/gzip'}
      m.expect :read, File.open(mock_file, 'rb').read
      m
    }

    let(:mock_dest) {
      f = Tempfile.new("url-fetch-test")
      f.path
    }

    it 'tries to fetch the file' do
      subject.expects(:open).returns(mock_open)
      subject.fetch(mock_dest)
    end

    it "returns the resolved_source hash" do
      subject.resolved_source.must_equal({ url: target })
    end
  end
end
