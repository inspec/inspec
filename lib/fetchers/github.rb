# encoding: utf-8
# author: Steven Danna
require 'uri'
require 'octokit'
require 'inspec/log'

module Fetchers
  class Github < Inspec.fetcher(1)
    class BadGithubUrl < StandardError; end

    name 'github'

    def self.resolve(target, opts = {})
      return nil unless target.is_a?(String)
      uri = URI.parse(target)
      if !uri.nil? && uri.scheme == 'github'
        r = new(uri, opts)
        resolve_next(r.expanded_target, r)
      end
    rescue URI::Error
      nil
    end

    def initialize(target, _opts = {})
      @resolved_github_url = to_github_url(target)
    end

    def expanded_target
      @resolved_github_url
    end

    def to_github_url(uri)
      organization = uri.host
      # uri.path will always start with "/" so the first element is empty
      _e, repository, *rest = uri.path.split('/')

      ensure_repository_exists!(organization, repository)

      if rest.empty?
        type = 'branch'
        spec = 'master'
      else
        type = rest[0]
        spec = rest[1]
      end

      ref = case type
            when 'branch'
              branch_to_ref(organization, repository, spec)
            when 'tag'
              tag_to_ref(organization, repository, spec)
            when 'ref'
              spec
            else
              fail BadGithubUrl, "Unknown reference type: #{type}"
            end

      r = "https://github.com/#{organization}/#{repository}/archive/#{ref}.tar.gz"
      Inspec::Log.debug("Resolved to #{uri} to #{r}")
      r
    end

    def ensure_repository_exists!(organization, repository)
      Octokit.repo("#{organization}/#{repository}")
    rescue Octokit::NotFound
      raise "Repository #{organization}/#{repository} not found via the GitHub API"
    end

    def branch_to_ref(organization, repository, branch_name)
      Octokit.branch("#{organization}/#{repository}", branch_name)[:commit][:sha]
    rescue Octokit::NotFound
      raise "Could not find branch #{branch_name} for #{organization}/#{repository} via GitHub API"
    end

    def tag_to_ref(organization, repository, tag_name)
      # The Octokit#tag method always returns a 404 in my testing, even with known-to-exist tags
      tag = Octokit.tags("#{organization}/#{repository}").find { |t| t[:name] == tag_name }
      if tag.nil?
        fail "Could not find tag #{tag_name} for #{organization}/#{repository} via GitHub API"
      else
        tag[:commit][:sha]
      end
    end
  end
end
