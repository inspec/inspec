# This file is not required by default.

require "singleton"
require "forwardable"
require "fileutils"

# Gem extensions for doing unusual things - not loaded by Gem default
require "rubygems/package"
require "rubygems/name_tuple"
require "rubygems/uninstaller"
require "rubygems/remote_fetcher"

require "inspec/plugin/v2/filter"

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

    Gem.configuration["verbose"] = false

    attr_reader :conf_file, :loader, :registry
    def_delegator :loader, :plugin_gem_path, :gem_path
    def_delegator :loader, :plugin_conf_file_path
    def_delegator :loader, :list_managed_gems
    def_delegator :loader, :list_installed_plugin_gems

    def initialize
      @loader = Inspec::Plugin::V2::Loader.new
      @registry = Inspec::Plugin::V2::Registry.instance
    end

    def plugin_installed?(name)
      list_installed_plugin_gems.detect { |spec| spec.name == name }
    end

    def plugin_version_installed?(name, version)
      list_installed_plugin_gems.detect { |spec| spec.name == name && spec.version == Gem::Version.new(version) }
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

      # TODO: return installed thingy
      if opts[:path]
        install_from_path(plugin_name, opts)
      elsif opts[:gem_file]
        gem_version = install_from_gem_file(plugin_name, opts)
        opts[:version] = gem_version.to_s
      else
        gem_version = install_from_remote_gems(plugin_name, opts)
        opts[:version] = gem_version.to_s
      end

      update_plugin_config_file(plugin_name, opts.merge({ action: :install }))
    end

    # Updates a plugin. Most options same as install, but will not handle path installs.
    # If no :version is provided, updates to the latest.
    # If a version is provided, the plugin becomes pinned at that specified version.
    #
    # @param [String] plugin_name
    # @param [Hash] opts The installation options
    # @option opts [String] :gem_file Reserved for future use.  No effect.
    # @option opts [String] :version Version constraint for remote gem updates
    def update(plugin_name, opts = {})
      # TODO: - check plugins.json for validity before trying anything that needs to modify it.
      validate_update_opts(plugin_name, opts)
      opts[:update_mode] = true

      # TODO: Handle installing from a local file
      # TODO: Perform dependency checks to make sure the new solution is valid
      gem_version = install_from_remote_gems(plugin_name, opts)

      update_plugin_config_file(plugin_name, opts.merge({ action: :update, version: gem_version.to_s }))
    end

    # Uninstalls (removes) a plugin. Refers to plugin.json to determine if it
    # was a gem-based or path-based install.
    # If it's a gem, uninstalls it, and all other unused plugins.
    # If it's a path, removes the reference from the plugins.json, but does not
    # tamper with the plugin source tree.
    # Either way, the plugins.json file is updated with the new information.
    #
    # @param [String] plugin_name
    # @param [Hash] opts The uninstallation options. Currently unused.
    def uninstall(plugin_name, opts = {})
      # TODO: - check plugins.json for validity before trying anything that needs to modify it.
      validate_uninstall_opts(plugin_name, opts)

      if registry.path_based_plugin?(plugin_name)
        uninstall_via_path(plugin_name, opts)
      else
        uninstall_via_gem(plugin_name, opts)
      end

      update_plugin_config_file(plugin_name, opts.merge({ action: :uninstall }))
    end

    # Search rubygems.org for a plugin gem.
    #
    # @param [String] plugin_seach_term
    # @param [Hash] opts Search options
    # @option opts [TrueClass, FalseClass] :exact If true, use plugin_search_term exactly.  If false (default), append a wildcard.
    # @option opts [Symbol] :scope Which versions to search for.  :released (default) - all released versions.  :prerelease - Also include versioned marked prerelease. :latest - only return one version, the latest one.
    # @return [Hash of Arrays] - Keys are String names of gems, arrays contain String versions.
    def search(plugin_query, opts = {}) # rubocop: disable Metrics/AbcSize
      validate_search_opts(plugin_query, opts)

      fetcher = Gem::SpecFetcher.fetcher
      matched_tuples = []
      if opts[:exact]
        matched_tuples = fetcher.detect(opts[:scope]) { |tuple| tuple.name == plugin_query }
      else
        regex = Regexp.new("^" + plugin_query + ".*")
        matched_tuples = fetcher.detect(opts[:scope]) do |tuple|
          tuple.name =~ regex && !Inspec::Plugin::V2::PluginFilter.exclude?(tuple.name)
        end
      end

      # sort tuples
      matched_tuples.sort! { |a, b| b.first.version <=> a.first.version }

      gem_info = {}
      matched_tuples.each do |tuple|
        gem_info[tuple.first.name] ||= []
        gem_info[tuple.first.name] << tuple.first.version.to_s
      end
      gem_info
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

    #===================================================================#
    #                       Validation Methods                          #
    #===================================================================#

    # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    # rationale for rubocop exemption: While there are many conditionals, they are all of the same form;
    # its goal is to check for several subtle combinations of params, and raise an error if needed. It's
    # straightforward to understand, but has to handle many cases.
    def validate_installation_opts(plugin_name, opts)
      unless plugin_name =~ /^(inspec|train)-/
        raise InstallError, "All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to install #{plugin_name}"
      end

      if opts.key?(:gem_file) && opts.key?(:path)
        raise InstallError, "May not specify both gem_file and a path (for installing from source)"
      end

      if opts.key?(:version) && (opts.key?(:gem_file) || opts.key?(:path))
        raise InstallError, "May not specify a version when installing from a gem file or source path"
      end

      if opts.key?(:gem_file)
        unless opts[:gem_file].end_with?(".gem")
          raise InstallError, "When installing from a local gem file, gem file must have '.gem' extension - saw #{opts[:gem_file]}"
        end
        unless File.exist?(opts[:gem_file])
          raise InstallError, "Could not find local gem file to install - #{opts[:gem_file]}"
        end
      elsif opts.key?(:path)
        unless File.exist?(opts[:path])
          raise InstallError, "Could not find path for install from source path - #{opts[:path]}"
        end
      end

      if plugin_installed?(plugin_name)
        if opts.key?(:version) && plugin_version_installed?(plugin_name, opts[:version])
          raise InstallError, "#{plugin_name} version #{opts[:version]} is already installed."
        else
          raise InstallError, "#{plugin_name} is already installed. Use 'inspec plugin update' to change version."
        end
      end

      reason = Inspec::Plugin::V2::PluginFilter.exclude?(plugin_name)
      if reason
        ex = PluginExcludedError.new("Refusing to install #{plugin_name}.  It is on the Plugin Exclusion List.  Rationale: #{reason.rationale}")
        ex.details = reason
        raise ex
      end
    end
    # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize

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
        raise UpdateError, "#{plugin_name} version #{opts[:version]} is already installed."
      end
    end

    def validate_uninstall_opts(plugin_name, _opts)
      # Only uninstall plugins we know about
      unless plugin_name =~ /^(inspec|train)-/
        raise UnInstallError, "All inspec plugins must begin with either 'inspec-' or 'train-' - refusing to uninstall #{plugin_name}"
      end
      unless registry.known_plugin?(plugin_name.to_sym)
        raise UnInstallError, "'#{plugin_name}' is not installed, refusing to uninstall."
      end
    end

    def validate_search_opts(search_term, opts)
      unless search_term =~ /^(inspec|train)-/
        raise SearchError, "All inspec plugins must begin with either 'inspec-' or 'train-'."
      end

      opts[:scope] ||= :released
      unless %i{prerelease released latest}.include?(opts[:scope])
        raise SearchError, "Search scope for listing versons must be :prerelease, :released, or :latest."
      end
    end

    #===================================================================#
    #                   Install / Upgrade Methods                       #
    #===================================================================#

    def install_from_path(requested_plugin_name, opts)
      # Nothing to do here; we will later update the plugins file with the path.
    end

    def install_from_gem_file(requested_plugin_name, opts)
      # Make Set that encompasses just the gemfile that was provided
      plugin_local_source = Gem::Source::SpecificFile.new(opts[:gem_file])

      plugin_dependency = Gem::Dependency.new(requested_plugin_name,
        plugin_local_source.spec.version)

      requested_local_gem_set = Gem::Resolver::InstallerSet.new(:both)
      requested_local_gem_set.add_local(plugin_dependency.name,
        plugin_local_source.spec, plugin_local_source)

      install_gem_to_plugins_dir(plugin_dependency, [requested_local_gem_set])
    end

    def install_from_remote_gems(requested_plugin_name, opts)
      plugin_dependency = Gem::Dependency.new(requested_plugin_name, opts[:version] || "> 0")
      # BestSet is rubygems.org API + indexing
      install_gem_to_plugins_dir(plugin_dependency, [Gem::Resolver::BestSet.new], opts[:update_mode])
    end

    def install_gem_to_plugins_dir(new_plugin_dependency, # rubocop: disable Metrics/AbcSize
      extra_request_sets = [],
      update_mode = false)

      # Get a list of all the gems available to us.
      gem_to_force_update = update_mode ? new_plugin_dependency.name : nil
      set_available_for_resolution = build_gem_request_universe(extra_request_sets, gem_to_force_update)

      # Solve the dependency (that is, find a way to install the new plugin and anything it needs)
      request_set = Gem::RequestSet.new(new_plugin_dependency)

      begin
        solution = request_set.resolve(set_available_for_resolution)
      rescue Gem::UnsatisfiableDependencyError => gem_ex
        # TODO: use search facility to determine if the requested gem exists at all, vs if the constraints are impossible
        ex = Inspec::Plugin::V2::InstallError.new(gem_ex.message)
        ex.plugin_name = new_plugin_dependency.name
        raise ex
      end

      # Activate all current plugins before trying to activate the new one
      loader.list_managed_gems.each do |spec|
        next if spec.name == new_plugin_dependency.name && update_mode

        spec.activate
      end

      # Make sure we remove any previously loaded gem on update
      Gem.loaded_specs.delete(new_plugin_dependency.name) if update_mode

      # Test activating the solution. This makes sure we do not try to load two different versions
      # of the same gem on the stack or a malformed dependency.
      begin
        solution.each do |activation_request|
          unless activation_request.full_spec.activated?
            activation_request.full_spec.activate
          end
        end
      rescue Gem::LoadError => gem_ex
        ex = Inspec::Plugin::V2::InstallError.new(gem_ex.message)
        ex.plugin_name = new_plugin_dependency.name
        raise ex
      end

      # OK, perform the installation.
      # Ignore deps here, because any needed deps should already be baked into new_plugin_dependency
      request_set.install_into(gem_path, true, ignore_dependencies: true, document: [])

      # Painful aspect of rubygems: the VendorSet request set type needs to be able to find a gemspec
      # file within the source of the gem (and not all gems include it in their source tree; they are
      # not obliged to during packaging.)
      # So, after each install, run a scan for all gem(specs) we manage, and copy in their gemspec file
      # into the exploded gem source area if absent.
      loader.list_managed_gems.each do |spec|
        path_inside_source = File.join(spec.gem_dir, "#{spec.name}.gemspec")
        unless File.exist?(path_inside_source)
          File.write(path_inside_source, spec.to_ruby)
        end
      end

      # Locate the GemVersion for the new dependency and return it
      solution.detect { |g| g.name == new_plugin_dependency.name }.version
    end

    #===================================================================#
    #                        UnInstall Methods                          #
    #===================================================================#

    def uninstall_via_path(requested_plugin_name, opts)
      # Nothing to do here; we will later update the plugins file to remove the plugin entry.
    end

    def uninstall_via_gem(plugin_name_to_be_removed, _opts)
      # Strategy: excluding the plugin we want to uninstall, determine a gem install solution
      # based on gems we already have, then remove anything not needed.  This removes 3 kinds
      # of cruft:
      #  1. All versions of the unwanted plugin gem
      #  2. All dependencies of the unwanted plugin gem (that aren't needed by something else)
      #  3. All other gems installed under the ~/.inspec/gems area that are not needed
      #     by a plugin gem. TODO: ideally this would be a separate 'clean' operation.

      # Create a list of plugins dependencies, including any version constraints,
      # excluding any that are path-or-core-based, excluding the gem to be removed
      plugin_deps_we_still_must_satisfy = registry.plugin_statuses
      plugin_deps_we_still_must_satisfy = plugin_deps_we_still_must_satisfy.select do |status|
        status.installation_type == :user_gem && status.name != plugin_name_to_be_removed.to_sym
      end
      plugin_deps_we_still_must_satisfy = plugin_deps_we_still_must_satisfy.map do |status|
        constraint = status.version || "> 0"
        Gem::Dependency.new(status.name.to_s, constraint)
      end

      # Make a Request Set representing the still-needed deps
      request_set_we_still_must_satisfy = Gem::RequestSet.new(*plugin_deps_we_still_must_satisfy)
      request_set_we_still_must_satisfy.remote = false

      # Find out which gems we still actually need...
      names_of_gems_we_actually_need = \
        request_set_we_still_must_satisfy.resolve(build_gem_request_universe)
          .map(&:full_spec).map(&:full_name)

      # ... vs what we currently have, which should have some cruft
      cruft_gem_specs = loader.list_managed_gems.reject do |spec|
        names_of_gems_we_actually_need.include?(spec.full_name)
      end

      # Ok, delete the unneeded gems
      cruft_gem_specs.each do |cruft_spec|
        Gem::Uninstaller.new(
          cruft_spec.name,
          version: cruft_spec.version,
          install_dir: gem_path,
          # Docs on this class are poor.  Next 4 are reasonable, but cargo-culted.
          all: true,
          executables: true,
          force: true,
          ignore: true
        ).uninstall_gem(cruft_spec)
      end
    end

    #===================================================================#
    #                        Utilities
    #===================================================================#

    # This class allows us to build a Resolver set with the gems that are
    # already included either with Ruby or with the InSpec install
    #
    # This code is heavily based on:
    # https://github.com/hashicorp/vagrant/blob/32237377/lib/vagrant/bundler.rb#L400
    # https://github.com/hashicorp/vagrant/blob/32237377/lib/vagrant/bundler.rb#L565
    class InstalledVendorSet < Gem::Resolver::Set
      def initialize
        super
        @remote = false
        @specs = []

        # Grab any pre loaded gems
        Gem::Specification.find_all do |spec|
          @specs << spec
        end

        # find all gem specification directories
        directories = [Gem::Specification.default_specifications_dir]
        unless defined?(::Bundler)
          # add in any others that do not start with the user directory
          directories += Gem::Specification.dirs.find_all do |path|
            !path.start_with?(Gem.user_dir)
          end
        end

        # add them all to the specs array
        Gem::Specification.each_spec(directories) do |spec|
          @specs << spec
        end

        # resolver expects one of each spec so uniq here.
        @specs.uniq!
      end

      def find_all(req)
        @specs.select { |spec| req.match?(spec) }.map do |spec|
          Gem::Resolver::InstalledSpecification.new(self, spec)
        end
      end
    end

    # Provides a RequestSet (a set of gems representing the gems that are available to
    # solve a dependency request) that represents a combination of:
    # * the gems included in the system
    # * the gems included in the inspec install
    # * the currently installed gems in the ~/.inspec/gems directory
    # * any other sets you provide
    def build_gem_request_universe(extra_request_sets = [], gem_to_force_update = nil)
      installed_plugins_gem_set = Gem::Resolver::VendorSet.new
      loader.list_managed_gems.each do |spec|
        next if spec.name == gem_to_force_update

        installed_plugins_gem_set.add_vendor_gem(spec.name, spec.gem_dir)
      end

      # Combine the Sets, so the resolver has one composite place to look
      Gem::Resolver.compose_sets(
        installed_plugins_gem_set, # The gems that are in the plugin gem path directory tree
        InstalledVendorSet.new,
        *extra_request_sets # Anything else our caller wanted to include
      )
    end

    #===================================================================#
    #                 plugins.json Maintenance Methods                  #
    #===================================================================#
    def update_plugin_config_file(plugin_name, opts)
      # Be careful no to initialize this until just before we write.
      # Under testing, ENV['INSPEC_CONFIG_DIR'] may have changed.
      @conf_file = Inspec::Plugin::V2::ConfigFile.new

      # Remove, then optionally rebuild, the entry for the plugin being modified.
      conf_file.remove_entry(plugin_name) if conf_file.existing_entry?(plugin_name)
      unless opts[:action] == :uninstall
        entry = { name: plugin_name }
        # Parsing by Requirement handles lot of awkward formattoes
        entry[:version] = Gem::Requirement.new(opts[:version]).to_s if opts.key?(:version)
        if opts.key?(:path)
          entry[:installation_type] = :path
          entry[:installation_path] = opts[:path]
        end
        conf_file.add_entry(entry)
      end

      conf_file.save

      conf_file
    end
  end
end
