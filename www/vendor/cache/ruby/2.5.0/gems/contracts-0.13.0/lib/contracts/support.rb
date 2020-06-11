module Contracts
  module Support
    class << self
      def method_position(method)
        return method.method_position if method.is_a?(MethodReference)

        if RUBY_VERSION =~ /^1\.8/
          if method.respond_to?(:__file__)
            method.__file__ + ":" + method.__line__.to_s
          else
            method.inspect
          end
        else
          file, line = method.source_location
          file + ":" + line.to_s
        end
      end

      def method_name(method)
        method.is_a?(Proc) ? "Proc" : method.name
      end

      # Generates unique id, which can be used as a part of identifier
      #
      # Example:
      #    Contracts::Support.unique_id   # => "i53u6tiw5hbo"
      def unique_id
        # Consider using SecureRandom.hex here, and benchmark which one is better
        (Time.now.to_f * 1000).to_i.to_s(36) + rand(1_000_000).to_s(36)
      end

      def contract_id(contract)
        contract.object_id
      end

      def eigenclass_hierarchy_supported?
        return false if RUBY_PLATFORM == "java" && RUBY_VERSION.to_f < 2.0
        RUBY_VERSION.to_f > 1.8
      end

      def eigenclass_of(target)
        class << target; self; end
      end

      def eigenclass?(target)
        module_eigenclass?(target) ||
          target <= eigenclass_of(Object)
      end

      private

      # Module eigenclass can be detected by its ancestor chain
      # containing a Module
      def module_eigenclass?(target)
        target < Module
      end
    end
  end
end
