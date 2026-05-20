require "inspec/errors"

# Impact scores based off CVSS 3.0
module Inspec::Impact
  IMPACT_SCORES = {
    "none" => 0.0,
    "low" => 0.1,
    "medium" => 0.4,
    "high" => 0.7,
    "critical" => 0.9,
  }.freeze

  def self.impact_from_string(value)
    # return if it's a number
    return value if is_number?(value)

    normalized = value.downcase
    raise Inspec::ImpactError, "'#{value}' is not a valid impact name. Valid impact names: #{IMPACT_SCORES.keys.join(", ")}." unless IMPACT_SCORES.key?(normalized)

    IMPACT_SCORES[normalized]
  end

  def self.is_number?(value)
    Float(value)
    true
  rescue TypeError, ArgumentError
    false
  end

  def self.string_from_impact(value)
    value = value.to_f
    raise Inspec::ImpactError, "'#{value}' is not a valid impact score. Valid impact scores: [0.0 - 1.0]." if value < 0 || value > 1

    IMPACT_SCORES.reverse_each do |name, impact|
      return name if value >= impact
    end
  end
end
