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
    # return if its a number
    return value if is_number?(value)
    raise Inspec::ImpactError, "'#{value}' is not a valid impact name. Valid impact names: none, low, medium, high, critical." unless IMPACT_SCORES.key?(value.downcase)

    IMPACT_SCORES[value]
  end

  def self.is_number?(value)
    Float(value)
    true
  rescue
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
