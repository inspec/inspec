require 'forwardable'
require 'singleton'
require 'inspec/objects/attribute'

module Inspec
  class Attributes
    include Singleton
    extend Forwardable

    attr_reader :list
    def_delegator :list, :each
    def_delegator :list, :[]
    def_delegator :list, :key?, :profile_exist
    def_delegator :list, :select

    def initialize
      @list = {}
      @profile_overrides = {}
    end

    def generate(name, profile, options = {})
      # check for a profile override name
      name = @profile_overrides[name] if !list.key?(profile) && @profile_overrides[name]

      if list.key?(profile) && list[profile][name] && options.nil?
        list[profile][name]
      else
        list[profile] = {} unless list.key?(profile)
        list[profile][name] = Inspec::Attribute.new(name, options)
      end
    end

    def register_profile_override(name, override)
      @profile_overrides[name] = override
    end

    def select_profile(profile)
      list[profile] = {} unless list.key?(profile)
      list[profile]
    end
  end
end
