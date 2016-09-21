# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'digest'
require 'tempfile'
require 'open-uri'

module Fetchers
  class Url < Inspec.fetcher(1)
    MIME_TYPES = {
      'application/x-zip-compressed' => '.zip',
      'application/zip' => '.zip',
      'application/x-gzip' => '.tar.gz',
      'application/gzip' => '.tar.gz',
    }.freeze

    name 'url'
    priority 200

    def self.resolve(target, opts = {})
      if target.is_a?(Hash) && target.key?(:url)
        resolve_from_string(target[:url], opts)
      elsif target.is_a?(String)
        resolve_from_string(target, opts)
      end
    end

    def self.resolve_from_string(target, opts)
      uri = URI.parse(target)
      return nil if uri.nil? or uri.scheme.nil?
      return nil unless %{ http https }.include? uri.scheme
      target = transform(target)
      new(target, opts)
    rescue URI::Error
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
    GITHUB_URL_REGEX = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}
    GITHUB_URL_WITH_TREE_REGEX = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)/tree/(?<commit>[\w\.]+)(/)?$}
    def self.transform(target)
      transformed_target = if m = GITHUB_URL_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             "https://github.com/#{m[:user]}/#{m[:repo]}/archive/master.tar.gz"
                           elsif m = GITHUB_URL_WITH_TREE_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             "https://github.com/#{m[:user]}/#{m[:repo]}/archive/#{m[:commit]}.tar.gz"
                           end

      if transformed_target
        Inspec::Log.warn("URL target #{target} transformed to #{transformed_target}. Consider using the git fetcher")
        transformed_target
      else
        target
      end
    end

    attr_reader :files, :archive_path

    def initialize(url, opts)
      @target = url
      @insecure = opts['insecure']
      @token = opts['token']
      @config = opts
    end

    def fetch(path)
      @archive_path ||= download_archive(path)
    end

    def sha256
      c = if @archive_path
            File.read(@archive_path)
          else
            content
          end
      Digest::SHA256.hexdigest c
    end

    def resolved_source
      @resolved_source ||= { url: @target, sha256: sha256 }
    end

    def cache_key
      sha256
    end

    def to_s
      @target
    end

    private

    def open_target
      Inspec::Log.debug("Fetching URL: #{@target}")
      http_opts = {}
      http_opts['ssl_verify_mode'.to_sym] = OpenSSL::SSL::VERIFY_NONE if @insecure
      http_opts['Authorization'] = "Bearer #{@token}" if @token
      open(@target, http_opts)
    end

    def content
      open_target.read
    end

    def file_type_from_remote(remote)
      content_type = remote.meta['content-type']
      file_type = MIME_TYPES[content_type]

      if file_type.nil?
        Inspec::Log.warn("Unrecognized content type: #{content_type}. Assuming tar.gz")
        file_type = '.tar.gz'
      end

      file_type
    end

    # download url into archive using opts,
    # returns File object and content-type from HTTP headers
    def download_archive(path)
      remote = open_target
      file_type = file_type_from_remote(remote)
      final_path = "#{path}#{file_type}"
      # download content
      archive = Tempfile.new(['inspec-dl-', file_type])
      archive.binmode
      archive.write(remote.read)
      archive.rewind
      archive.close
      FileUtils.mv(archive.path, final_path)
      Inspec::Log.debug("Fetched archive moved to: #{final_path}")
      final_path
    end
  end
end
