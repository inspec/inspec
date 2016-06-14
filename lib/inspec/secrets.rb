# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'inspec/plugins'
require 'utils/plugin_registry'

module Inspec
  SecretsBackend = PluginRegistry.new

  def self.secrets(version)
    if version != 1
      fail 'Only secrets version 1 is supported!'
    end
    Inspec::Plugins::Secret
  end
end

require 'inspec/secrets/yaml'
