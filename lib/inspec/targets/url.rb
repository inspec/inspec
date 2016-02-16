# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'tempfile'
require 'open-uri'
require 'inspec/targets/zip'

module Inspec::Targets

  # This URL helper is able to download a tar.gz or zip from remote endpoint
  # and executes it locally.
  # It is implemented as a wrapper method around the TarHelper and ZipHelper
  class UrlHelper

    # by default, this url helper only handles http or https urls with
    # tar.gz or zip endings
    def handles?(target)
      uri = URI.parse(target)
      return false if uri.nil? or uri.scheme.nil?
      # abort if the target does not start with http or https
      return false unless %{ http https }.include? uri.scheme
      # abort if the url does not end with .tar.gz or .zip
      return false unless target.end_with?('tar.gz', 'zip')
      true
    rescue URI::Error => _e
      false
    end

    def from_target(target, opts = {})
      find_archive_helper(target, opts)
    end

    # this resolves a target, eg. directory or tarball
    def resolve(target, opts)
      r = from_target(target, opts)
      handler = r.handler
      files = r.files

      res = []
      {
        test:     __collect(handler, :get_filenames, files),
        library:  __collect(handler, :get_libraries, files),
        metadata: __collect(handler, :get_metadata, files),
      }.each do |as, list|
        Array(list).each { |path|
          res.push(r.resolve(path, as: as))
        }
      end

      # TODO, we need some pre- and post-hooks
      delete_tmp_archive

      res
    end

    def __collect(handler, getter, files)
      return [] unless handler.respond_to? getter
      handler.method(getter).call(files)
    end

    private

    # download url into archive using opts,
    # returns File object and content-type from HTTP headers
    def download_archive(url, archive, opts)
      archive.binmode
      remote = open(
        url,
        http_basic_authentication: [opts['user'] || '', opts['password'] || ''],
      )

      # download content
      archive.write(remote.read)
      archive.rewind
      archive.close

      [archive, remote.meta['content-type']]
    end

    # selects the ZIP or TAR helper, based on the mime-type
    def find_archive_helper(url, opts = {})
      archive, content_type = download_archive(url, Tempfile.new(['inspec-dl-', '.tar.gz']), opts)
      # replace extension with zip if we detected a zip content type
      if ['application/x-zip-compressed', 'application/zip'].include?(content_type)
        # rename file for proper detection in DirHelper
        pn = Pathname.new(archive.path)
        new_path = pn.dirname.join(pn.basename.to_s.gsub('tar.gz', 'zip'))
        File.rename(pn.to_s, new_path.to_s)
        r = ZipHelper.new(new_path)
        @unlink_path = new_path
      elsif ['application/x-gzip', 'application/gzip'].include?(content_type)
        # use tar helper as default (otherwise returns nil)
        r = TarHelper.new(archive.path)
        @unlink_path = archive.path
      end
      r
    end

    # removes an file
    def delete_tmp_archive
      File.unlink(@unlink_path) if File.exist?(@unlink_path)
    end

    def to_s
      'URL Loader'
    end
  end

  Inspec::Targets.add_module('url', UrlHelper.new)
end
