require "inspec/exceptions"

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

      key = @name.to_sym

      Inspec::Resource.supports[key] ||= []
      Inspec::Resource.supports[key].push(criteria)
    end

    def example(example = nil)
      return if example.nil?

      __resource_registry[@name].example(example)
    end

    # Support for Resource DSL plugins.
    # This is called when an unknown method is encountered
    # within a resource class definition.
    # Even tho this is defined as an instance method, it gets added to
    # Inspec::Plugins::Resource via `extend`, so this is actually a class defintion.
    def method_missing(method_name, *arguments, &block)
      require "inspec/plugin/v2"
      # Check to see if there is a resource_dsl plugin activator hook with the method name
      registry = Inspec::Plugin::V2::Registry.instance
      hook = registry.find_activators(plugin_type: :resource_dsl, activator_name: method_name).first
      if hook
        # OK, load the hook if it hasn't been already.  We'll then know a module,
        # which we can then inject into the resource
        hook.activate
        # Inject the module's methods into the resource as class methods.
        # implementation_class is the field name, but this is actually a module.
        extend(hook.implementation_class)
        # Now that the module is loaded, it defined one or more methods
        # (presumably the one we were looking for.)
        # We still haven't called it, so do so now.
        send(method_name, *arguments, &block)
      else
        # If we couldn't find a plugin to match, maybe something up above has it,
        # or maybe it is just a unknown method error.
        super
      end
    end

    def __resource_registry
      Inspec::Resource.registry
    end

    def __register(name, obj) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      cl = Class.new(obj) do # rubocop:disable Metrics/BlockLength
        attr_reader :resource_exception_message

        def initialize(backend, name, *args)
          @resource_skipped = false
          @resource_failed = false
          @supports = Inspec::Resource.supports[name.to_sym]
          @resource_exception_message = nil

          # attach the backend to this instance
          @__backend_runner__ = backend
          @__resource_name__ = name

          # check resource supports
          supported = @supports ? check_supports : true # check_supports has side effects!
          test_backend = defined?(Train::Transports::Mock::Connection) && backend.backend.class == Train::Transports::Mock::Connection
          # raise unless we are supported or in test
          unless supported || test_backend
            msg = "Unsupported resource/backend combination: %s / %s. Exiting." %
              [name, backend.platform.name]
            raise ArgumentError, msg
          end

          # call the resource initializer
          begin
            super(*args)
          rescue Inspec::Exceptions::ResourceSkipped => e
            skip_resource(e.message)
          rescue Inspec::Exceptions::ResourceFailed => e
            fail_resource(e.message)
          rescue NotImplementedError => e
            fail_resource(e.message) unless @resource_failed
          rescue NoMethodError => e
            skip_resource(e.message) unless @resource_failed
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
          require "inspec/resources/platform"
          status = inspec.platform.supported?(@supports)
          fail_msg = "Resource `#{@__resource_name__}` is not supported on platform #{inspec.platform.name}/#{inspec.platform.release}."
          fail_resource(fail_msg) unless status
          status
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

      # Warn if a resource pack is overwriting a core resource.
      # Suppress warning if the resource is an AWS resource, see #3822
      if __resource_registry.key?(name) && !name.start_with?("aws_")
        Inspec::Log.warn("Overwriting resource #{name}. To reference a specific version of #{name} use the resource() method")
      end
      __resource_registry[name] = cl
    end
  end

  module Plugins
    class Resource # TODO: possibly push up to inspec/resource.rb
      extend Inspec::ResourceDSL
      include Inspec::ResourceBehaviors
    end
  end
end
