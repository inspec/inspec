# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  class ServerConfigurationMissing < StandardError
  end

  # API Implementation does not hold any state by itself,
  # everything will be stored in local Configuration store
  class API # rubocop:disable Metrics/ClassLength
    # return all compliance profiles available for the user
    def self.profiles(config)
      # Chef Compliance
      if is_compliance_server?(config)
        url = "#{config['server']}/user/compliance"
      # Chef Automate
      elsif is_automate_server?(config)
        url = "#{config['server']}/profiles/#{config['user']}"
      else
        raise ServerConfigurationMissing
      end

      headers = get_headers(config)
      response = Compliance::HTTP.get(url, headers, config['insecure'])
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
        else
          owner_id = config['user']
          mapped_profiles = profiles.map { |e|
            e['owner_id'] = owner_id
            e
          }
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
      response = Compliance::HTTP.get(url+'/version', headers, insecure)
      return {} if response.code == '404'

      data = response.body
      return {} if data.nil? || data.empty?

      parsed = JSON.parse(data)
      return {} unless parsed.key?('version') && !parsed['version'].empty?

      parsed
    end

    # verifies that a profile
    def self.exist?(config, profile)
      _msg, profiles = Compliance::API.profiles(config)
      owner, id, ver = profile_split(profile)
      if !profiles.empty?
        profiles.any? do |p|
          p['owner_id'] == owner &&
            p['name'] == id &&
            (ver == nil || p['version'] == ver)
        end
      else
        false
      end
    end

    def self.upload(config, owner, profile_name, archive_path)
      # Chef Compliance
      if is_compliance_server?(config)
        url = "#{config['server']}/owners/#{owner}/compliance/#{profile_name}/tar"
      # Chef Automate pre 0.8.0
      elsif is_automate_server_pre_080?(config)
        url = "#{config['server']}/#{config['user']}"
      # Chef Automate
      else
        url = "#{config['server']}/profiles/#{config['user']}"
      end

      headers = get_headers(config)
      res = Compliance::HTTP.post_file(url, headers, archive_path, config['insecure'])
      [res.is_a?(Net::HTTPSuccess), res.body]
    end

    # Use username and refresh_token to get an API access token
    def self.get_token_via_refresh_token(url, refresh_token, insecure)
      uri = URI.parse("#{url}/login")
      req = Net::HTTP::Post.new(uri.path)
      req.body = { token: refresh_token }.to_json
      access_token = nil
      response = Compliance::HTTP.send_request(uri, req, insecure)
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
      response = Compliance::HTTP.send_request(uri, req, insecure)
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
      if is_automate_server?(config)
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
      if is_automate_server?(config)
        owner, id, ver = profile_split(profile)
        if ver.nil?
          target = "#{config['server']}/profiles/#{owner}/#{id}/tar"
        else
          target = "#{config['server']}/profiles/#{owner}/#{id}/version/#{ver}/tar"
        end
      else
        owner, id, ver = profile_split(profile)
        target = "#{config['server']}/owners/#{owner}/compliance/#{id}/tar"
      end
      target
    end

    def self.profile_split(profile)
      owner, id = profile.split('/')
      id, version = id.split('#')
      return owner, id, version
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
  end
end
