require "inspec/errors"

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
  # @raise [Inspec::ImpactError] if value is neither numeric nor a known name.
  def self.impact_from_string(value)
    # Numeric strings (e.g. "0.7") are passed through as-is for the caller to use directly.
    return value if is_number?(value)

    normalized = value.downcase
    raise Inspec::ImpactError, "'#{value}' is not a valid impact name. Valid impact names: #{IMPACT_SCORES.keys.join(", ")}." unless IMPACT_SCORES.key?(normalized)

    IMPACT_SCORES[normalized]
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
  # @raise [Inspec::ImpactError] if value is outside [0.0, 1.0].
  def self.string_from_impact(value)
    value = value.to_f
    raise Inspec::ImpactError, "'#{value}' is not a valid impact score. Valid impact scores: [0.0 - 1.0]." if value < 0 || value > 1

    # Iterate in reverse so the highest matching band wins (e.g. 0.9 -> "critical").
    IMPACT_SCORES.reverse_each do |name, impact|
      return name if value >= impact
    end
  end
end
