require 'forwardable'
require 'singleton'
require 'inspec/objects/input'

module Inspec
  # The InputRegistry's responsibilities include:
  #   - maintaining a list of Input objects that are bound to profiles
  #   - assisting in the lookup and creation of Inputs
  class InputRegistry
    include Singleton
    extend Forwardable

    attr_reader :inputs_by_profile
    def_delegator :inputs_by_profile, :each
    def_delegator :inputs_by_profile, :[]
    def_delegator :inputs_by_profile, :key?, :profile_known?
    def_delegator :inputs_by_profile, :select

    def initialize
      # Keyed on String profile_name => Hash of String input_name => Input object
      @inputs_by_profile = {}

      # this is a list of optional profile name overrides set in the inspec.yml
      @profile_aliases = {}
    end

    #-------------------------------------------------------------#
    #                 Support for Profiles
    #-------------------------------------------------------------#

    def register_profile_alias(name, alias_name)
      @profile_aliases[name] = alias_name
    end

    def list_inputs_for_profile(profile)
      inputs_by_profile[profile] = {} unless profile_known?(profile)
      inputs_by_profile[profile]
    end

    #-------------------------------------------------------------#
    #              Support for Individual Inputs
    #-------------------------------------------------------------#

    def find_input(name, profile)
      profile = @profile_aliases[profile] if !profile_known?(profile) && @profile_aliases[profile]
      unless profile_known?(profile)
        error = Inspec::InputRegistry::ProfileLookupError.new
        error.profile_name = profile
        raise error, "Profile '#{error.profile_name}' does not have any inputs"
      end

      unless list[profile].key?(name)
        error = Inspec::InputRegistry::InputLookupError.new
        error.input_name = name
        error.profile_name = profile
        raise error, "Profile '#{error.profile_name}' does not have an input with name '#{error.input_name}'"
      end
      inputs_by_profile[profile][name]
    end

    def register_input(name, profile, options = {})
      # check for a profile override name
      if profile_known?(profile) && inputs_by_profile[profile][name] && options.empty?
        inputs_by_profile[profile][name]
      else
        inputs_by_profile[profile] = {} unless profile_known?(profile)
        inputs_by_profile[profile][name] = Inspec::Input.new(name, options)
      end
    end

    #-------------------------------------------------------------#
    #               Support for Binding Inputs
    #-------------------------------------------------------------#

    # This method is called by the Profile as soon as it has
    # enough context to allow binding inputs to it.
    def bind_profile_inputs(profile_obj, sources = {})
      inputs_by_profile[profile_obj.profile_name] ||= {}

      # In a more perfect world, we could let the core plugins choose
      # self-determine what to do; but as-is, the APIs that call this
      # are a bit over-constrained.
      bind_inputs_from_metadata(profile_obj, sources[:metadata])
      bind_inputs_from_input_files(profile_obj, sources[:cli_input_files])
      bind_inputs_from_runner_api(profile_obj, sources[:runner_api])
    end

    private

    def bind_inputs_from_runner_api(profile_obj, input_hash)
      # TODO: move this into a core plugin

      return if input_hash.nil?
      return if input_hash.empty?

      # These arrive as a bare hash - values are raw values, not options
      input_hash.each do |input_name, input_value|
        input_options = { value: input_value }
        register_input(input_name, profile_obj.profile_name, input_options)
      end
    end

    def bind_inputs_from_input_files(profile_obj, file_list)
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
          input_options = { value: input_value }
          register_input(input_name, profile_obj.profile_name, input_options)
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

    def bind_inputs_from_metadata(profile_obj, profile_metadata_obj)
      # TODO: move this into a core plugin
      # TODO: add deprecation stuff
      if profile_metadata_obj.params.key?(:attributes) && profile_metadata_obj.params[:attributes].is_a?(Array)
        profile_metadata_obj.params[:attributes].each do |input|
          input_options = input.dup
          input_name = input_options.delete(:name)
          register_input(input_name, profile_obj.profile_name, input_options)
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
      :find_input,
      :register_input,
      :register_profile_alias,
      :list_inputs_for_profile,
      :bind_profile_inputs,
    ].each do |meth|
      define_singleton_method(meth) do |*args|
        instance.send(meth, *args)
      end
    end
  end
end
