# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  # API Implementation does not hold any state by itself,
  # everything will be stored in local Configuration store
  class API # rubocop:disable Metrics/ClassLength
    # return all compliance profiles available for the user
    def self.profiles(config)
      config['automate'][0] ? url = "#{config['server']}/#{config['user']}" : url = "#{config['server']}/user/compliance"
      # TODO, api should not be dependent on .supported?
      response = Compliance::HTTP.get(url, config['token'], config['insecure'], config['user'], !config.supported?(:oidc), config['automate'], config['ent'])
      data = response.body
      response_code = response.code
      case response_code
      when '200'
        msg = 'success'
        profiles = JSON.parse(data)
        # iterate over profiles
        if config['automate'][0]
          mapped_profiles = profiles.map do |owner, ps|
            { org: ps['owner_id'], name: owner }
          end.flatten
        else
          mapped_profiles = profiles.map do |owner, ps|
            ps.keys.map do |name|
              { org: owner, name: name }
            end
          end.flatten
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
    def self.version(url, insecure)
      if url.nil?
        puts "
Server configuration information is missing.
Please login using `inspec compliance login https://compliance.test --user admin --insecure --token 'PASTE TOKEN HERE' `
"
      else
        response = Compliance::HTTP.get(url+'/version', nil, insecure)
        data = response.body
      end
      if !data.nil?
        JSON.parse(data)
      else
        {}
      end
    end

    # verifies that a profile
    def self.exist?(config, profile)
      _msg, profiles = Compliance::API.profiles(config)
      if !profiles.empty?
        index = profiles.index { |p| "#{p[:org]}/#{p[:name]}" == profile }
        !index.nil? && index >= 0
      else
        false
      end
    end

    def self.upload(config, owner, profile_name, archive_path)
      # upload the tar to Chef Compliance
      config['automate'][0] ? url = "#{config['server']}/#{config['user']}" : url = "#{config['server']}/owners/#{owner}/compliance/#{profile_name}/tar"
      res = Compliance::HTTP.post_file(url, config['token'], config['user'], archive_path, config['insecure'], !config.supported?(:oidc), config['automate'], config['ent'])
      [res.is_a?(Net::HTTPSuccess), res.body]
    end

    # Use username and refresh_toke to get an API access token
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
  end
end
