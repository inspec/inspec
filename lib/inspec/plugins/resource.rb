# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  module ResourceBehaviors
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

  module ResourceDSL
    def name(name = nil)
      return if name.nil?
      @name = name
      __register(name, self)
    end

    def desc(description = nil)
      return if description.nil?
      __resource_registry[@name].desc(description)
    end

    def supports(criteria = nil)
      return if criteria.nil?
      Inspec::Resource.supports[@name] ||= []
      Inspec::Resource.supports[@name].push(criteria)
    end

    def example(example = nil)
      return if example.nil?
      __resource_registry[@name].example(example)
    end

    def __resource_registry
      Inspec::Resource.registry
    end

    def __register(name, obj) # rubocop:disable Metrics/MethodLength
      cl = Class.new(obj) do
        attr_reader :resource_exception_message

        def initialize(backend, name, *args)
          @resource_skipped = false
          @resource_failed = false
          @supports = Inspec::Resource.supports[name]

          # attach the backend to this instance
          @__backend_runner__ = backend
          @__resource_name__ = name

          # check resource supports
          check_supports unless @supports.nil?

          # call the resource initializer
          begin
            super(*args)
          rescue Inspec::Exceptions::ResourceSkipped => e
            skip_resource(e.message)
          rescue Inspec::Exceptions::ResourceFailed => e
            fail_resource(e.message)
          end
        end

        def self.desc(description = nil)
          return @description if description.nil?
          @description = description
        end

        def self.example(example = nil)
          return @example if example.nil?
          @example = example
        end

        def check_supports
          status = inspec.platform.supported?(@supports)
          skip_msg = "Resource #{@__resource_name__.capitalize} is not supported on platform #{inspec.platform.name}/#{inspec.platform.release}."
          skip_resource(skip_msg) unless status
        end

        def skip_resource(message)
          @resource_skipped = true
          @resource_exception_message = message
        end

        def resource_skipped?
          @resource_skipped
        end

        def fail_resource(message)
          @resource_failed = true
          @resource_exception_message = message
        end

        def resource_failed?
          @resource_failed
        end

        def inspec
          @__backend_runner__
        end
      end

      # rubocop:enable Lint/NestedMethodDefinition
      if __resource_registry.key?(name)
        Inspec::Log.warn("Overwriting resource #{name}. To reference a specific version of #{name} use the resource() method")
      end
      __resource_registry[name] = cl
    end
  end

  module Plugins
    class Resource
      extend Inspec::ResourceDSL
      include Inspec::ResourceBehaviors
    end
  end
end
