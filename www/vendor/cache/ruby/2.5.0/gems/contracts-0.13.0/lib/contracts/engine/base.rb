module Contracts
  module Engine
    # Contracts engine
    class Base
      # Enable contracts engine for klass
      #
      # @param [Class] klass - target class
      def self.apply(klass)
        Engine::Target.new(klass).apply
      end

      # Returns true if klass has contracts engine
      #
      # @param [Class] klass - target class
      # @return [Bool]
      def self.applied?(klass)
        Engine::Target.new(klass).applied?
      end

      # Fetches contracts engine out of klass
      #
      # @param [Class] klass - target class
      # @return [Engine::Base or Engine::Eigenclass]
      def self.fetch_from(klass)
        Engine::Target.new(klass).engine
      end

      # Creates new instance of contracts engine
      #
      # @param [Class] klass - class that owns this engine
      def initialize(klass)
        @klass = klass
      end

      # Adds provided decorator to the engine
      # It validates that decorator can be added to this engine at the
      # moment
      #
      # @param [Decorator:Class] decorator_class
      # @param args - arguments for decorator
      def decorate(decorator_class, *args)
        validate!
        decorators << [decorator_class, args]
      end

      # Sets eigenclass' owner to klass
      def set_eigenclass_owner
        eigenclass_engine.owner_class = klass
      end

      # Fetches all accumulated decorators (both this engine and
      # corresponding eigenclass' engine)
      # It clears all accumulated decorators
      #
      # @return [ArrayOf[Decorator]]
      def all_decorators
        pop_decorators + eigenclass_engine.all_decorators
      end

      # Fetches decorators of specified type for method with name
      #
      # @param [Or[:class_methods, :instance_methods]] type - method type
      # @param [Symbol] name - method name
      # @return [ArrayOf[Decorator]]
      def decorated_methods_for(type, name)
        Array(decorated_methods[type][name])
      end

      # Returns true if there are any decorated methods
      #
      # @return [Bool]
      def decorated_methods?
        !decorated_methods[:class_methods].empty? ||
          !decorated_methods[:instance_methods].empty?
      end

      # Adds method decorator
      #
      # @param [Or[:class_methods, :instance_methods]] type - method type
      # @param [Symbol] name - method name
      # @param [Decorator] decorator - method decorator
      def add_method_decorator(type, name, decorator)
        decorated_methods[type][name] ||= []
        decorated_methods[type][name] << decorator
      end

      # Returns nearest ancestor's engine that has decorated methods
      #
      # @return [Engine::Base or Engine::Eigenclass]
      def nearest_decorated_ancestor
        current = klass
        current_engine = self
        ancestors = current.ancestors[1..-1]

        while current && current_engine && !current_engine.decorated_methods?
          current = ancestors.shift
          current_engine = Engine.fetch_from(current)
        end

        current_engine
      end

      private

      attr_reader :klass

      def decorated_methods
        @_decorated_methods ||= { :class_methods => {}, :instance_methods => {} }
      end

      # No-op because it is safe to add decorators to normal classes
      def validate!
      end

      def pop_decorators
        decorators.tap { clear_decorators }
      end

      def eigenclass
        Support.eigenclass_of(klass)
      end

      def eigenclass_engine
        Eigenclass.lift(eigenclass, klass)
      end

      def decorators
        @_decorators ||= []
      end

      def clear_decorators
        @_decorators = []
      end
    end
  end
end
