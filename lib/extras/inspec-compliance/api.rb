# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  # API Implementation does not hold any state by itself,
  # everything will be stored in local Configuration store
  class API
    # logs into the server, retrieves a token and stores it locally
    def self.login(server, username, password)
      config = Compliance::Configuration.new
      config['server'] = server
      url = "#{server}/oauth/token"

      success, data = Compliance::API.post(url, username, password)
      if !data.nil?
        tokendata = JSON.parse(data)
        if tokendata['access_token']
          config['user'] = username
          config['token'] = tokendata['access_token']
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
      url = "#{config['server']}/logout"
      Compliance::API.post(url, config['token'], nil)
      config.destroy
    end

    # return the server api version
    def self.version
      config = Compliance::Configuration.new
      url = "#{config['server']}/version"

      _success, data = Compliance::API.get(url, nil, nil)
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
      get(url, config['token'], '')

      if !data.nil?
        profiles = JSON.parse(data)
        val = []
        # iterate over profiles
        profiles.each_key { |org|
          profiles[org].each_key { |name|
            val.push({ org: org, name: name })
          }
        }
        val
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

    def self.get(url, username, password)
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path)
      req.basic_auth username, password

      send_request(uri, req)
    end

    def self.post(url, username, password)
      # form request
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      req.basic_auth username, password
      req.form_data={}

      send_request(uri, req)
    end

    # upload a file
    def self.post_file(url, username, password, file_path)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(uri.path)
      req.basic_auth username, password

      req.body_stream=File.open(file_path)
      req['Content-Type'] = 'multipart/form-data'
      req.add_field('Content-Length', File.size(file_path))
      req.add_field('Content-Type', 'application/x-gtar')

      boundary = 'INSPEC-PROFILE-UPLOAD'
      req.add_field('session', boundary)
      res=http.request(req)

      [res.is_a?(Net::HTTPSuccess), res.body]
    end

    def self.send_request(uri, req)
      # send request
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') {|http|
        http.request(req)
      }
      [res.is_a?(Net::HTTPSuccess), res.body]
    end
  end
end
