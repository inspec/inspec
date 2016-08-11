# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'
require 'inspec/fetcher'
require 'fetchers/url'

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module Compliance
  class Fetcher < Fetchers::Url
    name 'compliance'
    priority 500

    def self.resolve(target, _opts = {})
      return nil unless target.is_a?(String)
      # check for local scheme compliance://
      uri = URI(target)
      return nil unless URI(uri).scheme == 'compliance'

      # check if we have a compliance token
      config = Compliance::Configuration.new
      return nil if config['token'].nil?

      # verifies that the target e.g base/ssh exists
      profile = uri.host + uri.path
      Compliance::API.exist?(config, profile)
      super(target_url(config, profile), config)
    rescue URI::Error => _e
      nil
    end

    def self.target_url(config, profile)
      owner, id = profile.split('/')
      "#{config['server']}/owners/#{owner}/compliance/#{id}/tar"
    end

    def to_s
      'Chef Compliance Profile Loader'
    end
  end
end
