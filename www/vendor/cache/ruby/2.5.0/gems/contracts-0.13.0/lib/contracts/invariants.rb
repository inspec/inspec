module Contracts
  module Invariants
    def self.included(base)
      common base
    end

    def self.extended(base)
      common base
    end

    def self.common(base)
      return if base.respond_to?(:Invariant)

      base.extend(InvariantExtension)
    end

    def verify_invariants!(method)
      return unless self.class.respond_to?(:invariants)

      self.class.invariants.each do |invariant|
        invariant.check_on(self, method)
      end
    end

    module InvariantExtension
      def invariant(name, &condition)
        return if ENV["NO_CONTRACTS"]

        invariants << Invariant.new(self, name, &condition)
      end

      def invariants
        @invariants ||= []
      end
    end

    class Invariant
      def initialize(klass, name, &condition)
        @klass, @name, @condition = klass, name, condition
      end

      def expected
        "#{@name} condition to be true"
      end

      def check_on(target, method)
        return if target.instance_eval(&@condition)

        self.class.failure_callback(:expected => expected,
                                    :actual => false,
                                    :target => target,
                                    :method => method)
      end

      def self.failure_callback(data)
        fail InvariantError, failure_msg(data)
      end

      def self.failure_msg(data)
        %{Invariant violation:
            Expected: #{data[:expected]}
            Actual: #{data[:actual]}
            Value guarded in: #{data[:target].class}::#{Support.method_name(data[:method])}
            At: #{Support.method_position(data[:method])}}
      end
    end
  end
end
