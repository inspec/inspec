require "inspec/errors"

module Inspec
  module Plugin
    module V2
      class Exception < Inspec::Error; end
      class ConfigError < Inspec::Plugin::V2::Exception; end
      class LoadError < Inspec::Plugin::V2::Exception; end
      class GemActionError < Inspec::Plugin::V2::Exception
        attr_accessor :plugin_name
        attr_accessor :version
      end
      class InstallError < Inspec::Plugin::V2::GemActionError; end
      class PluginExcludedError < Inspec::Plugin::V2::InstallError
        attr_accessor :details
      end
      class UpdateError < Inspec::Plugin::V2::GemActionError
        attr_accessor :from_version, :to_version
      end
      class UnInstallError < Inspec::Plugin::V2::GemActionError; end
      class SearchError < Inspec::Plugin::V2::GemActionError; end
    end
  end
end

require "inspec/globals"
require "inspec/plugin/v2/config_file"
require "inspec/plugin/v2/registry"
require "inspec/plugin/v2/loader"
require "inspec/plugin/v2/plugin_base"

# Load all plugin type base classes
Dir.glob(File.join(__dir__, "v2", "plugin_types", "*.rb")).each { |file| require file }

module Inspec
  # Provides the base class that plugin implementors should use.
  def self.plugin(version, plugin_type = nil)
    unless version == 2
      raise "Only plugins version 2 is supported!"
    end

    return Inspec::Plugin::V2::PluginBase if plugin_type.nil?

    Inspec::Plugin::V2::PluginBase.base_class_for_type(plugin_type)
  end
end
