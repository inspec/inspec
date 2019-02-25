require 'forwardable'
require 'singleton'
require 'inspec/objects/input'

module Inspec
  class InputRegistry
    include Singleton
    extend Forwardable

    attr_reader :list
    def_delegator :list, :each
    def_delegator :list, :[]
    def_delegator :list, :key?, :profile_exist?
    def_delegator :list, :select

    # These self methods are convenience methods so you dont always
    # have to specify instance when calling the registry
    def self.find_input(name, profile)
      instance.find_input(name, profile)
    end

    def self.register_input(name, profile, options = {})
      instance.register_input(name, profile, options)
    end

    def self.register_profile_alias(name, alias_name)
      instance.register_profile_alias(name, alias_name)
    end

    def self.list_inputs_for_profile(profile)
      instance.list_inputs_for_profile(profile)
    end

    def initialize
      # this is a collection of profiles which have a value of input objects
      @list = {}

      # this is a list of optional profile name overrides set in the inspec.yml
      @profile_aliases = {}
    end

    def find_input(name, profile)
      profile = @profile_aliases[profile] if !profile_exist?(profile) && @profile_aliases[profile]
      unless profile_exist?(profile)
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
      list[profile][name]
    end

    def register_input(name, profile, options = {})
      # check for a profile override name
      if profile_exist?(profile) && list[profile][name] && options.empty?
        list[profile][name]
      else
        list[profile] = {} unless profile_exist?(profile)
        list[profile][name] = Inspec::Input.new(name, options)
      end
    end

    def register_profile_alias(name, alias_name)
      @profile_aliases[name] = alias_name
    end

    def list_inputs_for_profile(profile)
      list[profile] = {} unless profile_exist?(profile)
      list[profile]
    end

    def __reset
      @list = {}
      @profile_aliases = {}
    end
  end
end
