# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module Compliance
  class ChefComplianceHelper < Inspec::Targets::UrlHelper
    def self.handles?(target)
      # check for local scheme compliance://
      uri = URI(target)
      return unless URI(uri).scheme == 'compliance'

      # check if we have a compliance token
      config = Compliance::Configuration.new
      return if config['token'].nil?

      # get profile name
      profile = get_profile_name(uri)

      # verifies that the target e.g base/ssh exists
      Compliance::API.exist?(profile)
    rescue URI::Error => _e
      false
    end

    # generates proper url
    def self.resolve(target, opts = {})
      profile = get_profile_name(URI(target))
      # generates server url
      target = build_target_url(profile)
      config = Compliance::Configuration.new
      opts['user'] = config['token']
      puts target
      super(target, opts)
    end

    # extracts profile name from url
    def self.get_profile_name(uri)
      uri.host + uri.path
    end

    def self.build_target_url(target)
      owner, profile = target.split('/')
      config = Compliance::Configuration.new
      url = "#{config['server']}/owners/%owner_name%/compliance/%profile_name%/tar"
            .gsub('%owner_name%', owner)
            .gsub('%profile_name%', profile)
      url
    end

    def to_s
      'Chef Compliance Profile Loader'
    end
  end

  Inspec::Targets.add_module('chefcompliance', ChefComplianceHelper)
end
