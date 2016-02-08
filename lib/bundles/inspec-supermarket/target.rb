# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'

# InSpec Target Helper for Supermarket
module Supermarket
  class SupermarketHelper < Inspec::Targets::UrlHelper
    def handles?(profile)
      # check for local scheme supermarket://
      return unless URI(profile).scheme == 'supermarket'

      # verifies that the target e.g base/ssh exists
      Supermarket::API.exist?(profile)
    rescue URI::Error => _e
      false
    end

    # generates proper url
    def resolve(profile, opts = {})
      tool_info = Supermarket::API.find(profile)
      super(tool_info['tool_source_url'], opts)
    end

    def to_s
      'Chef Compliance Profile Loader'
    end
  end

  Inspec::Targets.add_module('supermarket', Supermarket::SupermarketHelper.new)
end
