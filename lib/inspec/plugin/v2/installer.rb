# This file is not required by default.

require 'singleton'

# Gem extensions for unpacking local .gem files - not loaded by Gem default
require 'rubygems/package'
require 'rubygems/name_tuple'

module Inspec::Plugin::V2
  # Handles all actions modifying the user's plugin set:
  # * Modifying the plugins.json file
  # * Installing, updating, and removing gem-based plugins
  # Loading plugins is handled by Loader.
  # Listing plugins is handled by Loader.
  # Searching for plugins is handled by ???
  class Installer
    include Singleton

    Gem.configuration['verbose'] = false

    def gem_path
      Inspec::Plugin::V2::Loader.plugin_gem_path
    end

    def plugin_conf_file_path
      Inspec::Plugin::V2::Loader.plugin_conf_file_path
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
    # @option opts [String] :version Version constraint for remote gem installs
    def install(plugin_name, opts = {})
      # TODO: - check plugins.json for validity before trying anything that needs to modify it.
      validate_installation_opts(plugin_name, opts)

      if opts[:path]
        install_from_path(plugin_name, opts)
      elsif opts[:gem_file]
        install_from_gem_file(plugin_name, opts)
      else
        install_from_remote_gems(plugin_name, opts)
      end

      update_plugin_config_file(plugin_name, opts.merge({ action: :install }))
    end

    private

    # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    # rationale for rubocop exemption: While ther are many conditionals, they are all of the same form;
    # its goal is to check for several subtle combinations of params, and rais an error if needed. It's
    # straightforward to understand, but has to handle many cases.
    def validate_installation_opts(plugin_name, opts)
      unless plugin_name =~ /^(inspec|train)-/
        raise InstallError, "All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to install #{plugin_name}"
      end

      if opts.key?(:gem_file) && opts.key?(:path)
        raise InstallError, 'May not specify both gem_file and a path (for installing from source)'
      end

      if opts.key?(:version) && (opts.key?(:gem_file) || opts.key?(:path))
        raise InstallError, 'May not specify a version when installing from a gem file or source path'
      end

      if opts.key?(:gem_file)
        unless opts[:gem_file].end_with?('.gem')
          raise InstallError, "When installing from a local gem file, gem file must have '.gem' extension - saw #{opts[:gem_file]}"
        end
        unless File.exist?(opts[:gem_file])
          raise InstallError, "Could not find local gem file to install - #{opts[:gem_file]}"
        end
      elsif opts.key?(:path)
        unless Dir.exist?(opts[:path])
          raise InstallError, "Could not find directory for install from source path - #{opts[:path]}"
        end
      end
    end
    # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    def install_from_path(requested_plugin_name, opts)
      # Nothing to do here; we will later update the plugins file with the path.
    end

    def install_from_gem_file(requested_plugin_name, opts)
      plugin_dependency = Gem::Dependency.new(requested_plugin_name)

      # Make Set that encompasses just the gemfile that was provided
      plugin_local_source = Gem::Source::SpecificFile.new(opts[:gem_file])
      requested_local_gem_set = Gem::Resolver::InstallerSet.new(:both) # :both means local and remote; allow satisfying our gemfile's deps from rubygems.org
      requested_local_gem_set.add_local(plugin_dependency.name, plugin_local_source.spec, plugin_local_source)

      install_gem_to_plugins_dir(plugin_dependency, [requested_local_gem_set])
    end

    def install_from_remote_gems(requested_plugin_name, opts)
      opts[:version] ||= '> 0'
      plugin_dependency = Gem::Dependency.new(requested_plugin_name, opts[:version])
      # BestSet is rubygems.org API + indexing
      install_gem_to_plugins_dir(plugin_dependency, [Gem::Resolver::BestSet.new])
    end

    def install_gem_to_plugins_dir(new_plugin_dependency, extra_request_sets = [])
      # Make a Set of all the gems we already have in the plugin area
      installed_plugins_gem_set = Gem::Resolver::VendorSet.new
      Dir.glob(File.join(gem_path, 'specifications', '*.gemspec')).map { |p| Gem::Specification.load(p) }.each do |spec|
        installed_plugins_gem_set.add_vendor_gem(spec.name, spec.gem_dir)
      end

      # Combine the Sets, so the resolver has one composite place to look
      resolver_source_sets = Gem::Resolver.compose_sets(
        installed_plugins_gem_set,     # The gems that are in the plugin gem path directory tree
        Gem::Resolver::CurrentSet.new, # The gems that are already included either with Ruby or with the InSpec install
        *extra_request_sets,           # Anything else our caller wanted to include
      )

      # Solve the dependency (that is, find a way to install the new plugin and anything it needs)
      request_set = Gem::RequestSet.new(new_plugin_dependency)
      begin
        request_set.resolve(resolver_source_sets)
      rescue Gem::UnsatisfiableDependencyError => gem_ex
        # TODO: use search facility to determine if the requested gem exists at all, vs if the constraints are impossible
        ex = Inspec::Plugin::V2::InstallError.new(gem_ex.message)
        ex.plugin_name = new_plugin_dependency.name
        raise ex
      end

      # OK, perform the installation.
      # Ignore deps here, because any needed deps should already be baked into new_plugin_dependency
      request_set.install_into(gem_path, true, ignore_dependencies: true)
    end

    def update_plugin_config_file(plugin_name, opts)
      config = read_or_init_config_data
      config['plugins'].delete_if { |entry| entry[plugin_name == 'name'] }
      entry = { 'name' => plugin_name }

      entry['version'] = opts[:version] if opts.key?(:version)

      if opts.key?(:path)
        entry['installation_type'] = 'path'
        entry['installation_path'] = opts[:path]
      end

      config['plugins'] << entry
      File.write(plugin_conf_file_path, JSON.pretty_generate(config))
    end

    # TODO: - DRY this up
    # TODO - check for validity
    def read_or_init_config_data
      if File.exist?(plugin_conf_file_path)
        JSON.parse(File.read(plugin_conf_file_path))
      else
        {
          'plugins_config_version' => '1.0.0',
          'plugins' => [],
        }
      end
    end
  end
end
