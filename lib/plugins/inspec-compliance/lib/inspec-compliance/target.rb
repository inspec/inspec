require 'uri'
require 'inspec/fetcher'
require 'inspec/errors'
require 'inspec/dist'

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module InspecPlugins
  module Compliance
    class Fetcher < Fetchers::Url
      include Inspec::Dist

      name 'compliance'
      priority 500
      attr_reader :upstream_sha256

      def initialize(target, opts)
        super(target, opts)
        @upstream_sha256 = ''
        if target.is_a?(Hash) && target.key?(:url)
          @target = target[:url]
          @upstream_sha256 = target[:sha256]
        elsif target.is_a?(String)
          @target = target
        end
      end

      def sha256
        upstream_sha256.empty? ? super : upstream_sha256
      end

      def self.check_compliance_token(uri, config)
        if config['token'].nil? && config['refresh_token'].nil?
          if config['server_type'] == 'automate'
            server = 'automate'
            msg = "#{EXEC_NAME} compliance login https://your_automate_server --user USER --ent ENT --dctoken DCTOKEN or --token USERTOKEN"
          elsif config['server_type'] == 'automate2'
            server = 'automate2'
            msg = "#{EXEC_NAME} compliance login https://your_automate2_server --user USER --token APITOKEN"
          else
            server = 'compliance'
            msg = "#{EXEC_NAME} compliance login https://your_compliance_server --user admin --insecure --token 'PASTE TOKEN HERE' "
          end
          raise Inspec::FetcherFailure, <<~EOF

            Cannot fetch #{uri} because your #{server} token has not been
            configured.

            Please login using

                #{msg}
          EOF
        end
      end

      def self.get_target_uri(target)
        if target.is_a?(String) && URI(target).scheme == 'compliance'
          URI(target)
        elsif target.respond_to?(:key?) && target.key?(:compliance)
          URI("compliance://#{target[:compliance]}")
        end
      end

      def self.resolve(target)
        uri = get_target_uri(target)
        return nil if uri.nil?

        config = InspecPlugins::Compliance::Configuration.new
        profile = InspecPlugins::Compliance::API.sanitize_profile_name(uri)
        profile_fetch_url = InspecPlugins::Compliance::API.target_url(config, profile)
        # we have detailed information available in our lockfile, no need to ask the server
        if target.respond_to?(:key?) && target.key?(:sha256)
          profile_checksum = target[:sha256]
        else
          check_compliance_token(uri, config)
          # verifies that the target e.g base/ssh exists
          # Call profiles directly instead of exist? to capture the results
          # so we can access the upstream sha256 from the results.
          _msg, profile_result = InspecPlugins::Compliance::API.profiles(config, profile)
          if profile_result.empty?
            raise Inspec::FetcherFailure, "The compliance profile #{profile} was not found on the configured compliance server"
          else
            # Guarantee sorting by verison and grab the latest.
            # If version was specified, it will be the first and only result.
            # Note we are calling the sha256 as a string, not a symbol since
            # it was returned as json from the Compliance API.
            profile_info = profile_result.sort_by { |x| Gem::Version.new(x['version']) }[0]
            profile_checksum = profile_info.key?('sha256') ? profile_info['sha256'] : ''
          end
        end
        # We need to pass the token to the fetcher
        config['token'] = InspecPlugins::Compliance::API.get_token(config)

        # Needed for automate2 post request
        profile_stub = profile || target[:compliance]
        config['profile'] = InspecPlugins::Compliance::API.profile_split(profile_stub)

        new({ url: profile_fetch_url, sha256: profile_checksum }, config)
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
        "#{COMPLIANCE_PRODUCT_NAME} Profile Loader"
      end

      private

      # determine the owner_id and the profile name from the url
      def compliance_profile_name
        m = if InspecPlugins::Compliance::API.is_automate_server_pre_080?(@config)
              %r{^#{@config['server']}/(?<owner>[^/]+)/(?<id>[^/]+)/tar$}
            elsif InspecPlugins::Compliance::API.is_automate_server_080_and_later?(@config)
              %r{^#{@config['server']}/profiles/(?<owner>[^/]+)/(?<id>[^/]+)/tar$}
            else
              %r{^#{@config['server']}/owners/(?<owner>[^/]+)/compliance/(?<id>[^/]+)/tar$}
            end.match(@target)

        if InspecPlugins::Compliance::API.is_automate2_server?(@config)
          m = {}
          m[:owner] = @config['profile'][0]
          m[:id] = @config['profile'][1]
        end

        raise 'Unable to determine compliance profile name. This can be caused by ' \
          'an incorrect server in your configuration. Try to login to compliance ' \
          "via the `#{EXEC_NAME} compliance login` command." if m.nil?

        "#{m[:owner]}/#{m[:id]}"
      end
    end
  end
end
