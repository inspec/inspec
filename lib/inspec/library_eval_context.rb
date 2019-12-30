require "inspec/resource"
require "inspec/dsl_shared"

module Inspec
  #
  # LibaryEvalContext constructs an instance of an anonymous class
  # that library files will be instance_exec'd against.
  #
  # The anonymous class ensures that `Inspec.resource(1)` will return
  # an anonymouse class that is suitable as the parent class of an
  # inspec resource. The class returned will have the resource
  # registry used by all dsl methods bound to the resource registry
  # passed into the #create constructor.
  #
  class LibraryEvalContext
    # rubocop:disable Naming/ConstantName
    Inspec = :nope! # see #initialize below
    # rubocop:enable Naming/ConstantName

    ##
    # Include a custom `require` method that gets used when this
    # context is used to eval source. See lib/inspec/dsl_shared.rb for
    # more details.
    include ::Inspec::DSL::RequireOverride

    def self.create(registry, require_loader)
      Class.new(LibraryEvalContext).new(registry, require_loader)
    end

    # Provide the local binding for this context which is
    # necessary for calls to `require` to create all dependent
    # objects in the correct context.
    attr_accessor :__inspec_binding

    def initialize(registry, require_loader)
      @require_loader = require_loader
      # rubocop:disable Style/RedundantSelf
      self.__inspec_binding = self.instance_eval { binding }
      # rubocop:enable Style/RedundantSelf

      @res_klass = Class.new ::Inspec::Resource
      @res_klass.__resource_registry = registry

      # NOTE: this *must* be a subclass of LibraryEvalContext to work
      self.class.const_set :Inspec, self # BYPASS! See resource below
    end

    # Fake for Inspec.resource in lib/inspec/resource.rb that provides
    # our own Resource subclass that has its own private __resource_registry
    def resource(version)
      ::Inspec.validate_resource_dsl_version!(version)
      @res_klass
    end
  end
end
