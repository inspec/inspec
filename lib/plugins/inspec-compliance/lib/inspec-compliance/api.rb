require "net/http" unless defined?(Net::HTTP)
require "uri" unless defined?(URI)
require "json" unless defined?(JSON)
require "inspec/dist"

require_relative "api/login"
require_relative "configuration"
require_relative "http"
require_relative "target"
require_relative "support"

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
      def self.profiles(config, profile_filter = nil) # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
        owner = config["owner"] || config["user"]
        url = "#{config["server"]}/compliance/profiles/search"

        headers = get_headers(config)
        if profile_filter
          _owner, id, ver = profile_split(profile_filter)
        else
          id, ver = nil
        end

        body = { owner: owner, name: id }.to_json
        response = InspecPlugins::Compliance::HTTP.post_with_headers(url, headers, body, config["insecure"])

        data = response.body
        response_code = response.code
        case response_code
        when "200"
          msg = "success"
          profiles = JSON.parse(data)
          # iterate over profiles

          mapped_profiles = []
          profiles["profiles"].each do |p|
            mapped_profiles << p
          end

          # filter by name and version if they were specified in profile_filter
          mapped_profiles.select! do |p|
            (!ver || p["version"] == ver) && (!id || p["name"] == id)
          end
          [msg, mapped_profiles]
        when "401"
          msg = "401 Unauthorized. Please check your token."
          [msg, []]
        else
          msg = "An unexpected error occurred (HTTP #{response_code}): #{response.message}"
          [msg, []]
        end
      end

      # return the server api version
      # NB this method does not use Compliance::Configuration to allow for using
      # it before we know the version (e.g. oidc or not)
      def self.version(config)
        url = config["server"]
        insecure = config["insecure"]

        raise ServerConfigurationMissing if url.nil?

        headers = get_headers(config)
        response = InspecPlugins::Compliance::HTTP.get(url + "/version", headers, insecure)
        return {} if response.code == "404"

        data = response.body
        return {} if data.nil? || data.empty?

        parsed = JSON.parse(data)
        return {} unless parsed.key?("version") && !parsed["version"].empty?

        parsed
      end

      # verifies that a profile exists
      def self.exist?(config, profile)
        _msg, profiles = InspecPlugins::Compliance::API.profiles(config, profile)
        !profiles.empty?
      end

      def self.upload(config, owner, profile_name, archive_path)
        url = "#{config["server"]}/compliance/profiles?owner=#{owner}"
        headers = get_headers(config)
        res = InspecPlugins::Compliance::HTTP.post_multipart_file(url, headers, archive_path, config["insecure"])
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
        if response.code == "200"
          begin
            tokendata = JSON.parse(data)
            access_token = tokendata["access_token"]
            msg = "Successfully fetched API access token"
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

      # Use API access token to validate login using version API
      def self.authenticate_login_using_version_api(url, api_token, insecure)
        uri = URI.parse("#{url}/version")
        req = Net::HTTP::Get.new(uri.path)
        req["api-token"] = api_token
        response = InspecPlugins::Compliance::HTTP.send_request(uri, req, insecure)

        if response.code == "200"
          msg = "Successfully Logged In"
          success = true
        else
          success = false
          msg = "Failed to authenticate to #{url} \n\Response code: #{response.code}\nBody: #{response.body}"
        end
        [success, msg]
      end

      # Use username and password to get an API access token
      def self.get_token_via_password(url, username, password, insecure)
        uri = URI.parse("#{url}/login")
        req = Net::HTTP::Post.new(uri.path)
        req.body = { userid: username, password: password }.to_json
        access_token = nil
        response = InspecPlugins::Compliance::HTTP.send_request(uri, req, insecure)
        data = response.body
        if response.code == "200"
          access_token = data
          msg = "Successfully fetched an API access token valid for 12 hours"
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
        headers = { "chef-delivery-enterprise" => config["automate"]["ent"] }
        if config["automate"]["token_type"] == "dctoken"
          headers["x-data-collector-token"] = token
        else
          headers["chef-delivery-user"] = config["user"]
          headers["chef-delivery-token"] = token
        end
        headers
      end

      def self.get_token(config)
        return config["token"] unless config["refresh_token"]

        _success, _msg, token = get_token_via_refresh_token(config["server"], config["refresh_token"], config["insecure"])
        token
      end

      def self.target_url(config, profile)
        "#{config["server"]}/compliance/profiles/tar"
      end

      def self.profile_split(profile)
        owner, id = profile.split("/")
        id, version = id.split("#")
        [owner, id, version]
      end

      # returns a parsed url for `admin/profile` or `compliance://admin/profile`
      def self.sanitize_profile_name(profile)
        if URI(profile).scheme == "compliance"
          uri = URI(profile)
        else
          uri = URI("compliance://#{profile}")
        end
        uri.to_s.sub(%r{^compliance:\/\/}, "")
      end

      def self.server_version_from_config(config)
        # Automate versions 0.8.x and later will have a "version" key in the config
        # that looks like: "version":{"api":"compliance","version":"0.8.24"}
        return nil unless config.key?("version")
        return nil unless config["version"].is_a?(Hash)

        config["version"]["version"]
      end
    end
  end
end
