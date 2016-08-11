# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'tempfile'
require 'open-uri'

module Fetchers
  class Url < Inspec.fetcher(1)
    name 'url'
    priority 200

    attr_reader :files

    def self.resolve(target, opts = {})
      return nil unless target.is_a?(String)
      uri = URI.parse(target)
      return nil if uri.nil? or uri.scheme.nil?
      return nil unless %{ http https }.include? uri.scheme
      target = transform(target)
      # fetch this url and hand it off
      res = new(target, opts)
      resolve_next(res.archive.path, res)
    rescue URI::Error => _e
      nil
    end

    # Transforms a browser github url to github tar url
    # We distinguish between three different Github URL types:
    #  - Master URL
    #  - Branch URL
    #  - Commit URL
    #
    # master url:
    # https://github.com/nathenharvey/tmp_compliance_profile/ is transformed to
    # https://github.com/nathenharvey/tmp_compliance_profile/archive/master.tar.gz
    #
    # github branch:
    # https://github.com/hardening-io/tests-os-hardening/tree/2.0 is transformed to
    # https://github.com/hardening-io/tests-os-hardening/archive/2.0.tar.gz
    #
    # github commit:
    # https://github.com/hardening-io/tests-os-hardening/tree/48bd4388ddffde68badd83aefa654e7af3231876
    # is transformed to
    # https://github.com/hardening-io/tests-os-hardening/archive/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz
    def self.transform(target)
      # support for default github url
      m = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}.match(target)
      return "https://github.com/#{m[:user]}/#{m[:repo]}/archive/master.tar.gz" if m

      # support for branch and commit urls
      m = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)/tree/(?<commit>[\w\.]+)(/)?$}.match(target)
      return "https://github.com/#{m[:user]}/#{m[:repo]}/archive/#{m[:commit]}.tar.gz" if m

      # if we could not find a match, return the original value
      target
    end

    MIME_TYPES = {
      'application/x-zip-compressed' => '.zip',
      'application/zip' => '.zip',
      'application/x-gzip' => '.tar.gz',
      'application/gzip' => '.tar.gz',
    }.freeze

    # download url into archive using opts,
    # returns File object and content-type from HTTP headers
    def self.download_archive(url, opts = {})
      http_opts = {}
      # http_opts['http_basic_authentication'] = [opts['user'] || '', opts['password'] || ''] if opts['user']
      http_opts['ssl_verify_mode'.to_sym] = OpenSSL::SSL::VERIFY_NONE if opts['insecure']
      http_opts['Authorization'] = "Bearer #{opts['token']}" if opts['token']

      remote = open(
        url,
        http_opts,
      )

      content_type = remote.meta['content-type']
      file_type = MIME_TYPES[content_type] ||
                  throw(RuntimeError, 'Failed to resolve URL target, its '\
                  "metadata did not match ZIP or TAR: #{content_type}")

      # fall back to tar
      if file_type.nil?
        fail "Could not determine file type for content type #{content_type}."
      end

      # download content
      archive = Tempfile.new(['inspec-dl-', file_type])
      archive.binmode
      archive.write(remote.read)
      archive.rewind
      archive.close
      archive
    end

    attr_reader :archive

    def initialize(url, opts)
      @target = url
      @archive = self.class.download_archive(url, opts)
    end
  end
end
