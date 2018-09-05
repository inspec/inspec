# encoding: utf-8

# Impact scores based off CVSS 3.0
module Inspec::Impact
  IMPACT_SCORES = {
    none: 0.0,
    low: 0.01,
    medium: 0.4,
    high: 0.7,
    critical: 0.9,
  }

  def self.impact_from_symbol(value)
    raise "#{value} is not a valid impact name." unless IMPACT_SCORES.key?(value)
    IMPACT_SCORES[value]
  end

  def self.symbol_from_impact(value)
    value = value.to_f
    raise "#{value} is not a valid impact score [0.0 - 1]." if value < 0 || value > 1
    previous_impact = nil
    IMPACT_SCORES.reverse_each do |name, impact|
      return name if value >= impact
    end
  end
end
