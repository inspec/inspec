# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  # API Implementation does not hold any state by itself,
  # everything will be stored in local Configuration store
  class API # rubocop:disable Metrics/ClassLength
    # saves the api token supplied by the user
    def self.api_token(url, refresh_token, verify, user, insecure)
      config = Compliance::Configuration.new
      config['server'] = url
      config['refresh_token'] = refresh_token
      config['user'] = user
      config['insecure'] = insecure
      config['version'] = version(url, insecure)

      if !verify
        config.store
        success = true
        msg = 'token stored'
      else
        url = "#{server}/login"
        success, msg, access_token = Compliance::API.post_refresh_token(url, refresh_token, insecure)
        if success
          config['token'] = access_token
          config.store
          msg = 'token verified and stored'
        end
      end

      [success, msg]
    end

    def self.access_token(server, token, insecure, api_path)
      config = Compliance::Configuration.new
      config['server'] = server + api_path
      config['insecure'] = insecure
      config['token'] = token
      config.store

      [true, 'access token stored']
    end

    def self.login(insecure)
      config = Compliance::Configuration.new
      if config['refresh_token'].nil?
        puts 'No API token stored, please run `inspec compliance token` first'
        exit 1
      end

      url = "#{config['server']}/login"
      success, msg, access_token = Compliance::API.post_refresh_token(url, config['refresh_token'], insecure)
      config['token'] = access_token
      config.store

      [success, msg]
    end

    def self.legacy_login(server, username, password, insecure, apipath)
      config = Compliance::Configuration.new
      config['server'] = "#{server}#{apipath}"
      url = "#{config['server']}/oauth/token"

      success, data = Compliance::API.legacy_login_post(url, username, password, insecure)
      if !data.nil?
        tokendata = JSON.parse(data)
        if tokendata['access_token']
          config['user'] = username
          config['token'] = tokendata['access_token']
          config['insecure'] = insecure
          config.store
          success = true
          msg = 'Successfully authenticated'
        else
          msg = 'Reponse does not include a token'
        end
      else
        msg = "Authentication failed for Server: #{url}"
      end
      [success, msg]
    end

    def self.logout
      config = Compliance::Configuration.new
      config.destroy
    end

    def self.legacy_logout
      config = Compliance::Configuration.new
      url = "#{config['server']}/logout"
      Compliance::API.post(url, config['token'], config['insecure'], !config.supported?(:oidc))
      config.destroy
    end

    # return the server api version
    # NB this method does not use Compliance::Configuration to allow for using
    # it before we know the version (e.g. oidc or not)
    def self.version(url, insecure)
      url = "#{url}/version"

      _success, data = Compliance::API.get(url, nil, insecure)
      if !data.nil?
        JSON.parse(data)
      else
        {}
      end
    end

    # return all compliance profiles available for the user
    def self.profiles
      config = Compliance::Configuration.new
      url = "#{config['server']}/user/compliance"
      _success, data = get(url, config['token'], config['insecure'], !config.supported?(:oidc))

      if !data.nil?
        profiles = JSON.parse(data)
        # iterate over profiles
        profiles.map do |owner, ps|
          ps.keys.map do |name|
            { org: owner, name: name }
          end
        end.flatten
      else
        []
      end
    end

    # verifies that a profile
    def self.exist?(profile)
      profiles = Compliance::API.profiles
      if !profiles.empty?
        index = profiles.index { |p| "#{p[:org]}/#{p[:name]}" == profile }
        !index.nil? && index >= 0
      else
        false
      end
    end

    def self.get(url, token, insecure, legacy = false)
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path)

      return send_request(uri, req, insecure) if token.nil?

      if legacy
        req.basic_auth(token, '')
      else
        req['Authorization'] = "Bearer #{token}"
      end

      send_request(uri, req, insecure)
    end

    def self.post_refresh_token(url, token, insecure)
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      req['Authorization'] = "Bearer #{token}"
      req.body = { token: token }.to_json

      access_token = ''
      success, data = send_request(uri, req, insecure)
      if !data.nil?
        begin
          tokendata = JSON.parse(data)
          access_token = tokendata['access_token']
          msg = 'successfully fetched access token'
          success = true
        rescue JSON::ParserError => e
          success = false
          msg = e.message
        end
      else
        success = false
        msg = 'invalid response'
      end

      [success, msg, access_token]
    end

    def self.post(url, token, insecure, legacy = false)
      # form request
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      if legacy
        req.basic_auth token, ''
      else
        req['Authorization'] = "Bearer #{token}"
      end
      req.form_data={}

      send_request(uri, req, insecure)
    end

    def self.legacy_login_post(url, username, password, insecure)
      # form request
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      req.basic_auth(username, password)
      req.form_data={}

      send_request(uri, req, insecure)
    end

    # upload a file
    def self.post_file(url, token, file_path, insecure, legacy = false)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)

      # set connection flags
      http.use_ssl = (uri.scheme == 'https')
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if insecure

      req = Net::HTTP::Post.new(uri.path)
      if legacy
        req.basic_auth token, ''
      else
        req['Authorization'] = "Bearer #{token}"
      end

      req.body_stream=File.open(file_path, 'rb')
      req.add_field('Content-Length', File.size(file_path))
      req.add_field('Content-Type', 'application/x-gtar')

      boundary = 'INSPEC-PROFILE-UPLOAD'
      req.add_field('session', boundary)
      res=http.request(req)

      [res.is_a?(Net::HTTPSuccess), res.body]
    end

    def self.send_request(uri, req, insecure)
      opts = {
        use_ssl: uri.scheme == 'https',
      }
      opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE if insecure

      res = Net::HTTP.start(uri.host, uri.port, opts) {|http|
        http.request(req)
      }
      [res.is_a?(Net::HTTPSuccess), res.body]
    end
  end
end
