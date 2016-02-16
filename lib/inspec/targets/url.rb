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
  class UrlHelper < DirsResolver
    # by default, this url helper only handles http or https urls with
    # tar.gz or zip endings
    def self.handles?(target)
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

    def self.from_target(target, opts = {})
      find_archive_helper(target, opts)
    end

    # override default post resolve
    def self.post_resolve(resolver, res, _target)
      # removes an file as post hook
      File.unlink(resolver.target) if File.exist?(resolver.target)
      res
    end

    # download url into archive using opts,
    # returns File object and content-type from HTTP headers
    def self.download_archive(url, archive, opts)
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
    def self.find_archive_helper(url, opts = {})
      archive, content_type = download_archive(url, Tempfile.new(['inspec-dl-', '.tar.gz']), opts)
      # replace extension with zip if we detected a zip content type
      if ['application/x-zip-compressed', 'application/zip'].include?(content_type)
        # rename file for proper detection in DirHelper
        pn = Pathname.new(archive.path)
        new_path = pn.dirname.join(pn.basename.to_s.gsub('tar.gz', 'zip'))
        File.rename(pn.to_s, new_path.to_s)
        r = ZipHelper.new(new_path)
      elsif ['application/x-gzip', 'application/gzip'].include?(content_type)
        # use tar helper as default (otherwise returns nil)
        r = TarHelper.new(archive.path)
      end
      r
    end

    def to_s
      'URL Loader'
    end
  end

  Inspec::Targets.add_module('url', UrlHelper)
end
