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
      return false unless %{ http https }.include? uri.scheme
      true
    rescue URI::Error => _e
      false
    end

    def resolve(target, opts = {})
      # support for github url
      m = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}.match(target)
      if m
        url = "https://github.com/#{m[:user]}/#{m[:repo]}/archive/master.tar.gz"
      else
        url = target
      end
      resolve_archive(url, opts)
    end

    private

    # download url into archive using opts,
    # returns File object and content-type from HTTP headers
    def download_archive(url, opts)
      remote = open(
        url,
        http_basic_authentication: [opts['user'] || '', opts['password'] || ''],
      )

      content_type = remote.meta['content-type']

      # map for file types
      filetypes = {
        'application/x-zip-compressed' => 'tar.gz',
        'application/zip' => 'tar.gz',
        'application/x-gzip' => 'zip',
        'application/gzip' => 'zip',
      }

      # ensure we have a file extension
      file_type = filetypes[content_type] unless content_type.nil?

      # fall back to tar
      if file_type.nil?
        warn "Could not determine file type for content type #{content_type}"
        file_type = 'tar.gz'
      end

      # download content
      archive = Tempfile.new(['inspec-dl-', file_type])
      archive.binmode
      archive.write(remote.read)
      archive.rewind
      archive.close

      [archive, content_type]
    end

    def resolve_archive_path(archive_helper, path, opts)
      # this should not happen, catch it in case we have an internal error:
      unless archive_helper.handles?(path)
        throw RuntimeError, "Failed to load downloaded archive in #{path} with "\
              "#{archive_helper}. Internal error, please file a bugreport."
      end

      archive_helper.resolve(path, opts)
    end

    def resolve_archive(url, opts)
      archive, content_type = download_archive(url, opts)

      # replace extension with zip if we detected a zip content type
      case content_type
      when 'application/x-zip-compressed', 'application/zip'
        resolve_archive_path(ZipHelper, archive.path, opts)
      when 'application/x-gzip', 'application/gzip'
        resolve_archive_path(TarHelper, archive.path, opts)
      when nil
        {}
      else
        throw RuntimeError, "Failed to resolve URL target, its metadata did not match ZIP or TAR: #{content_type}"
      end
    end

    def to_s
      'URL Loader'
    end
  end

  Inspec::Targets.add_module('url', UrlHelper.new)
end
