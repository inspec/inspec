require "contracts/engine/base"
require "contracts/engine/target"
require "contracts/engine/eigenclass"

require "forwardable"

module Contracts
  # Engine facade, normally you shouldn't refer internals of Engine
  # module directly.
  module Engine
    class << self
      extend Forwardable

      # .apply(klass)      - enables contracts engine on klass
      # .applied?(klass)   - returns true if klass has contracts engine
      # .fetch_from(klass) - returns contracts engine for klass
      def_delegators :base_engine, :apply, :applied?, :fetch_from

      private

      def base_engine
        Base
      end
    end
  end
end
