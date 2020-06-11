module Contracts
  module Engine
    # Represents class in question
    class Target
      # Creates new instance of Target
      #
      # @param [Class] target - class in question
      def initialize(target)
        @target = target
      end

      # Enable contracts engine for target
      # - it is no-op if contracts engine is already enabled
      # - it automatically enables contracts engine for its eigenclass
      # - it sets owner class to target for its eigenclass
      #
      # @param [Engine::Base:Class] engine_class - type of engine to
      #   enable (Base or Eigenclass)
      def apply(engine_class = Base)
        return if applied?

        apply_to_eigenclass

        eigenclass.class_eval do
          define_method(:__contracts_engine) do
            @__contracts_engine ||= engine_class.new(self)
          end
        end

        engine.set_eigenclass_owner
      end

      # Returns true if target has contracts engine already
      #
      # @return [Bool]
      def applied?
        target.respond_to?(:__contracts_engine)
      end

      # Returns contracts engine of target
      #
      # @return [Engine::Base or Engine::Eigenclass]
      def engine
        applied? && target.__contracts_engine
      end

      private

      attr_reader :target

      def apply_to_eigenclass
        return unless meaningless_eigenclass?

        self.class.new(eigenclass).apply(Eigenclass)
        eigenclass.extend(MethodDecorators)
        # FIXME; this should detect what user uses `include Contracts` or
        # `include Contracts;;Core`
        eigenclass.send(:include, Contracts)
      end

      def eigenclass
        Support.eigenclass_of(target)
      end

      def meaningless_eigenclass?
        !Support.eigenclass?(target)
      end
    end
  end
end
