# This file is not required by default.

require 'singleton'
require 'forwardable'

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
    extend Forwardable


    Gem.configuration['verbose'] = false

    attr_reader :loader, :registry
    def_delegator :loader, :plugin_gem_path, :gem_path
    def_delegator :loader, :plugin_conf_file_path
    def_delegator :loader, :plugin_conf_file_path
    def_delegator :loader, :list_managed_gems
    def_delegator :loader, :list_installed_plugin_gems

    def initialize
      @loader = Inspec::Plugin::V2::Loader.new
      @registry = Inspec::Plugin::V2::Registry.instance
    end

    def plugin_installed?(name)
      list_installed_plugin_gems.detect {|spec| spec.name == name }
    end

    def plugin_version_installed?(name, version)
      list_installed_plugin_gems.detect {|spec| spec.name == name && spec.version == Gem::Version.new(version)}
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


    # Updates a plugin. Most options same as intall, but will not handle path installs.
    # If no :version is provided, updates to the latest.
    # If a version is provided, the plugin becomes pinned at that specified version.
    #
    # @param [String] plugin_name
    # @param [Hash] opts The installation options
    # @option opts [String] :gem_file Path to a local gem file to install from - NOT IMPLEMENTED
    # @option opts [String] :version Version constraint for remote gem updates
    def update(plugin_name, opts = {})
      # TODO: - check plugins.json for validity before trying anything that needs to modify it.
      validate_update_opts(plugin_name, opts)
      opts[:update_mode] = true

      # TODO: Handle installing from a local file
      # TODO: Perform dependency checks to make sure the new solution is valid
      install_from_remote_gems(plugin_name, opts)

      update_plugin_config_file(plugin_name, opts.merge({ action: :update }))
    end

    # Testing API.  Performs a hard reset on the installer and registry, and reloads the loader.
    # Not for public use.
    # TODO: bad timing coupling in tests
    def __reset
      registry.__reset
    end
    def __reset_loader
      @loader = Loader.new
    end


    private

    # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    # rationale for rubocop exemption: While there are many conditionals, they are all of the same form;
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

      if plugin_installed?(plugin_name)
        if opts.key?(:version) && plugin_version_installed?(plugin_name, opts[:version])
          raise InstallError, "#{plugin_name} version #{opts[:version]} is already installed."
        else
          raise InstallError, "#{plugin_name} is already installed. Use 'inspec plugin update' to change version."
        end
      end

    end
    # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    def validate_update_opts(plugin_name, opts)
      # Only update plugins we know about
      unless plugin_name =~ /^(inspec|train)-/
        raise UpdateError, "All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to update #{plugin_name}"
      end
      unless registry.known_plugin?(plugin_name.to_sym)
        raise UpdateError, "'#{plugin_name}' is not installed - use 'inspec plugin install' to install it"
      end

      # No local path support for update
      if registry[plugin_name.to_sym].installation_type == :path
        raise UpdateError, "'inspec plugin update' will not handle path-based plugins like '#{plugin_name}'. Use 'inspec plugin uninstall' to remove the reference, then install as a gem."
      end
      if opts.key?(:path)
        raise UpdateError, "'inspec plugin update' will not install from a path."
      end

      if opts.key?(:version) && plugin_version_installed?(plugin_name, opts[:version])
        raise UpdateError.new("#{plugin_name} version #{opts[:version]} is already installed.")
      end

    end

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
      plugin_dependency = Gem::Dependency.new(requested_plugin_name, opts[:version] || '> 0')
      # BestSet is rubygems.org API + indexing
      install_gem_to_plugins_dir(plugin_dependency, [Gem::Resolver::BestSet.new], opts[:update_mode])
    end

    def install_gem_to_plugins_dir(new_plugin_dependency, extra_request_sets = [], update_mode = false)
      # Make a Set of all the gems we already have in the plugin area
      installed_plugins_gem_set = Gem::Resolver::VendorSet.new
      Dir.glob(File.join(gem_path, 'specifications', '*.gemspec')).map { |p| Gem::Specification.load(p) }.each do |spec|
        next if update_mode && spec.name == new_plugin_dependency.name # If we're updating, pretend we don't already have the requested gem installed
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
      config['plugins'].delete_if { |entry| entry['name'] == plugin_name }
      entry = { 'name' => plugin_name }

      # Parsing by Requirement handles s lot of awkward formattoes
      entry['version'] = Gem::Requirement.new(opts[:version]).to_s if opts.key?(:version)

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
