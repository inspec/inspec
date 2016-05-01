# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/resource'

module Inspec
  module Plugins
    class Resource
      def self.name(name = nil)
        return if name.nil?
        @name = name
        Inspec::Plugins::Resource.__register(name, self)
      end

      def self.desc(description = nil)
        return if description.nil?
        Inspec::Resource.registry[@name].desc(description)
      end

      def self.example(example = nil)
        return if example.nil?
        Inspec::Resource.registry[@name].example(example)
      end

      def self.__register(name, obj)
        # In cases where we use json formatter with profiles, custom resources get loaded twice.
        # this is caused by Inspec::Profile::load_params (it uses a MockRunner to parse all metadata)
        # At this point of time we assume, that a resource with the same name is the same reource
        # - we are not sure, that the same name is the same implementation
        # - we should not load profiles multiple times
        # - resources should be scoped to profiles where they are loaded
        # TODO: all custom resources should be scoped into a profile instance
        return Inspec::Resource.registry[name] unless Inspec::Resource.registry[name].nil?

        # rubocop:disable Lint/NestedMethodDefinition, Lint/DuplicateMethods
        cl = Class.new(obj) do
          # add some common methods
          include Inspec::Plugins::ResourceCommon
          def initialize(backend, name, *args)
            # attach the backend to this instance
            @__backend_runner__ = backend
            @__resource_name__ = name
            # call the resource initializer
            super(*args)
          end

          def self.desc(description = nil)
            return @description if description.nil?
            @description = description
          end

          def self.example(example = nil)
            return @example if example.nil?
            @example = example
          end

          def inspec
            @__backend_runner__
          end
        end
        # rubocop:enable Lint/NestedMethodDefinition

        # add the resource to the registry by name with a newly-named registry class
        klass_name = name.split('_').map(&:capitalize).join
        Inspec::Resource::Registry.const_set(klass_name, cl)
        Inspec::Resource.registry[name] = Inspec::Resource::Registry.const_get(klass_name)
      end

      # Define methods which are available to all resources
      # and may be overwritten.

      # Print the name of the resource
      def to_s
        @__resource_name__
      end

      # Overwrite inspect to provide better output to RSpec results.
      #
      # @return [String] full name of the resource
      def inspect
        to_s
      end
    end

    module ResourceCommon
      def resource_skipped
        @resource_skipped
      end

      def skip_resource(message)
        @resource_skipped = message
      end
    end
  end
end
