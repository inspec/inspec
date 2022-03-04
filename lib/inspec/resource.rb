# copyright: 2015, Vulcano Security GmbH

module Inspec
  class ProfileNotFound < StandardError; end

  class Resource
    def self.name(value = nil)
      return @name unless value

      @name = value

      __register(value, self)
    end

    def self.desc(value = nil)
      return find_class_instance_variable(:@description) unless value

      @description = value
    end

    def self.example(value = nil)
      return find_class_instance_variable(:@example) unless value

      @example = value
    end

    def self.supports(criteria = nil)
      return if criteria.nil?

      key = @name.to_sym

      # HACK: this is broken!!! this is global where the rest are localized to registry
      Inspec::Resource.support_registry[key] ||= []
      Inspec::Resource.support_registry[key].push(criteria)
    end

    # TODO: this is pretty terrible and is only here to work around
    # the idea that we've trained resource authors to make initialize
    # methods w/o calling super.

    def supersuper_initialize(backend, name)
      @resource_skipped = false
      @resource_failed = false
      # TODO remove this (or the support_registry) (again?)
      @supports = Inspec::Resource.support_registry[name.to_sym]
      @resource_exception_message = nil

      # attach the backend to this instance
      @__backend_runner__ = backend
      @__resource_name__ = name

      check_supported!

      yield
    rescue Inspec::Exceptions::ResourceSkipped => e
      skip_resource(e.message)
    rescue Inspec::Exceptions::ResourceFailed => e
      fail_resource(e.message)
    rescue NotImplementedError => e
      fail_resource(e.message) unless @resource_failed
    rescue NoMethodError => e
      skip_resource(e.message) unless @resource_failed
    end

    def check_supported!
      backend = @__backend_runner__
      name = @__resource_name__

      supported = @supports ? check_supports : true # check_supports has side effects!
      test_backend = defined?(Train::Transports::Mock::Connection) && backend.backend.class == Train::Transports::Mock::Connection
      # raise unless we are supported or in test
      unless supported || test_backend
        msg = "Unsupported resource/backend combination: %s / %s. Exiting." %
          [name, backend.platform.name]
        raise ArgumentError, msg
      end
    end

    # Support for Resource DSL plugins.
    # This is called when an unknown method is encountered
    # within a resource class definition.
    # Even tho this is defined as an instance method, it gets added to
    # the class via `extend`, so this is actually a class defintion.
    def self.method_missing(method_name, *arguments, &block)
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

    ############################################################
    # Infrastructure / Bookkeeping

    def self.__register(name, resource_klass)
      # This has bitten us and should be a great candidate to remove in InSpec5
      cl = Class.new(resource_klass) do # TODO: remove
        # As best I can figure out, this anonymous class only exists
        # because we're trying to avoid having resources with
        # initialize methods from having to call super, which is,
        # quite frankly, dumb. Avoidable even with some simple
        # documentation.
        def initialize(backend, name, *args)
          supersuper_initialize(backend, name) do
            @resource_params = args
            super(*args)
          end
        end
      end

      reg = __resource_registry rescue nil
      reg = self.__resource_registry = Inspec::Resource.registry unless reg

      # Warn if a resource pack is overwriting a core resource.
      # Suppress warning if the resource is an AWS resource, see #3822

      if reg.key?(name) && !name.start_with?("aws_")
        Inspec::Log.warn("Overwriting resource #{name}. To reference a specific version of #{name} use the resource() method")
      end

      reg[name] = cl
    end # __register

    def self.__resource_registry
      # rubocop:disable Style/AndOr
      find_class_instance_variable(:@__resource_registry) or
        raise("__resource_registry not set!")
    end

    def self.__resource_registry=(o)
      @__resource_registry = o
    end

    def self.default_registry
      @default_registry ||= {}
    end

    # TODO: these are keyed off of strings
    def self.registry
      @registry ||= default_registry
    end

    # TODO: these are keyed off of symbols
    def self.support_registry
      @support_registry ||= {}
    end

    def self.new_registry
      default_registry.dup
    end

    def self.backfill_supports!
      reg = registry.keys.map(&:to_sym).sort
      sup = supports.keys.map(&:to_sym).sort

      missings = reg - sup

      supports[:platform] = [{ platform: "os" }] # patch the circular dep

      missings.each do |missing|
        klass = registry[missing.to_s].superclass
        sklas = klass.superclass.name&.to_sym # might be resource = no name

        klass = klass.name.to_sym

        case
        when klass != missing # an alias
          supports[missing] = supports[klass]
        when sklas
          supports[klass]   = supports[sklas]
        end
      end
    end

    def to_s
      @__resource_name__
    end

    def self.toggle_inspect
      has_inspect = instance_method(:inspect).source_location
      unless has_inspect
        define_method :inspect do
          to_s
        end
      else
        undef_method :inspect
      end
    end

    attr_reader :resource_exception_message

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

    def check_supports
      require "inspec/resources/platform"
      status = inspec.platform.supported?(@supports)
      fail_msg = "Resource `#{@__resource_name__}` is not supported on platform #{inspec.platform.name}/#{inspec.platform.release}."
      fail_resource(fail_msg) unless status
      status
    end

    def inspec
      @__backend_runner__
    end
  end

  # Retrieve the base class for creating a new resource.
  # Create classes that inherit from this class.
  #
  # @param [int] version the resource version to use
  # @return [Resource] base class for creating a new resource
  def self.resource(version)
    validate_resource_dsl_version!(version)
    Inspec::Resource
  end

  def self.validate_resource_dsl_version!(version)
    raise "Only resource version 1 is supported!" if version != 1
  end
end

class Module
  # Any use of this is an anti-pattern caused by our use of negligent
  # design and metaprogramming nonsense. We should work it out... but
  # there are many hurdles in our way.
  def find_class_instance_variable(k)
    (ancestors - Object.ancestors)
      .find { |cls| cls.instance_variable_defined?(k) }
      &.instance_variable_get(k)
  end
end

# Many resources use FilterTable.
require "inspec/utils/filter"
# conflicts with global `gem` method so we need to pre-load this.
require "inspec/resources/gem"
