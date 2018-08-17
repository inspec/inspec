# This file is not required by default.

require 'singleton'

module Inspec::Plugin::V2
  # Handles all actions modifying the user's plugin set:
  # * Modifying the plugins.json file
  # * Installing, updating, and removing gem-based plugins
  # Loading plugins is handled by Loader.
  # Listing plugins is handled by Loader.
  # Searching for plugins is handled by ???
  class Installer
    include Singleton

    def gem_path
      Inspec::Plugin::V2::Loader.plugin_gem_path
    end

    # Installs a plugin. Defaults to assuming the plugin provided is a gem, and will try to install
    # from whatever gemsources `rubygems` thinks it should use.
    # If it's a gem, installs it and its dependencies to the `gem_path`. The gem is not activated.
    # If it's a path, leaves it in place.
    # Finally, updates the plugins.json file with the new information.
    # No attempt is made to load the plugin.
    #
    # @param [String] plugin_name
    # @param [Hash] opts The installation options
    # @option opts [String] :gem_file Path to a local gem file to install from
    # @option opts [String] :path Path to a file to be used as the entry point for a path-based plugin
    def install(plugin_name, opts = {})
      validate_installation_opts(plugin_name, opts)
    end

    private

    def validate_installation_opts(plugin_name, opts)
      unless plugin_name =~ /^(inspec|train)-/
        raise InstallError.new("All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to install #{plugin_name}")
      end
    end
  end
end