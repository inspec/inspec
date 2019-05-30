require 'net/http'
require 'uri'
require 'json'
require 'inspec/dist'

require_relative 'api/login'
require_relative 'configuration'
require_relative 'http'
require_relative 'target'
require_relative 'support'

module InspecPlugins
  module Compliance
    class ServerConfigurationMissing < StandardError; end

    # API Implementation does not hold any state by itself,
    # everything will be stored in local Configuration store
    class API
      include Inspec::Dist
      extend InspecPlugins::Compliance::API::Login

      # return all compliance profiles available for the user
      # the user is either specified in the options hash or by default
      # the username of the account is used that is logged in
      def self.profiles(config, profile_filter = nil) # rubocop:disable PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
        owner = config['owner'] || config['user']

        # Chef Compliance
        if is_compliance_server?(config)
          url = "#{config['server']}/user/compliance"
        # Chef Automate2
        elsif is_automate2_server?(config)
          url = "#{config['server']}/compliance/profiles/search"
        # Chef Automate
        elsif is_automate_server?(config)
          url = "#{config['server']}/profiles/#{owner}"
        else
          raise ServerConfigurationMissing
        end

        headers = get_headers(config)
        if profile_filter
          _owner, id, ver = profile_split(profile_filter)
        else
          id, ver = nil
        end

        if is_automate2_server?(config)
          body = { owner: owner, name: id }.to_json
          response = InspecPlugins::Compliance::HTTP.post_with_headers(url, headers, body, config['insecure'])
        else
          response = InspecPlugins::Compliance::HTTP.get(url, headers, config['insecure'])
        end
        data = response.body
        response_code = response.code
        case response_code
        when '200'
          msg = 'success'
          profiles = JSON.parse(data)
          # iterate over profiles
          if is_compliance_server?(config)
            mapped_profiles = []
            profiles.values.each { |org|
              mapped_profiles += org.values
            }
          # Chef Automate pre 0.8.0
          elsif is_automate_server_pre_080?(config)
            mapped_profiles = profiles.values.flatten
          elsif is_automate2_server?(config)
            mapped_profiles = []
            profiles['profiles'].each { |p|
              mapped_profiles << p
            }
          else
            mapped_profiles = profiles.map { |e|
              e['owner_id'] = owner
              e
            }
          end
          # filter by name and version if they were specified in profile_filter
          mapped_profiles.select! do |p|
            (!ver || p['version'] == ver) && (!id || p['name'] == id)
          end
          return msg, mapped_profiles
        when '401'
          msg = '401 Unauthorized. Please check your token.'
          return msg, []
        else
          msg = "An unexpected error occurred (HTTP #{response_code}): #{response.message}"
          return msg, []
        end
      end

      # return the server api version
      # NB this method does not use Compliance::Configuration to allow for using
      # it before we know the version (e.g. oidc or not)
      def self.version(config)
        url = config['server']
        insecure = config['insecure']

        raise ServerConfigurationMissing if url.nil?

        headers = get_headers(config)
        response = InspecPlugins::Compliance::HTTP.get(url+'/version', headers, insecure)
        return {} if response.code == '404'

        data = response.body
        return {} if data.nil? || data.empty?

        parsed = JSON.parse(data)
        return {} unless parsed.key?('version') && !parsed['version'].empty?

        parsed
      end

      # verifies that a profile exists
      def self.exist?(config, profile)
        _msg, profiles = InspecPlugins::Compliance::API.profiles(config, profile)
        !profiles.empty?
      end

      def self.upload(config, owner, profile_name, archive_path)
        # Chef Compliance
        if is_compliance_server?(config)
          url = "#{config['server']}/owners/#{owner}/compliance/#{profile_name}/tar"
        # Chef Automate pre 0.8.0
        elsif is_automate_server_pre_080?(config)
          url = "#{config['server']}/#{owner}"
        elsif is_automate2_server?(config)
          url = "#{config['server']}/compliance/profiles?owner=#{owner}"
        # Chef Automate
        else
          url = "#{config['server']}/profiles/#{owner}"
        end

        headers = get_headers(config)
        if is_automate2_server?(config)
          res = InspecPlugins::Compliance::HTTP.post_multipart_file(url, headers, archive_path, config['insecure'])
        else
          res = InspecPlugins::Compliance::HTTP.post_file(url, headers, archive_path, config['insecure'])
        end

        [res.is_a?(Net::HTTPSuccess), res.body]
      end

      # Use username and refresh_token to get an API access token
      def self.get_token_via_refresh_token(url, refresh_token, insecure)
        uri = URI.parse("#{url}/login")
        req = Net::HTTP::Post.new(uri.path)
        req.body = { token: refresh_token }.to_json
        access_token = nil
        response = InspecPlugins::Compliance::HTTP.send_request(uri, req, insecure)
        data = response.body
        if response.code == '200'
          begin
            tokendata = JSON.parse(data)
            access_token = tokendata['access_token']
            msg = 'Successfully fetched API access token'
            success = true
          rescue JSON::ParserError => e
            success = false
            msg = e.message
          end
        else
          success = false
          msg = "Failed to authenticate to #{url} \n\
    Response code: #{response.code}\n  Body: #{response.body}"
        end

        [success, msg, access_token]
      end

      # Use username and password to get an API access token
      def self.get_token_via_password(url, username, password, insecure)
        uri = URI.parse("#{url}/login")
        req = Net::HTTP::Post.new(uri.path)
        req.body = { userid: username, password: password }.to_json
        access_token = nil
        response = InspecPlugins::Compliance::HTTP.send_request(uri, req, insecure)
        data = response.body
        if response.code == '200'
          access_token = data
          msg = 'Successfully fetched an API access token valid for 12 hours'
          success = true
        else
          success = false
          msg = "Failed to authenticate to #{url} \n\
    Response code: #{response.code}\n  Body: #{response.body}"
        end

        [success, msg, access_token]
      end

      def self.get_headers(config)
        token = get_token(config)
        if is_automate_server?(config) || is_automate2_server?(config)
          headers = { 'chef-delivery-enterprise' => config['automate']['ent'] }
          if config['automate']['token_type'] == 'dctoken'
            headers['x-data-collector-token'] = token
          else
            headers['chef-delivery-user'] = config['user']
            headers['chef-delivery-token'] = token
          end
        else
          headers = { 'Authorization' => "Bearer #{token}" }
        end
        headers
      end

      def self.get_token(config)
        return config['token'] unless config['refresh_token']
        _success, _msg, token = get_token_via_refresh_token(config['server'], config['refresh_token'], config['insecure'])
        token
      end

      def self.target_url(config, profile)
        owner, id, ver = profile_split(profile)

        return "#{config['server']}/compliance/profiles/tar" if is_automate2_server?(config)
        return "#{config['server']}/owners/#{owner}/compliance/#{id}/tar" unless is_automate_server?(config)

        if ver.nil?
          "#{config['server']}/profiles/#{owner}/#{id}/tar"
        else
          "#{config['server']}/profiles/#{owner}/#{id}/version/#{ver}/tar"
        end
      end

      def self.profile_split(profile)
        owner, id = profile.split('/')
        id, version = id.split('#')
        [owner, id, version]
      end

      # returns a parsed url for `admin/profile` or `compliance://admin/profile`
      def self.sanitize_profile_name(profile)
        if URI(profile).scheme == 'compliance'
          uri = URI(profile)
        else
          uri = URI("compliance://#{profile}")
        end
        uri.to_s.sub(%r{^compliance:\/\/}, '')
      end

      def self.is_compliance_server?(config)
        config['server_type'] == 'compliance'
      end

      def self.is_automate_server_pre_080?(config)
        # Automate versions before 0.8.x do not have a valid version in the config
        return false unless config['server_type'] == 'automate'
        server_version_from_config(config).nil?
      end

      def self.is_automate_server_080_and_later?(config)
        # Automate versions 0.8.x and later will have a "version" key in the config
        # that is properly parsed out via server_version_from_config below
        return false unless config['server_type'] == 'automate'
        !server_version_from_config(config).nil?
      end

      def self.is_automate2_server?(config)
        config['server_type'] == 'automate2'
      end

      def self.is_automate_server?(config)
        config['server_type'] == 'automate'
      end

      def self.server_version_from_config(config)
        # Automate versions 0.8.x and later will have a "version" key in the config
        # that looks like: "version":{"api":"compliance","version":"0.8.24"}
        return nil unless config.key?('version')
        return nil unless config['version'].is_a?(Hash)
        config['version']['version']
      end

      def self.determine_server_type(url, insecure)
        if target_is_automate2_server?(url, insecure)
          :automate2
        elsif target_is_automate_server?(url, insecure)
          :automate
        elsif target_is_compliance_server?(url, insecure)
          :compliance
        else
          Inspec::Log.debug('Could not determine server type using known endpoints')
          nil
        end
      end

      def self.target_is_automate2_server?(url, insecure)
        automate_endpoint = '/dex/auth'
        response = InspecPlugins::Compliance::HTTP.get(url + automate_endpoint, nil, insecure)
        if response.code == '400'
          Inspec::Log.debug(
            "Received 400 from #{url}#{automate_endpoint} - " \
            "assuming target is a #{AUTOMATE_PRODUCT_NAME}2 instance",
          )
          true
        else
          false
        end
      end

      def self.target_is_automate_server?(url, insecure)
        automate_endpoint = '/compliance/version'
        response = InspecPlugins::Compliance::HTTP.get(url + automate_endpoint, nil, insecure)
        case response.code
        when '401'
          Inspec::Log.debug(
            "Received 401 from #{url}#{automate_endpoint} - " \
            "assuming target is a #{AUTOMATE_PRODUCT_NAME} instance",
          )
          true
        when '200'
          # Chef Automate currently returns 401 for `/compliance/version` but some
          # versions of OpsWorks Chef Automate return 200 and a Chef Manage page
          # when unauthenticated requests are received.
          if response.body.include?("Are You Looking For the #{SERVER_PRODUCT_NAME}?")
            Inspec::Log.debug(
              "Received 200 from #{url}#{automate_endpoint} - " \
              "assuming target is an #{AUTOMATE_PRODUCT_NAME} instance",
            )
            true
          else
            Inspec::Log.debug(
              "Received 200 from #{url}#{automate_endpoint} " \
              'but did not receive the Chef Manage page - ' \
              "assuming target is not a #{AUTOMATE_PRODUCT_NAME} instance",
            )
            false
          end
        else
          Inspec::Log.debug(
            "Received unexpected status code #{response.code} " \
            "from #{url}#{automate_endpoint} - " \
            "assuming target is not a #{AUTOMATE_PRODUCT_NAME} instance",
          )
          false
        end
      end

      def self.target_is_compliance_server?(url, insecure)
        # All versions of Chef Compliance return 200 for `/api/version`
        compliance_endpoint = '/api/version'

        response = InspecPlugins::Compliance::HTTP.get(url + compliance_endpoint, nil, insecure)
        return false unless response.code == '200'

        Inspec::Log.debug(
          "Received 200 from #{url}#{compliance_endpoint} - " \
          "assuming target is a #{COMPLIANCE_PRODUCT_NAME} server",
        )
        true
      end
    end
  end
end
