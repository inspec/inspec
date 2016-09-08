# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/plugins'
require 'utils/plugin_registry'

module Inspec
  Fetcher = PluginRegistry.new

  def self.fetcher(version)
    if version != 1
      fail 'Only fetcher version 1 is supported!'
    end
    Inspec::Plugins::Fetcher
  end
end

require 'fetchers/local'
require 'fetchers/url'
require 'fetchers/git'
