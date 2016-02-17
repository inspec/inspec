# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'uri'

# InSpec Target Helper for Supermarket
module Supermarket
  class SupermarketHelper < Inspec::Targets::UrlHelper
    def self.handles?(profile)
      # check for local scheme supermarket://
      return unless URI(profile).scheme == 'supermarket'

      # verifies that the target e.g base/ssh exists
      Supermarket::API.exist?(profile)
    rescue URI::Error => _e
      false
    end

    # generates proper url
    def self.resolve(profile, opts = {})
      tool_info = Supermarket::API.find(profile)

      # support for default github url in supermarket
      target = tool_info['tool_source_url']
      m = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}.match(target)
      target = "https://github.com/#{m[:user]}/#{m[:repo]}/archive/master.tar.gz" if m

      super(target, opts)
    end

    def to_s
      'Chef Supermarket Profile Loader'
    end
  end

  Inspec::Targets.add_module('supermarket', Supermarket::SupermarketHelper)
end
