# encoding: utf-8
# author: Stephan Renatus
# author: Dominik Richter

require 'helper'
require 'mocha/setup'

describe Inspec::Targets::UrlHelper do
  let(:url_helper) { Inspec::Targets::UrlHelper.new }

  it 'handles http' do
    url_helper.handles?('http://chef.io').must_equal true
  end

  it 'handles https' do
    url_helper.handles?('https://chef.io').must_equal true
  end

  it 'returns false if given an invalid URL' do
    url_helper.handles?('cheshire_cat').must_equal false
  end

  it 'returns false if given an URL with a protocol different from http[s]' do
    url_helper.handles?('gopher://chef.io').must_equal false
  end

  it 'resolves various github urls' do
    mock = Minitest::Mock.new
    url_helper.stub :download_archive, mock do
      %w{https://github.com/chef/inspec
         https://github.com/chef/inspec.git
         https://www.github.com/chef/inspec.git
         http://github.com/chef/inspec
         http://github.com/chef/inspec.git
         http://www.github.com/chef/inspec.git}.each do |github|
        mock.expect :call, nil, ['https://github.com/chef/inspec/archive/master.tar.gz', {}]

        url_helper.resolve(github)
      end
      mock.verify
    end
  end

  it 'leaves proper, non-github urls unchanged' do
    url = 'https://chef.io/something.tar.gz'
    mock = Minitest::Mock.new
    mock.expect :call, nil, [url, {}]
    url_helper.stub :download_archive, mock do
        url_helper.resolve(url)
    end
    mock.verify
  end

  def archive_of_type(type)
    mock = Minitest::Mock.new
    mock.expect :write, nil, ["#{type}-content"]
    mock.expect :path, "/path/to/#{type}-archive.tar.gz" # always tar.gz!
    [:binmode, :rewind, :close, :unlink].each do |meth|
      mock.expect meth, nil
    end
    mock
  end

  def remote_of_type(type, content_type)
    mock = Minitest::Mock.new
    mock.expect :read, "#{type}-content"
    mock.expect :meta, { 'content-type' => content_type }
    mock
  end

  describe 'with a funny archive and content-type' do
    let (:url) { 'https://github.com/chef/inspec/archive/master.tar.gz' }
    let (:remote_mock) { remote_of_type('sth', 'application/x-very-funny') }

    it 'will download, but fails at resolving this content-type' do
      url_helper.expects(:open).returns(remote_mock)
      proc { url_helper.resolve(url) }.must_throw RuntimeError
      remote_mock.verify
    end

    it 'downloads an archive and returns it with its content-type using options, too' do
      url_helper.expects(:open).returns(remote_mock)
      r, m = url_helper.method(:download_archive)
                       .call(url, 'user' => 'alice', 'password' => 'pw')
      m.must_equal('application/x-very-funny')
      r.must_be_kind_of(File)
      r.unlink
      remote_mock.verify
    end
  end

  describe 'with a tar.gz archive' do
    let (:url) { 'https://github.com/chef/inspec/archive/master.tar.gz' }
    let (:profile_path) { MockLoader.profile_tgz('complete-profile') }
    let (:archive_path) { profile_path.sub(/.tgz$/, '')[1..-1] + '/' }

    it 'resolves the url' do
      url_helper.expects(:download_archive).returns([File.new(profile_path), 'application/x-gzip'])
      res = url_helper.resolve(url)
      # TODO: the leading '/' is removed due to tar-handling; this should be
      # a different ref altogether containing the right relative path of the tar

      res.must_be_kind_of Array
      res.length.must_equal 2

      res[0][:type].must_equal :test
      res[0][:content].wont_be_empty
      res[0][:ref].must_equal "#{archive_path}controls/filesystem_spec.rb"

      res[1][:type].must_equal :metadata
      res[1][:content].wont_be_empty
      res[1][:ref].must_equal "#{archive_path}inspec.yml"
    end
  end

  describe 'with a zip archive' do
    let (:url) { 'https://github.com/chef/inspec/archive/master.zip' }
    let (:profile_path) { MockLoader.profile_zip('complete-profile') }
    let (:archive_path) { '' }

    it 'resolves the url' do
      url_helper.expects(:download_archive).returns([File.new(profile_path), 'application/zip'])
      res = url_helper.resolve(url)
      # TODO: the leading '/' is removed due to tar-handling; this should be
      # a different ref altogether containing the right relative path of the tar

      res.must_be_kind_of Array
      res.length.must_equal 2

      res[0][:type].must_equal :test
      res[0][:content].wont_be_empty
      res[0][:ref].must_equal "#{archive_path}controls/filesystem_spec.rb"

      res[1][:type].must_equal :metadata
      res[1][:content].wont_be_empty
      res[1][:ref].must_equal "#{archive_path}inspec.yml"
    end
  end
end
