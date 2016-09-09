# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'
require 'inspec/fetcher'

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module Compliance
  class Fetcher < Fetchers::Url
    name 'compliance'
    priority 500

    def self.resolve(target)
      uri = if target.is_a?(String) && URI(target).scheme == 'compliance'
              URI(target)
            elsif target.respond_to?(:key?) && target.key?(:compliance)
              URI("compliance://#{target[:compliance]}")
            end

      return nil if uri.nil?

      # check if we have a compliance token
      config = Compliance::Configuration.new
      return nil if config['token'].nil?

      # verifies that the target e.g base/ssh exists
      profile = uri.host + uri.path
      Compliance::API.exist?(config, profile)
      new(target_url(profile, config), config)
    rescue URI::Error => _e
      nil
    end

    def self.target_url(profile, config)
      owner, id = profile.split('/')
      "#{config['server']}/owners/#{owner}/compliance/#{id}/tar"
    end

    #
    # We want to save supermarket: in the lockfile rather than url: to
    # make sure we go back through the ComplianceAPI handling.
    #
    def resolved_source
      { supermarket: supermarket_profile_name }
    end

    def to_s
      'Chef Compliance Profile Loader'
    end

    private

    def supermarket_profile_name
      m = %r{^#{@config['server']}/owners/(?<owner>[^/]+)/compliance/(?<id>[^/]+)/tar$}.match(@target)
      "#{m[:owner]}/#{m[:id]}"
    end
  end
end
