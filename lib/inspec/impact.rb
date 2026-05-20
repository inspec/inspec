require "inspec/errors"
# Load the InSpec logger when running in full stack; fall back to a no-op stub
# so this module stays testable in isolation (e.g. standalone unit tests).
begin
  require "inspec/log"
rescue LoadError
  module Inspec
    module Log
      def self.debug?() = false
      def self.debug(_msg) = nil
    end unless defined?(Log)
  end
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
module Inspec::Impact
  # Maps severity name (String) -> minimum score (Float), in ascending order.
  # Insertion order matters: string_from_impact relies on reverse iteration.
  IMPACT_SCORES = {
    "none" => 0.0,
    "low" => 0.1,
    "medium" => 0.4,
    "high" => 0.7,
    "critical" => 0.9,
  }.freeze

  # Converts a severity name or numeric string to a Float impact score.
  #
  # @param value [String, Numeric] severity name ("low", "HIGH") or a numeric
  #   string ("0.5"). Numeric strings are passed through unchanged.
  # @return [Float, String] Float score for named severities; the original
  #   string for numeric inputs (caller is responsible for further conversion).
  # @raise [Inspec::ImpactError] if value is nil or neither numeric nor a known name.
  def self.impact_from_string(value)
    raise Inspec::ImpactError, "Impact value must not be nil." if value.nil?

    t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    # Numeric strings (e.g. "0.7") are passed through as-is for the caller to use directly.
    if is_number?(value)
      log_impact(op: "impact_from_string", status: "passthrough", input: value,
                 elapsed_ms: elapsed_ms_since(t0))
      return value
    end

    normalized = value.downcase
    unless IMPACT_SCORES.key?(normalized)
      log_impact(op: "impact_from_string", status: "error", input: value,
                 elapsed_ms: elapsed_ms_since(t0))
      raise Inspec::ImpactError, "'#{value}' is not a valid impact name. Valid impact names: #{IMPACT_SCORES.keys.join(", ")}."
    end

    result = IMPACT_SCORES[normalized]
    log_impact(op: "impact_from_string", status: "ok", input: value, result: result,
               elapsed_ms: elapsed_ms_since(t0))
    result
  end

  # Returns true if +value+ can be parsed as a Float, false otherwise.
  #
  # @param value [Object] value to test.
  # @return [Boolean]
  def self.is_number?(value)
    Float(value)
    true
  rescue TypeError, ArgumentError
    false
  end

  # Converts a numeric impact score to the corresponding severity name string.
  #
  # Uses the highest severity band whose minimum score is <= +value+,
  # matching CVSS 3.0 range semantics.
  #
  # @param value [Numeric] impact score in the range [0.0, 1.0].
  # @return [String] severity name (e.g. "high").
  # @raise [Inspec::ImpactError] if value is nil or outside [0.0, 1.0].
  def self.string_from_impact(value)
    raise Inspec::ImpactError, "Impact score must not be nil." if value.nil?

    t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    value = value.to_f

    unless (0..1).cover?(value)
      log_impact(op: "string_from_impact", status: "error", input: value,
                 elapsed_ms: elapsed_ms_since(t0))
      raise Inspec::ImpactError, "'#{value}' is not a valid impact score. Valid impact scores: [0.0 - 1.0]."
    end

    # Iterate in reverse so the highest matching band wins (e.g. 0.9 -> "critical").
    name = IMPACT_SCORES.reverse_each.find { |_n, score| value >= score }&.first
    log_impact(op: "string_from_impact", status: "ok", input: value, result: name,
               elapsed_ms: elapsed_ms_since(t0))
    name
  end

  # --- private helpers -------------------------------------------------------

  # Emits a structured debug log with consistent fields.
  # Fields: op, status, input, result (optional), elapsed_ms.
  # Only active when log level is DEBUG; zero overhead otherwise.
  def self.log_impact(op:, status:, elapsed_ms:, input: nil, result: nil)
    return unless Inspec::Log.debug?

    entry = { op: op, status: status, elapsed_ms: elapsed_ms }
    entry[:input]  = input  unless input.nil?
    entry[:result] = result unless result.nil?
    # Build JSON without requiring the json gem so this module stays dependency-free.
    Inspec::Log.debug(entry.map { |k, v| "\"#{k}\":#{json_value(v)}" }.then { |p| "{#{p.join(",")}}" })
  end
  private_class_method :log_impact

  # Serialises a scalar value to its JSON representation (string, number, or null).
  def self.json_value(v)
    case v
    when String then "\"#{v}\""
    when NilClass then "null"
    else v.to_s
    end
  end
  private_class_method :json_value

  # Returns milliseconds elapsed since +t0+ (monotonic clock), rounded to 3dp.
  def self.elapsed_ms_since(t0)
    ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - t0) * 1000).round(3)
  end
  private_class_method :elapsed_ms_since
end
