# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'
require 'inspec/fetcher'
require 'fetchers/url'

# InSpec Target Helper for Supermarket
module Supermarket
  class Fetcher < Inspec.fetcher(1)
    name 'supermarket'
    priority 500

    def self.resolve(target, opts = {})
      supermarket_uri, supermarket_server = if target.is_a?(String) && URI(target).scheme == 'supermarket'
                                              [target, Supermarket::API::SUPERMARKET_URL]
                                            elsif target.respond_to?(:key?) && target.key?(:supermarket)
                                              supermarket_server = target[:supermarket_url] || Supermarket::API::SUPERMARKET_URL
                                              ["supermarket://#{target[:supermarket]}", supermarket_server]
                                            end
      return nil unless supermarket_uri
      return nil unless Supermarket::API.exist?(supermarket_uri, supermarket_server)
      tool_info = Supermarket::API.find(supermarket_uri, supermarket_server)
      resolve_next(tool_info['tool_source_url'], opts)
    rescue URI::Error
      nil
    end

    def to_s
      'Chef Compliance Profile Loader'
    end
  end
end
