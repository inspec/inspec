# frozen_string_literal: true

require 'inspec/errors'
# Load the InSpec logger when running in full stack; fall back to a no-op stub
# so this module stays testable in isolation (e.g. standalone unit tests).
begin
  require 'inspec/log'
rescue LoadError
  # rubocop:disable Style/Documentation
  module Inspec
    module Log
      def self.debug?
        false
      end

      def self.debug(_msg)
        nil
      end

      def self.warn?
        false
      end

      def self.warn(_msg)
        nil
      end
    end unless defined?(Log)
  end
  # rubocop:enable Style/Documentation
end

# Utilities for converting between CVSS 3.0 severity names and numeric scores.
#
# Severity names map to the *lowest* score in that band:
#
#   none     0.0
#   low      0.1 – 0.39
#   medium   0.4 – 0.69
#   high     0.7 – 0.89
#   critical 0.9 – 1.0
#
# To add a new severity level, insert an entry into IMPACT_SCORES in ascending
# score order. All methods and error messages update automatically.
#
# == Feature toggle: impact logging
#
#   Inspec::Impact.logging_enabled = false   # silence debug logs for this module
#   Inspec::Impact.logging_enabled = true    # restore (default)
#   Inspec::Impact.logging_enabled?          # query current state
#
# The toggle is independent of log level. Use it in tests or performance-sensitive
# paths to suppress all log_impact calls with zero overhead.
#
# == Feature flag: strict numeric mode
#
# When ON, impact_from_string rejects numeric strings (e.g. "0.7") instead of
# passing them through, forcing callers to supply a named severity or a real
# Numeric. This is a non-breaking opt-in; the default is OFF (existing behaviour).
#
#   Inspec::Impact.strict_numeric_mode = true    # reject numeric strings
#   Inspec::Impact.strict_numeric_mode = false   # pass through (default)
#   Inspec::Impact.strict_numeric_mode?          # query current state
#
# Auto-enabled via environment variable:
#   INSPEC_IMPACT_STRICT_NUMERIC=1 inspec exec ...
#
# Lifecycle: OFF by default → teams opt in → default ON in next major → removed.
# See ai-track-docs/feature-flags.md for the full lifecycle guide.
module Inspec::Impact
  # Controls whether log_impact emits debug entries. Default: true.
  @logging_enabled = true

  # Controls whether numeric strings are rejected in impact_from_string.
  # Bootstrapped from INSPEC_IMPACT_STRICT_NUMERIC env var at load time.
  @strict_numeric_mode = (ENV.fetch('INSPEC_IMPACT_STRICT_NUMERIC', '0') == '1')

  class << self
    # @return [Boolean] whether impact debug logging is active.
    def logging_enabled?
      @logging_enabled
    end

    # Enable or disable impact debug logging.
    # @param value [Boolean]
    attr_writer :logging_enabled

    # @return [Boolean] whether numeric strings raise ImpactError (strict mode).
    def strict_numeric_mode?
      @strict_numeric_mode
    end

    # Enable or disable strict numeric mode.
    # @param value [Boolean]
    attr_writer :strict_numeric_mode
  end
  # Maps severity name (String) -> minimum score (Float), in ascending order.
  # Insertion order matters: string_from_impact relies on reverse iteration.
  IMPACT_SCORES = {
    'none' => 0.0,
    'low' => 0.1,
    'medium' => 0.4,
    'high' => 0.7,
    'critical' => 0.9
  }.freeze

  # Exact band-boundary scores (all boundaries except the global minimum 0.0).
  # A score at one of these values sits exactly on a severity dividing line;
  # upstream rounding could shift it into the adjacent band. string_from_impact
  # emits a WARN for these hits so operators can inspect them without enabling
  # DEBUG mode.
  BOUNDARY_SCORES = IMPACT_SCORES.values.drop(1).freeze
  private_constant :BOUNDARY_SCORES

  # Converts a severity name or numeric string to a Float impact score.
  #
  # @param value [String, Numeric] severity name ("low", "HIGH") or a numeric
  #   string ("0.5"). Numeric strings are passed through unchanged when
  #   strict_numeric_mode? is false (the default); when strict_numeric_mode? is
  #   true, numeric strings raise ImpactError — callers must supply a named
  #   severity or a real Numeric.
  # @return [Float, String] Float score for named severities; the original
  #   string for numeric inputs (when strict mode is OFF).
  # @raise [Inspec::ImpactError] if value is nil, not a String/Numeric, or an
  #   unknown severity name. Also raised for numeric strings when strict mode is ON.
  def self.impact_from_string(value)
    assert_type!(value, label: 'value', allowed: [String, Numeric], description: 'a String or Numeric')
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    if number?(value)
      reject_if_strict_numeric!(value, start_time)

      # Numeric strings (e.g. "0.7") are passed through as-is for the caller to use directly.
      log_impact(op: 'impact_from_string', status: 'passthrough', input: value,
                 elapsed_ms: elapsed_ms_since(start_time))
      return value
    end

    normalized = value.downcase
    unless IMPACT_SCORES.key?(normalized)
      warn_impact(op: 'impact_from_string', input: value, reason: 'invalid_severity_name')
      log_impact(op: 'impact_from_string', status: 'error', input: value,
                 elapsed_ms: elapsed_ms_since(start_time))
      raise Inspec::ImpactError,
            "'#{value}' is not a valid impact name. Valid impact names: #{IMPACT_SCORES.keys.join(', ')}."
    end

    result = IMPACT_SCORES[normalized]
    log_impact(op: 'impact_from_string', status: 'ok', input: value, result: result,
               elapsed_ms: elapsed_ms_since(start_time))
    result
  end

  # Regex that matches any string Ruby's Float() would accept, without
  # triggering an exception. Used by number? to avoid exception-based control flow.
  NUMERIC_RE = /\A[-+]?(\d+\.?\d*|\.\d+)([eE][-+]?\d+)?\z/.freeze
  private_constant :NUMERIC_RE

  # Returns true if +value+ can be interpreted as a Float, false otherwise.
  # Uses an early Numeric short-circuit and a regex to avoid exception-based
  # control flow on the hot path (named severities always hit the false branch).
  #
  # @param value [Object] value to test.
  # @return [Boolean]
  def self.number?(value)
    return true if value.is_a?(Numeric)

    value.is_a?(String) && NUMERIC_RE.match?(value)
  end

  # Converts a numeric impact score to the corresponding severity name string.
  #
  # Uses the highest severity band whose minimum score is <= +value+,
  # matching CVSS 3.0 range semantics.
  #
  # @param value [Numeric] impact score in the range [0.0, 1.0].
  # @return [String] severity name (e.g. "high").
  # @raise [Inspec::ImpactError] if value is nil, not Numeric, or outside [0.0, 1.0].
  #   Always raises ImpactError — never a raw TypeError or NoMethodError.
  def self.string_from_impact(value)
    assert_type!(value, label: 'score', allowed: [Numeric], description: 'Numeric')
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    value = value.to_f

    unless (0..1).cover?(value)
      warn_impact(op: 'string_from_impact', input: value, reason: 'out_of_range')
      log_impact(op: 'string_from_impact', status: 'error', input: value,
                 elapsed_ms: elapsed_ms_since(start_time))
      raise Inspec::ImpactError, "'#{value}' is not a valid impact score. Valid impact scores: [0.0 - 1.0]."
    end

    # Iterate in reverse so the highest matching band wins (e.g. 0.9 -> "critical").
    name = IMPACT_SCORES.reverse_each.find { |_n, score| value >= score }&.first
    if BOUNDARY_SCORES.include?(value)
      warn_impact(op: 'string_from_impact', input: value, result: name, reason: 'boundary_score')
    end
    log_impact(op: 'string_from_impact', status: 'ok', input: value, result: name,
               elapsed_ms: elapsed_ms_since(start_time))
    name
  end

  # --- private helpers -------------------------------------------------------

  # Raises ImpactError when strict_numeric_mode? is ON and value is a String.
  # Real Numeric values are never rejected (they have an unambiguous type).
  # Extracted from impact_from_string to keep method length within RuboCop limits.
  def self.reject_if_strict_numeric!(value, start_time)
    return unless strict_numeric_mode? && value.is_a?(String)

    warn_impact(op: 'impact_from_string', input: value, reason: 'strict_numeric_rejected')
    log_impact(op: 'impact_from_string', status: 'error', input: value,
               elapsed_ms: elapsed_ms_since(start_time))
    raise Inspec::ImpactError,
          "Numeric string '#{value}' is not accepted in strict numeric mode. " \
          "Pass a named severity (#{IMPACT_SCORES.keys.join(', ')}) or a Numeric value."
  end
  private_class_method :reject_if_strict_numeric!

  # Resilience guard: raises ImpactError if +value+ is nil or not one of the
  # permitted types. Keeps nil/type validation in one place across both public methods.
  #
  # @param value    [Object]        value to validate
  # @param label    [String]        "value" or "score" — used in error message
  # @param allowed  [Array<Class>]  list of permitted classes (e.g. [String, Numeric])
  # @param description [String]     human-readable type list for error message
  def self.assert_type!(value, label:, allowed:, description:)
    raise Inspec::ImpactError, "Impact #{label} must not be nil." if value.nil?
    return if allowed.any? { |klass| value.is_a?(klass) }

    raise Inspec::ImpactError,
          "Impact #{label} must be #{description}, got #{value.class}."
  end
  private_class_method :assert_type!

  # Emits a structured WARN log entry visible at normal log levels (not just DEBUG).
  # Called for error paths (invalid input) and exact boundary-score hits so operators
  # can see these events without enabling DEBUG mode.
  #
  # Fields: op, reason, input (optional), result (optional).
  # Respects the logging_enabled? toggle — disabled when toggle is OFF.
  def self.warn_impact(op:, reason:, input: nil, result: nil)
    return unless logging_enabled?

    Inspec::Log.warn(build_log_entry(op: op, reason: reason, input: input, result: result))
  end
  private_class_method :warn_impact

  # Emits a structured debug log with consistent fields.
  # Fields: op, status, input, result (optional), elapsed_ms.
  # Only active when logging_enabled? is true AND log level is DEBUG.
  def self.log_impact(op:, status:, elapsed_ms:, input: nil, result: nil)
    return unless logging_enabled?
    return unless Inspec::Log.debug?

    # Build JSON without requiring the json gem so this module stays dependency-free.
    Inspec::Log.debug(build_log_entry(op: op, status: status, elapsed_ms: elapsed_ms,
                                      input: input, result: result))
  end
  private_class_method :log_impact

  # Serialises a scalar value to its JSON representation (string, number, or null).
  def self.json_value(val)
    case val
    when String then "\"#{val}\""
    when NilClass then 'null'
    else val.to_s
    end
  end
  private_class_method :json_value

  # Builds a compact JSON string from the provided keyword fields, omitting nil values.
  # Shared by log_impact and warn_impact to eliminate duplicated serialisation logic.
  # Using a Hash + compact keeps this free of the json gem.
  def self.build_log_entry(**fields)
    fields.compact
          .map { |key, val| "\"#{key}\":#{json_value(val)}" }
          .then { |parts| "{#{parts.join(',')}}" }
  end
  private_class_method :build_log_entry

  # Returns milliseconds elapsed since +start_time+ (monotonic clock), rounded to 3dp.
  def self.elapsed_ms_since(start_time)
    ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time) * 1000).round(3)
  end
  private_class_method :elapsed_ms_since
end
