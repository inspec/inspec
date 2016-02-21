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
      uri = URI.parse(target)
      return nil if uri.nil? or uri.scheme.nil?
      return nil unless %{ http https }.include? uri.scheme
      target = transform(target)
      # TODO: for now, this can be much less strict now vv
      return nil unless target.end_with?('tar.gz', 'zip')
      resolve_url(target, opts)
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
    def self.download_archive(url, opts)
      remote = open(
        url,
        http_basic_authentication: [opts['user'] || '', opts['password'] || ''],
      )

      content_type = remote.meta['content-type']
      file_type = MIME_TYPES[content_type]

      # fall back to tar
      if file_type.nil?
        warn "Could not determine file type for content type #{content_type}."\
             'Defaulting to .tar.gz'
        file_type = 'tar.gz'
      end

      # download content
      archive = Tempfile.new(['inspec-dl-', file_type])
      archive.binmode
      archive.write(remote.read)
      archive.rewind
      archive.close
      archive
    end

    def self.resolve_url(url, opts)
      archive = download_archive(url, opts)
      # TODO: At the moment we hand over the Tempfile object. This is necessary,
      # since otherwise Ruby will delete the file on disk(!!) as soon as
      # this call is finished (due to garbage-collection of Tempfile).
      # Resolve this by handling over the intermediate resolver to the next.
      resolve_next(archive)
    end
  end
end
