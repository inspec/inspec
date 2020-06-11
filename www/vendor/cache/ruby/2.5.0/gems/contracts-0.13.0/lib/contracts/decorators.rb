module Contracts
  module MethodDecorators
    def self.extended(klass)
      Engine.apply(klass)
    end

    def inherited(subclass)
      Engine.fetch_from(subclass).set_eigenclass_owner
    end

    def method_added(name)
      MethodHandler.new(name, false, self).handle
      super
    end

    def singleton_method_added(name)
      MethodHandler.new(name, true, self).handle
      super
    end
  end

  class Decorator
    # an attr_accessor for a class variable:
    class << self; attr_accessor :decorators; end

    def self.inherited(klass)
      name = klass.name.gsub(/^./) { |m| m.downcase }

      return if name =~ /^[^A-Za-z_]/ || name =~ /[^0-9A-Za-z_]/

      # the file and line parameters set the text for error messages
      # make a new method that is the name of your decorator.
      # that method accepts random args and a block.
      # inside, `decorate` is called with those params.
      MethodDecorators.module_eval <<-ruby_eval, __FILE__, __LINE__ + 1
        def #{klass}(*args, &blk)
          ::Contracts::Engine.fetch_from(self).decorate(#{klass}, *args, &blk)
        end
      ruby_eval
    end

    def initialize(klass, method)
      @method = method
    end
  end
end
