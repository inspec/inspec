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
    def self.resolve(target) # rubocop:disable PerceivedComplexity, Metrics/CyclomaticComplexity
      uri = if target.is_a?(String) && URI(target).scheme == 'compliance'
              URI(target)
            elsif target.respond_to?(:key?) && target.key?(:compliance)
              URI("compliance://#{target[:compliance]}")
            end

      return nil if uri.nil?

      # we have detailed information available in our lockfile, no need to ask the server
      if target.respond_to?(:key?) && target.key?(:url)
        profile_fetch_url = target[:url]
        config = {}
      else
        # check if we have a compliance token
        config = Compliance::Configuration.new
        if config['token'].nil? && config['refresh_token'].nil?
          if config['server_type'] == 'automate'
            server = 'automate'
            msg = 'inspec compliance login_automate https://your_automate_server --user USER --ent ENT --dctoken DCTOKEN or --usertoken USERTOKEN'
          else
            server = 'compliance'
            msg = "inspec compliance login https://your_compliance_server --user admin --insecure --token 'PASTE TOKEN HERE' "
          end
          raise Inspec::FetcherFailure, <<EOF

Cannot fetch #{uri} because your #{server} token has not been
configured.

Please login using

    #{msg}
EOF
        end

        # verifies that the target e.g base/ssh exists
        profile = Compliance::API.sanitize_profile_name(uri)
        if !Compliance::API.exist?(config, profile)
          raise Inspec::FetcherFailure, "The compliance profile #{profile} was not found on the configured compliance server"
        end
        profile_fetch_url = Compliance::API.target_url(config, profile)
      end
      # We need to pass the token to the fetcher
      config['token'] = Compliance::API.get_token(config)
      new(profile_fetch_url, config)
    rescue URI::Error => _e
      nil
    end

    # We want to save compliance: in the lockfile rather than url: to
    # make sure we go back through the Compliance API handling.
    def resolved_source
      @resolved_source ||= {
        compliance: compliance_profile_name,
        url: @target,
        sha256: sha256,
      }
    end

    def to_s
      'Chef Compliance Profile Loader'
    end

    private

    # determine the owner_id and the profile name from the url
    def compliance_profile_name
      m = if Compliance::API.is_automate_server_pre_080?(@config)
            %r{^#{@config['server']}/(?<owner>[^/]+)/(?<id>[^/]+)/tar$}
          elsif Compliance::API.is_automate_server_080_and_later?(@config)
            %r{^#{@config['server']}/profiles/(?<owner>[^/]+)/(?<id>[^/]+)/tar$}
          else
            %r{^#{@config['server']}/owners/(?<owner>[^/]+)/compliance/(?<id>[^/]+)/tar$}
          end.match(@target)
      "#{m[:owner]}/#{m[:id]}"
    end
  end
end
