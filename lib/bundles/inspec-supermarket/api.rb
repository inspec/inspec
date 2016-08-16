# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'

module Supermarket
  class API
    @config = { 'supermarket_url' => 'https://supermarket.chef.io' }

    def self.update_config(k, v)
      @config[k] = v
    end

    def self.config_key(k)
      @config[k]
    end

    # displays a list of profiles
    def self.profiles
      url = "#{@config['supermarket_url']}/api/v1/tools-search"
      _success, data = get(url, { q: 'compliance_profile' })
      if !data.nil?
        profiles = JSON.parse(data)
        profiles['items'].map { |x|
          m = %r{^#{@config['supermarket_url']}/api/v1/tools/(?<slug>[\w-]+)(/)?$}.match(x['tool'])
          x['slug'] = m[:slug]
          x
        }
      else
        []
      end
    end

    # displays profile infos
    def self.info(profile)
      _tool_owner, tool_name = profile.split('/').last(2)
      return if tool_name.nil? || tool_name.empty?
      url = "#{@config['supermarket_url']}/api/v1/tools/#{tool_name}"
      _success, data = get(url, {})
      JSON.parse(data) if !data.nil?
    rescue JSON::ParserError
      nil
    end

    # compares a profile with the supermarket tool info
    def self.same?(profile, supermarket_tool)
      tool_owner, tool_name = profile.split('/').last(2)
      tool = "#{@config['supermarket_url']}/api/v1/tools/#{tool_name}"
      supermarket_tool['tool_owner'] == tool_owner && supermarket_tool['tool'] == tool
    end

    def self.find(profile)
      profiles = Supermarket::API.profiles
      if !profiles.empty?
        index = profiles.index { |t| same?(profile, t) }
        # return profile or nil
        profiles[index] if !index.nil? && index >= 0
      end
    end

    # verifies that a profile exists
    def self.exist?(profile)
      !find(profile).nil?
    end

    def self.get(url, params)
      uri = URI.parse(url)
      uri.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(uri)
      send_request(uri, req)
    end

    def self.send_request(uri, req)
      # send request
      opts = { use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE }
      res = Net::HTTP.start(uri.host, uri.port, opts) {|http|
        http.request(req)
      }
      [res.is_a?(Net::HTTPSuccess), res.body]
    end
  end
end
