# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'
require 'inspec/fetcher'
require 'inspec/errors'

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module Compliance
  class Fetcher < Fetchers::Url
    name 'compliance'
    priority 500
    def self.resolve(target) # rubocop:disable PerceivedComplexity
      uri = if target.is_a?(String) && URI(target).scheme == 'compliance'
              URI(target)
            elsif target.respond_to?(:key?) && target.key?(:compliance)
              URI("compliance://#{target[:compliance]}")
            end

      return nil if uri.nil?

      # check if we have a compliance token
      config = Compliance::Configuration.new
      if config['token'].nil?
        if config['automate'][0]
          server = 'automate'
          msg = 'inspec compliance automate https://your_automate_server --user USER --ent ENT --dctoken DCTOKEN or --usertoken USERTOKEN'
        else
          server = 'compliance'
          msg = "inspec compliance login https://your_compliance_server --user admin --insecure --token 'PASTE TOKEN HERE' "
        end
        fail Inspec::FetcherFailure, <<EOF

Cannot fetch #{uri} because your #{server} token has not been
configured.

Please login using

    #{msg}
EOF
      end

      # verifies that the target e.g base/ssh exists
      profile = uri.host + uri.path
      if !Compliance::API.exist?(config, profile)
        fail Inspec::FetcherFailure, "The compliance profile #{profile} was not found on the configured compliance server"
      end
      new(target_url(profile, config), config)
    rescue URI::Error => _e
      nil
    end

    def self.target_url(profile, config)
      if config['automate'][0]
        target = "#{config['server']}/#{profile}/tar"
      else
        owner, id = profile.split('/')
        target = "#{config['server']}/owners/#{owner}/compliance/#{id}/tar"
      end
      target
    end

    #
    # We want to save compliance: in the lockfile rather than url: to
    # make sure we go back through the ComplianceAPI handling.
    #
    def resolved_source
      { compliance: supermarket_profile_name }
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
