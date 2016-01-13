# encoding: utf-8
# author: Stephan Renatus

require 'helper'

describe Inspec::Targets::UrlHelper do
  let(:helper) { Inspec::Targets::UrlHelper.new }

  it 'handles http' do
    helper.handles?('http://chef.io').must_equal true
  end

  it 'handles https' do
    helper.handles?('https://chef.io').must_equal true
  end

  it 'returns false if given an invalid URL' do
    helper.handles?('cheshire_cat').must_equal false
  end

  it 'returns false if given an URL with a protocol different from http[s]' do
    helper.handles?('gopher://chef.io').must_equal false
  end

  it 'resolves various github urls' do
    hlpr = Minitest::Mock.new
    helper.stub :resolve_zip, hlpr do
      %w{https://github.com/chef/inspec
         https://github.com/chef/inspec.git
         https://www.github.com/chef/inspec.git
         http://github.com/chef/inspec
         http://github.com/chef/inspec.git
         http://www.github.com/chef/inspec.git}.each do |github|
        hlpr.expect :call, nil, ['https://github.com/chef/inspec/archive/master.tar.gz', {}]

        helper.resolve(github)
      end
      hlpr.verify
    end
  end

  it 'leaves proper, non-github urls unchanged' do
    url = 'https://chef.io/something.tar.gz'
    hlpr = Minitest::Mock.new
    hlpr.expect :call, nil, [url, {}]
    helper.stub :resolve_zip, hlpr do
        helper.resolve(url)
    end
    hlpr.verify
  end

  let (:url) { 'https://github.com/chef/inspec/archive/master.tar.gz' }
  let (:opts) { { http_basic_authentication: ['', ''] } }

  def archive_of_type(type)
    archive = Minitest::Mock.new
    archive.expect :write, nil, ["#{type}-content"]
    archive.expect :path, "/path/to/#{type}-archive.tar.gz" # always tar.gz!
    [:binmode, :rewind, :close, :unlink].each do |meth|
      archive.expect meth, nil
    end
    archive
  end

  def remote_of_type(type, content_type)
    remote = Minitest::Mock.new
    remote.expect :read, "#{type}-content"
    remote.expect :meta, { 'content-type' => content_type }
    remote
  end

  let (:archive_sth) { archive_of_type('sth') }
  let (:remote_sth) { remote_of_type('sth', 'application/x-very-funny') }

  it 'downloads an archive and returns it with its content-type' do
    helper.stub :open, remote_sth, [url, opts] do
      helper.download_archive(url, archive_sth, {}).must_equal([archive_sth, 'application/x-very-funny'])
    end
    remote_sth.verify
  end

  it 'downloads an archive and returns it with its content-type using options, too' do
    helper.stub :open, remote_sth, [url, { http_basic_authentication: ['alice', 'pw'] }] do
      helper.download_archive(url, archive_sth, 'user' => 'alice', 'password' => 'pw').must_equal([archive_sth, 'application/x-very-funny'])
    end
    remote_sth.verify
  end

  let (:archive_zip) { archive_of_type('zip') }
  let (:archive_tgz) { archive_of_type('tgz') }

  let (:tarhelper) do
    th = Minitest::Mock.new
    th.expect :resolve, 'tgz-content', ['/path/to/tgz-archive.tar.gz']
    th
  end

  %w{ application/gzip application/x-gzip }.each do |content_type|
    it "unpacks a tarball (#{content_type}) with TarHelper and returns the content" do
      Tempfile.stub :new, archive_tgz, [['inspec-dl-', '.tar.gz']] do
        helper.stub :download_archive, [archive_tgz, content_type], [url, archive_tgz, opts] do
          Inspec::Targets::TarHelper.stub :new, tarhelper do
            helper.resolve_zip(url, {}).must_equal('tgz-content')
          end
        end
      end
      tarhelper.verify
    end
  end

  let (:ziphelper) do
    zip = Minitest::Mock.new
    zip.expect :resolve, 'zip-content', [Pathname.new('/path/to/zip-archive.zip')]
    zip
  end

  %w{ application/zip application/x-zip-compressed }.each do |content_type|
    it "renames and unpacks a zip file (#{content_type}) with ZipHelper and returns the content" do
      helper.stub :download_archive, [archive_zip, content_type], [url, archive_zip, opts] do
        Tempfile.stub :new, archive_zip, [['inspec-dl-', '.tar.gz']] do
          File.stub :rename, nil, ['/path/to/zip-archive.tar.gz', '/path/to/zip-archive.zip'] do
            Inspec::Targets::ZipHelper.stub :new, ziphelper do
              File.stub :unlink, nil, ['/path/to/zip-archive.zip'] do
                helper.resolve_zip(url, {}).must_equal('zip-content')
              end
            end
          end
        end
      end
    end
  end
end
