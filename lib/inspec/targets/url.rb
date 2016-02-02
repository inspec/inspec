# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'tempfile'
require 'open-uri'
require 'inspec/targets/zip'

module Inspec::Targets
  class UrlHelper
    def handles?(target)
      uri = URI.parse(target)
      return false if uri.nil? or uri.scheme.nil?
      %{ http https }.include? uri.scheme
    rescue URI::Error => e
      false
    end

    def resolve(target, opts = {})
      # abort if the target does not start with http or https
      return nil unless target.start_with?('https://', 'http://')

      # support for github url
      m = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}.match(target)
      if m
        url = "https://github.com/#{m[:user]}/#{m[:repo]}/archive/master.tar.gz"
      else
        url = target
      end
      resolve_archive(url, opts)
    end

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

    def resolve_archive(url, opts)
      archive, content_type = download_archive(url, Tempfile.new(['inspec-dl-', '.tar.gz']), opts)

      # replace extension with zip if we detected a zip content type
      if ['application/x-zip-compressed', 'application/zip'].include?(content_type)
        # rename file for proper detection in DirHelper
        pn = Pathname.new(archive.path)
        new_path = pn.dirname.join(pn.basename.to_s.gsub('tar.gz', 'zip'))
        File.rename(pn.to_s, new_path.to_s)

        content = ZipHelper.new.resolve(new_path)
        File.unlink(new_path)
      elsif ['application/x-gzip', 'application/gzip'].include?(content_type)
        # use tar helper as default (otherwise returns nil)
        content = TarHelper.new.resolve(archive.path)
        archive.unlink
      end

      content
    end

    def to_s
      'URL Loader'
    end
  end

  Inspec::Targets.add_module('url', UrlHelper.new)
end
