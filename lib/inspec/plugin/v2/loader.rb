require 'json'
require 'inspec/log'

# Add the current directory of the process to the load path
$LOAD_PATH.unshift('.') unless $LOAD_PATH.include?('.')
# Add the InSpec source root directory to the load path
folder = File.expand_path(File.join('..', '..', '..', '..'), __dir__)
$LOAD_PATH.unshift(folder) unless $LOAD_PATH.include?('folder')

module Inspec::Plugin::V2
  class Loader
    attr_reader :registry, :options

    def initialize(options = {})
      @options = options
      @registry = Inspec::Plugin::V2::Registry.instance
      read_conf_file
      unpack_conf_file

      # Old-style (v0, v1) co-distributed plugins were called 'bundles'
      # and were located in lib/bundles
      detect_bundled_plugins unless options[:omit_bundles]

      # New-style (v2) co-distributed plugins are in lib/plugins,
      # and may be safely loaded
      detect_core_plugins unless options[:omit_core_plugins]
    end

    def load_all
      # Be careful not to actually iterate directly over the registry here;
      # we want to allow "sidecar loading", in which case a plugin may add an entry to the registry.
      registry.plugin_names.dup.each do |plugin_name|
        plugin_details = registry[plugin_name]
        # We want to capture literally any possible exception here, since we are storing them.
        # rubocop: disable Lint/RescueException
        begin
          # We could use require, but under testing, we need to repeatedly reload the same
          # plugin.  However, gems only work with require (rubygems dooes not overload `load`)
          if plugin_details.installation_type == :gem
            activate_managed_gems_for_plugin(plugin_name)
            require plugin_details.entry_point
          else
            load_path = plugin_details.entry_point
            load_path += '.rb' unless plugin_details.entry_point.end_with?('.rb')
            load load_path
          end
          plugin_details.loaded = true
          annotate_status_after_loading(plugin_name)
        rescue ::Exception => ex
          plugin_details.load_exception = ex
          Inspec::Log.error "Could not load plugin #{plugin_name}: #{ex.message}"
        end
        # rubocop: enable Lint/RescueException
      end
    end

    # This should possibly be in either lib/inspec/cli.rb or Registry
    def exit_on_load_error
      if registry.any_load_failures?
        Inspec::Log.error 'Errors were encountered while loading plugins...'
        registry.plugin_statuses.select(&:load_exception).each do |plugin_status|
          Inspec::Log.error 'Plugin name: ' + plugin_status.name.to_s
          Inspec::Log.error 'Error: ' + plugin_status.load_exception.message
          if ARGV.include?('--debug')
            Inspec::Log.error 'Exception: ' + plugin_status.load_exception.class.name
            Inspec::Log.error 'Trace: ' + plugin_status.load_exception.backtrace.join("\n")
          end
        end
        Inspec::Log.error('Run again with --debug for a stacktrace.') unless ARGV.include?('--debug')
        exit 2
      end
    end

    def activate_mentioned_cli_plugins(cli_args = ARGV)
      # Get a list of CLI plugin activation hooks
      registry.find_activators(plugin_type: :cli_command).each do |act|
        next if act.activated?
        # If there is anything in the CLI args with the same name, activate it
        # If the word 'help' appears in the first position, load all CLI plugins
        if cli_args.include?(act.activator_name.to_s) || cli_args[0] == 'help'
          activate(:cli_command, act.activator_name)
          act.implementation_class.register_with_thor
        end
      end
    end

    def activate(plugin_type, hook_name)
      activator = registry.find_activators(plugin_type: plugin_type, activator_name: hook_name).first
      # We want to capture literally any possible exception here, since we are storing them.
      # rubocop: disable Lint/RescueException
      begin
        impl_class = activator.activation_proc.call
        activator.activated?(true)
        activator.implementation_class = impl_class
      rescue Exception => ex
        activator.exception = ex
        Inspec::Log.error "Could not activate #{activator.plugin_type} hook named '#{activator.activator_name}' for plugin #{plugin_name}"
      end
      # rubocop: enable Lint/RescueException
    end

    def plugin_gem_path
      self.class.plugin_gem_path
    end

    def self.plugin_gem_path
      # I can't believe there isn't a simpler way of getting this
      # 2.4.2.p123 => 2.4.0
      ruby_abi_version = (Gem.ruby_version.segments[0, 2] << 0).join('.')
      File.join(Inspec.config_dir, 'gems', ruby_abi_version)
    end

    # Lists all gems found in the plugin_gem_path.
    # @return [Array[Gem::Specification]] Specs of all gems found.
    def list_managed_gems
      Dir.glob(File.join(plugin_gem_path, 'specifications', '*.gemspec')).map { |p| Gem::Specification.load(p) }
    end

    # Lists all plugin gems found in the plugin_gem_path.
    # This is simply all gems that begin with train- or inspec-.
    # @return [Array[Gem::Specification]] Specs of all gems found.
    def list_installed_plugin_gems
      list_managed_gems.select { |spec| spec.name.match(/^(inspec|train)-/) }
    end

    # TODO: refactor the plugin.json file to have its own class, which Loader consumes
    def plugin_conf_file_path
      self.class.plugin_conf_file_path
    end

    # TODO: refactor the plugin.json file to have its own class, which Loader consumes
    def self.plugin_conf_file_path
      File.join(Inspec.config_dir, 'plugins.json')
    end

    private

    # 'Activating' a gem adds it to the load path, so 'require "gemname"' will work.
    # Given a gem name, this activates the gem and all of its dependencies, respecting
    # version pinning needs.
    def activate_managed_gems_for_plugin(plugin_gem_name, version_constraint = '> 0')
      # TODO: enforce first-level version pinning
      plugin_deps = [Gem::Dependency.new(plugin_gem_name.to_s, version_constraint)]
      managed_gem_set = Gem::Resolver::VendorSet.new
      list_managed_gems.each { |spec| managed_gem_set.add_vendor_gem(spec.name, spec.gem_dir) }

      # TODO: Next two lines merge our managed gems with the other gems available
      # in our "local universe" - which may be the system, or it could be in a Bundler microcosm,
      # or rbenv, etc. Do we want to merge that, though?
      distrib_gem_set = Gem::Resolver::CurrentSet.new
      installed_gem_set = Gem::Resolver.compose_sets(managed_gem_set, distrib_gem_set)

      # So, given what we need, and what we have available, what activations are needed?
      resolver = Gem::Resolver.new(plugin_deps, installed_gem_set)
      begin
        solution = resolver.resolve
      rescue Gem::UnsatisfiableDependencyError => gem_ex
        # If you broke your install, or downgraded to a plugin with a bad gemspec, you could get here.
        ex = Inspec::Plugin::V2::LoadError.new(gem_ex.message)
        raise ex
      end
      solution.each do |activation_request|
        next if activation_request.full_spec.activated?
        activation_request.full_spec.activate
        # TODO: If we are under Bundler, inform it that we loaded a gem
      end
    end

    def annotate_status_after_loading(plugin_name)
      status = registry[plugin_name]
      return if status.api_generation == 2 # Gen2 have self-annotating superclasses
      case status.installation_type
      when :bundle
        annotate_bundle_plugin_status_after_load(plugin_name)
      else
        # TODO: are there any other cases? can this whole thing be eliminated?
        raise "I only know how to annotate :bundle plugins when trying to load plugin #{plugin_name}" unless status.installation_type == :bundle
      end
    end

    def annotate_bundle_plugin_status_after_load(plugin_name)
      # HACK: we're relying on the fact that all bundles are gen0 and cli type
      status = registry[plugin_name]
      status.api_generation = 0
      act = Activator.new
      act.activated?(true)
      act.plugin_type = :cli_command
      act.plugin_name = plugin_name
      act.activator_name = :default
      status.activators = [act]

      v0_subcommand_name = plugin_name.to_s.gsub('inspec-', '')
      status.plugin_class = Inspec::Plugins::CLI.subcommands[v0_subcommand_name][:klass]
    end

    def detect_bundled_plugins
      bundle_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'bundles'))
      globs = [
        File.join(bundle_dir, 'inspec-*.rb'),
        File.join(bundle_dir, 'train-*.rb'),
      ]
      Dir.glob(globs).each do |loader_file|
        name = File.basename(loader_file, '.rb').gsub(/^(inspec|train)-/, '')
        status = Inspec::Plugin::V2::Status.new
        status.name = name
        status.entry_point = loader_file
        status.installation_type = :bundle
        status.loaded = false
        registry[name] = status
      end
    end

    def detect_core_plugins
      core_plugins_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'plugins'))
      # These are expected to be organized as proper separate projects,
      # with lib/ dirs, etc.
      Dir.glob(File.join(core_plugins_dir, 'inspec-*')).each do |plugin_dir|
        status = Inspec::Plugin::V2::Status.new
        status.name = File.basename(plugin_dir)
        status.entry_point = File.join(plugin_dir, 'lib', status.name + '.rb')
        status.installation_type = :path
        status.loaded = false
        registry[status.name.to_sym] = status
      end
    end

    # TODO: DRY up re: Installer read_or_init_config_file
    # TODO: refactor the plugin.json file to have its own class, which Loader consumes
    def read_conf_file
      if File.exist?(plugin_conf_file_path)
        @plugin_file_contents = JSON.parse(File.read(plugin_conf_file_path))
      else
        @plugin_file_contents = {
          'plugins_config_version' => '1.0.0',
          'plugins' => [],
        }
      end
    rescue JSON::ParserError => e
      raise Inspec::Plugin::V2::ConfigError, "Failed to load plugins JSON configuration from #{plugin_conf_file_path}:\n#{e}"
    end

    # TODO: refactor the plugin.json file to have its own class, which Loader consumes
    def unpack_conf_file
      validate_conf_file
      @plugin_file_contents['plugins'].each do |plugin_json|
        status = Inspec::Plugin::V2::Status.new
        status.name = plugin_json['name'].to_sym
        status.loaded = false
        status.installation_type = (plugin_json['installation_type'] || :gem).to_sym
        case status.installation_type
        when :gem
          status.entry_point = status.name.to_s
          status.version = plugin_json['version']
        when :path
          status.entry_point = plugin_json['installation_path']
        end

        registry[status.name] = status
      end
    end

    # TODO: refactor the plugin.json file to have its own class, which Loader consumes
    def validate_conf_file
      unless @plugin_file_contents['plugins_config_version'] == '1.0.0'
        raise Inspec::Plugin::V2::ConfigError, "Unsupported plugins.json file version #{@plugin_file_contents['plugins_config_version']} at #{plugin_conf_file_path} - currently support versions: 1.0.0"
      end

      plugin_entries = @plugin_file_contents['plugins']
      unless plugin_entries.is_a?(Array)
        raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - should have a top-level key named 'plugins', whose value is an array"
      end

      plugin_entries.each do |plugin_entry|
        unless plugin_entry.is_a? Hash
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - each 'plugins' entry should be a Hash / JSON object"
        end

        unless plugin_entry.key? 'name'
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - each 'plugins' entry must have a 'name' field"
        end

        next unless plugin_entry.key?('installation_type')
        unless %w{gem path}.include? plugin_entry['installation_type']
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - each 'installation_type' must be one of 'gem' or 'path'"
        end

        next unless plugin_entry['installation_type'] == 'path'
        unless plugin_entry.key?('installation_path')
          raise Inspec::Plugin::V2::ConfigError, "Malformed plugins.json file - each 'plugins' entry with a 'path' installation_type must provide an 'installation_path' field"
        end
      end
    end
  end
end
