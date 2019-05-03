require 'forwardable'
require 'singleton'
require 'inspec/objects/input'
require 'inspec/secrets'
require 'inspec/exceptions'

module Inspec
  # The InputRegistry's responsibilities include:
  #   - maintaining a list of Input objects that are bound to profiles
  #   - assisting in the lookup and creation of Inputs
  class InputRegistry
    include Singleton
    extend Forwardable

    attr_reader :inputs_by_profile, :profile_aliases, :plugins
    def_delegator :inputs_by_profile, :each
    def_delegator :inputs_by_profile, :[]
    def_delegator :inputs_by_profile, :key?, :profile_known?
    def_delegator :inputs_by_profile, :select
    def_delegator :profile_aliases, :key?, :profile_alias?

    def initialize
      # Keyed on String profile_name => Hash of String input_name => Input object
      @inputs_by_profile = {}

      # this is a list of optional profile name overrides set in the inspec.yml
      @profile_aliases = {}

      # Upon creation, activate all input plugins
      @plugins = []
      Inspec::Plugin::V2::Registry.instance.find_activators(plugin_type: :input).each do |activator|
        activator.activate!
        plugins << activator.implementation_class.new
      end
    end

    #-------------------------------------------------------------#
    #                 Support for Profiles
    #-------------------------------------------------------------#

    def register_profile_alias(name, alias_name)
      @profile_aliases[name] = alias_name
    end

    # Returns an Hash, name => Input that have actually been mentioned
    def list_inputs_for_profile(profile)
      inputs_by_profile[profile] = {} unless profile_known?(profile)
      inputs_by_profile[profile]
    end

    # Returns an Array of input names. This includes input names
    # that plugins may be able to fetch, but have not actually been
    # mentioned in the control code.
    def list_potential_input_names_for_profile(profile_name)
      input_names = inputs_by_profile[profile_name].keys
      plugins.each do |plugin|
        input_names += plugin.list_inputs(profile_name)
      end
      input_names.uniq
    end

    #-------------------------------------------------------------#
    #              Support for Individual Inputs
    #-------------------------------------------------------------#

    def find_or_register_input(input_name, profile_name, options = {})
      if profile_alias?(profile_name)
        alias_name = profile_name
        profile_name = profile_aliases[profile_name]
        handle_late_arriving_alias(alias_name, profile_name) if profile_known?(alias_name)
      end

      # Find or create the input
      inputs_by_profile[profile_name] ||= {}
      if inputs_by_profile[profile_name].key?(input_name)
        inputs_by_profile[profile_name][input_name].update(options)
      else
        inputs_by_profile[profile_name][input_name] = Inspec::Input.new(input_name, options)
      end

      # Poll the plugins
      plugins.each do |plugin|
        evt = plugin.fetch(profile_name, input_name)
        inputs_by_profile[profile_name][input_name].events << evt if evt
      end

      inputs_by_profile[profile_name][input_name]
    end

    # It is possible for a wrapper profile to create an input in metadata,
    # referring to the child profile by an alias that has not yet been registered.
    # The registry will then store the inputs under the alias, as if the alias
    # were a true profile.
    # If that happens and the child profile also mentions the input, we will
    # need to move some things - all inputs should be stored under the true
    # profile name, and no inputs should be stored under the alias.
    def handle_late_arriving_alias(alias_name, profile_name)
      inputs_by_profile[profile_name] ||= {}
      inputs_by_profile[alias_name].each do |input_name, input_from_alias|
        # Move the inpuut, or if it exists, merge events
        existing = inputs_by_profile[profile_name][input_name]
        if existing
          existing.events.concat(input_from_alias.events)
        else
          inputs_by_profile[profile_name][input_name] = input_from_alias
        end
      end
      # Finally, delete the (now copied-out) entry for the alias
      inputs_by_profile.delete(alias_name)
    end
    #-------------------------------------------------------------#
    #               Support for Binding Inputs
    #-------------------------------------------------------------#

    # This method is called by the Profile as soon as it has
    # enough context to allow binding inputs to it.
    def bind_profile_inputs(profile_name, sources = {})
      inputs_by_profile[profile_name] ||= {}

      # In a more perfect world, we could let the core plugins choose
      # self-determine what to do; but as-is, the APIs that call this
      # are a bit over-constrained.
      bind_inputs_from_metadata(profile_name, sources[:profile_metadata])
      bind_inputs_from_input_files(profile_name, sources[:cli_input_files])
      bind_inputs_from_runner_api(profile_name, sources[:runner_api])
    end

    private

    def bind_inputs_from_runner_api(profile_name, input_hash)
      # TODO: move this into a core plugin

      return if input_hash.nil?
      return if input_hash.empty?

      # These arrive as a bare hash - values are raw values, not options
      input_hash.each do |input_name, input_value|
        loc = Inspec::Input::Event.probe_stack # TODO: likely modify this to look for a kitchen.yml, if that is realistic
        evt = Inspec::Input::Event.new(
          value: input_value,
          provider: :runner_api, # TODO: suss out if audit cookbook or kitchen-inspec or something unknown
          priority: 40,
          file: loc.path,
          line: loc.lineno,
        )
        find_or_register_input(input_name, profile_name, event: evt)
      end
    end

    def bind_inputs_from_input_files(profile_name, file_list)
      # TODO: move this into a core plugin

      return if file_list.nil?
      return if file_list.empty?

      file_list.each do |path|
        validate_inputs_file_readability!(path)

        # TODO: drop this SecretsBackend stuff, will be handled by plugin system
        data = Inspec::SecretsBackend.resolve(path)
        if data.nil?
          raise Inspec::Exceptions::SecretsBackendNotFound,
                "Cannot find parser for inputs file '#{path}'. " \
                'Check to make sure file has the appropriate extension.'
        end

        next if data.inputs.nil?
        data.inputs.each do |input_name, input_value|
          evt = Inspec::Input::Event.new(
            value: input_value,
            provider: :cli_files,
            priority: 40,
            file: path,
            # TODO: any way we could get a line number?
          )
          find_or_register_input(input_name, profile_name, event: evt)
        end
      end
    end

    def validate_inputs_file_readability!(path)
      unless File.exist?(path)
        raise Inspec::Exceptions::InputsFileDoesNotExist,
              "Cannot find input file '#{path}'. " \
              'Check to make sure file exists.'
      end

      unless File.readable?(path)
        raise Inspec::Exceptions::InputsFileNotReadable,
              "Cannot read input file '#{path}'. " \
              'Check to make sure file is readable.'
      end

      true
    end

    def bind_inputs_from_metadata(profile_name, profile_metadata_obj)
      # TODO: move this into a core plugin
      # TODO: add deprecation stuff
      return if profile_metadata_obj.nil? # Metadata files are technically optional

      if profile_metadata_obj.params.key?(:attributes) && profile_metadata_obj.params[:attributes].is_a?(Array)
        profile_metadata_obj.params[:attributes].each do |input_orig|
          input_options = input_orig.dup
          input_name = input_options.delete(:name)
          input_options.merge!({ priority: 30, provider: :profile_metadata, file: File.join(profile_name, 'inspec.yml') })
          evt = Inspec::Input.infer_event(input_options)

          # Profile metadata may set inputs in other profiles by naming them.
          if input_options[:profile]
            profile_name = input_options[:profile] || profile_name
            # Override priority to force this to win.  Allow user to set their own priority.
            evt.priority = input_orig[:priority] || 35
          end
          find_or_register_input(input_name,
                                 profile_name,
                                 type: input_options[:type],
                                 required: input_options[:required],
                                 event: evt)
        end
      elsif profile_metadata_obj.params.key?(:attributes)
        Inspec::Log.warn 'Inputs must be defined as an Array. Skipping current definition.'
      end
    end

    #-------------------------------------------------------------#
    #               Other Support
    #-------------------------------------------------------------#
    public

    # Used in testing
    def __reset
      @inputs_by_profile = {}
      @profile_aliases = {}
    end

    # These class methods are convenience methods so you don't always
    # have to call #instance when calling the registry
    [
      :find_or_register_input,
      :register_profile_alias,
      :list_inputs_for_profile,
      :list_potential_input_names_for_profile,
      :bind_profile_inputs,
    ].each do |meth|
      define_singleton_method(meth) do |*args|
        instance.send(meth, *args)
      end
    end
  end
end
