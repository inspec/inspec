require 'inspec/errors'

module Inspec
  module Plugin
    module V2
      class Exception < Inspec::Error; end
      class ConfigError < Inspec::Plugin::V2::Exception; end
      class LoadError < Inspec::Plugin::V2::Exception; end
    end
  end
end

require_relative 'v2/registry'
require_relative 'v2/loader'
require_relative 'v2/plugin_base'

# Load all plugin type base classes
Dir.glob(File.join(__dir__, 'v2', 'plugin_types', '*.rb')).each { |file| require file }

module Inspec
  # Provides the base class that plugin implementors should use.
  def self.plugin(version, plugin_type = nil)
    unless version == 2
      raise 'Only plugins version 2 is supported!'
    end

    return Inspec::Plugin::V2::PluginBase if plugin_type.nil?
    Inspec::Plugin::V2::PluginBase.base_class_for_type(plugin_type)
  end
end
