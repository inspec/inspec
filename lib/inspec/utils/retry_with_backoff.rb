# frozen_string_literal: true

# Lightweight retry-with-exponential-backoff helper.
#
# No external gem dependency; uses standard Ruby only.
# Written for Walk Ex15 (Resilience and Error Handling) to wrap transient
# call sites such as log backends, without pulling in gems like retriable or
# stoplight.
#
# == Tuning parameters
#
#   retries:    Number of re-attempts after the first failure (default: 3).
#               Total attempts = retries + 1.
#   base_delay: Initial backoff in seconds; doubles each retry (default: 0.05).
#               Sequence: base, base*2, base*4, … capped at max_delay.
#   max_delay:  Upper cap on a single sleep (default: 1.0 seconds).
#   on:         Exception class or Array of classes to catch and retry.
#               Use the narrowest type possible; StandardError is the default.
#   fallback:   Value returned when the retry budget is exhausted.
#               Pass :raise to re-raise the last exception instead.
#
# == Usage
#
#   RetryWithBackoff.call(retries: 2, on: IOError, fallback: nil) do
#     ExternalService.call
#   end
#
# See ai-track-docs/resilience.md for tuning guidance and rollback instructions.
module Inspec
  module Utils
    # Lightweight retry-with-exponential-backoff utility (Walk Ex15).
    # No external gem dependency; uses standard Ruby only.
    # See module-level comment and ai-track-docs/resilience.md for tuning guidance.
    module RetryWithBackoff
      # Default number of retries after initial failure.
      DEFAULT_RETRIES    = 3
      # Initial backoff sleep in seconds (doubles each attempt).
      DEFAULT_BASE_DELAY = 0.05
      # Maximum sleep cap in seconds.
      DEFAULT_MAX_DELAY  = 1.0

      # Executes the block with exponential-backoff retries.
      #
      # @param retries    [Integer] retry budget (not counting first attempt)
      # @param base_delay [Float]   initial sleep in seconds
      # @param max_delay  [Float]   sleep cap in seconds
      # @param on         [Class, Array<Class>] exception(s) to rescue and retry
      # @param fallback   [Object, Symbol] return value when budget exhausted;
      #                   pass :raise to propagate the last exception
      # @yield [] block to execute under resilience policy
      # @return [Object] block result on success, or fallback on exhaustion
      def self.call(retries: DEFAULT_RETRIES,
                    base_delay: DEFAULT_BASE_DELAY,
                    max_delay: DEFAULT_MAX_DELAY,
                    on: StandardError,
                    fallback: nil,
                    &block)
        attempts = 0
        begin
          yield
        rescue *Array(on) => _e
          attempts += 1
          if attempts > retries
            raise if fallback == :raise

            return fallback
          end
          # Exponential backoff with cap: base_delay * 2^(attempt-1)
          delay = [base_delay * (2**(attempts - 1)), max_delay].min
          sleep(delay)
          retry
        end
      end
    end
  end
end
