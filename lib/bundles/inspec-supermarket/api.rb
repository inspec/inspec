# encoding: utf-8
# frozen_string_literal: true
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'addressable/uri'

module Supermarket
  class API
    SUPERMARKET_URL = 'https://supermarket.chef.io'.freeze

    # displays a list of profiles
    def self.profiles(supermarket_url = SUPERMARKET_URL)
      url = "#{supermarket_url}/api/v1/tools-search"
      _success, data = get(url, { type: 'compliance_profile', items: 100 })
      if !data.nil?
        profiles = JSON.parse(data)
        profiles['items'].map { |x|
          m = %r{^#{supermarket_url}/api/v1/tools/(?<slug>[\w-]+)(/)?$}.match(x['tool'])
          x['slug'] = m[:slug]
          x
        }
      else
        []
      end
    end

    def self.profile_name(profile)
      # We use Addressable::URI here because URI has a bug in Ruby 2.1.x where it doesn't allow underscore in host
      uri = Addressable::URI.parse profile
      [uri.host, uri.path[1..-1]]
    rescue
      nil
    end

    # displays profile infos
    def self.info(profile, supermarket_url = SUPERMARKET_URL)
      _tool_owner, tool_name = profile_name("supermarket://#{profile}")
      return if tool_name.nil? || tool_name.empty?
      url = "#{supermarket_url}/api/v1/tools/#{tool_name}"
      _success, data = get(url, {})
      JSON.parse(data) if !data.nil?
    rescue JSON::ParserError
      nil
    end

    # compares a profile with the supermarket tool info
    def self.same?(profile, supermarket_tool, supermarket_url = SUPERMARKET_URL)
      tool_owner, tool_name = profile_name(profile)
      tool = "#{supermarket_url}/api/v1/tools/#{tool_name}"
      supermarket_tool['tool_owner'] == tool_owner && supermarket_tool['tool'] == tool
    end

    def self.find(profile, supermarket_url = SUPERMARKET_URL)
      profiles = Supermarket::API.profiles(supermarket_url)
      if !profiles.empty?
        index = profiles.index { |t| same?(profile, t, supermarket_url) }
        # return profile or nil
        profiles[index] if !index.nil? && index >= 0
      end
    end

    # verifies that a profile exists
    def self.exist?(profile, supermarket_url = SUPERMARKET_URL)
      !find(profile, supermarket_url).nil?
    end

    def self.get(url, params)
      uri = URI.parse(url)
      uri.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(uri)
      send_request(uri, req)
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
