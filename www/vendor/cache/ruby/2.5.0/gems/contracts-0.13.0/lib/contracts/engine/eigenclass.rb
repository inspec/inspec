module Contracts
  module Engine
    # Special case of contracts engine for eigenclasses
    # We don't care about eigenclass of eigenclass at this point
    class Eigenclass < Base
      # Class that owns this eigenclass
      attr_accessor :owner_class

      # Automatically enables eigenclass engine if it is not
      # Returns its engine
      # NOTE: Required by jruby in 1.9 mode. Otherwise inherited
      # eigenclasses don't have their engines
      #
      # @param [Class] eigenclass - class in question
      # @param [Class] owner - owner of eigenclass
      # @return [Engine::Eigenclass]
      def self.lift(eigenclass, owner)
        return Engine.fetch_from(eigenclass) if Engine.applied?(eigenclass)

        Target.new(eigenclass).apply(Eigenclass)
        eigenclass.extend(MethodDecorators)
        # FIXME; this should detect what user uses `include Contracts` or
        # `include Contracts;;Core`
        eigenclass.send(:include, Contracts)
        Engine.fetch_from(owner).set_eigenclass_owner
        Engine.fetch_from(eigenclass)
      end

      # No-op for eigenclasses
      def set_eigenclass_owner
      end

      # Fetches just eigenclasses decorators
      def all_decorators
        pop_decorators
      end

      private

      # Fails when contracts are not included in owner class
      def validate!
        fail ContractsNotIncluded unless owner?
      end

      def owner?
        !!owner_class
      end
    end
  end
end
