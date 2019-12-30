# copyright: 2015, Vulcano Security GmbH
require "inspec/plugin/v1"
require "inspec/utils/deprecation/global_method" # for resources

module Inspec
  class ProfileNotFound < StandardError; end

  class Resource
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

    # Creates the inner DSL which includes all resources for
    # creating tests. It is always connected to one target,
    # which is specified via the backend argument.
    #
    # @param backend [BackendRunner] exposing the target to resources
    # @return [ResourcesDSL]
    def self.create_dsl(profile_context)
      backend = profile_context.backend
      my_registry = profile_context.resource_registry

      Module.new do
        define_method :resource_class do |profile_name, resource_name|
          inner_context = if profile_name == profile_context.profile_id
                            profile_context
                          else
                            profile_context.subcontext_by_name(profile_name)
                          end

          raise ProfileNotFound, "Cannot find profile named: #{profile_name}" if inner_context.nil?

          inner_context.resource_registry[resource_name]
        end

        my_registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(backend, id.to_s, *args)
          end

          # confirm backend custom resources have access to other custom resources
          next if backend.respond_to?(id)

          backend.class.send(:define_method, id.to_sym) do |*args|
            r.new(backend, id.to_s, *args)
          end
        end

        # attach backend so we have access to all resources and
        # the train connection object
        define_method :inspec do
          backend
        end
      end
    end
  end

  # Retrieve the base class for creating a new resource.
  # Create classes that inherit from this class.
  #
  # @param [int] version the resource version to use
  # @return [Resource] base class for creating a new resource
  def self.resource(version)
    validate_resource_dsl_version!(version)
    require "inspec/plugin/v1/plugin_types/resource"
    Inspec::Plugins::Resource
  end

  def self.validate_resource_dsl_version!(version)
    raise "Only resource version 1 is supported!" if version != 1
  end
end

# Many resources use FilterTable.
require "inspec/utils/filter"
# conflicts with global `gem` method so we need to pre-load this.
require "inspec/resources/gem"
