# This file is not required by default.

require 'singleton'

# Gem extensions for unpacking local .gem files - not loaded by Gem default
require "rubygems/package"
require "rubygems/name_tuple"

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

      if opts[:path]
        install_from_path(plugin_name, opts)
      elsif opts[:gem_file]
        install_from_gem_file(plugin_name, opts)
      else
        install_from_remote_gems(plugin_name, opts)
      end

      # update_plugin_config_file(plugin_name, opts)
    end

    private

    def validate_installation_opts(plugin_name, opts)
      unless plugin_name =~ /^(inspec|train)-/
        raise InstallError.new("All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to install #{plugin_name}")
      end

      if opts[:gem_file]
        unless opts[:gem_file].end_with?('.gem')
          raise InstallError.new("When installing from a local gem file, gem file must have '.gem' extension - saw #{opts[:gem_file]}")
        end
        unless File.exist?(opts[:gem_file])
          raise InstallError.new("Could not find local gem file to install - #{opts[:gem_file]}")
        end
      end
    end

    def install_from_gem_file(requested_plugin_name, opts)
      plugin_dependency = Gem::Dependency.new(requested_plugin_name, '> 0') # TODO: version pinning

      our_gemspecs = Dir.glob(File.join(gem_path, 'specifications', '*.gemspec')).map {|p| Gem::Specification.load(p) }
      installed_plugins_gem_set = Gem::Resolver::VendorSet.new
      our_gemspecs.each { |spec| installed_plugins_gem_set.add_vendor_gem(spec.name, spec.gem_dir) }

      plugin_local_source = Gem::Source::SpecificFile.new(opts[:gem_file]) # PECULIAR_TO_LOCAL_GEMFILE
      requested_local_gem_set = Gem::Resolver::InstallerSet.new(:both) # TODO: what does :both mean? # PECULIAR_TO_LOCAL_GEMFILE
      requested_local_gem_set.add_local(plugin_dependency.name, plugin_local_source.spec, plugin_local_source) # PECULIAR_TO_LOCAL_GEMFILE

      resolver_source_sets = Gem::Resolver.compose_sets(
        requested_local_gem_set,       # Any extra places to look for gems # PECULIAR_TO_LOCAL_GEMFILE
        installed_plugins_gem_set,     # The gems that are in the plugin gem path directory tree
        Gem::Resolver::CurrentSet.new, # The gems that are already included either with Ruby or with the InSpec install
      )

      request_set = Gem::RequestSet.new(plugin_dependency)
      solution = request_set.resolve(resolver_source_sets)  # TODO: error handling (e.g. impossible constraint)
      # solution.each { |act_req| act_req.full_spec.activate} # TODO: Notify bundler

      # Ignore deps here, because any needed deps should already be baked into plugin_dependency
      request_set.install_into(gem_path, true, ignore_dependencies: true)
    end
  end
end