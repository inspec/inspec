# copyright: 2017, Chef Software Inc.

require 'helper'
require 'inspec/impact'

describe 'Impact' do
  let(:impact) { Inspec::Impact }

  describe 'impact from string method' do
    it 'returns the proper impact for none string' do
      impact.impact_from_string('none').must_equal 0.0
    end

    it 'returns the proper impact for low string' do
      impact.impact_from_string('low').must_equal 0.1
    end

    it 'returns the proper impact for medium string' do
      impact.impact_from_string('medium').must_equal 0.4
    end

    it 'returns the proper impact for high string' do
      impact.impact_from_string('high').must_equal 0.7
    end

    it 'returns the proper impact for critical string' do
      impact.impact_from_string('critical').must_equal 0.9
    end

    it 'returns an error for a invalid impact string' do
      e = proc { impact.impact_from_string('fake') }.must_raise(Inspec::ImpactError)
      e.message.must_match "'fake' is not a valid impact name. Valid impact names: none, low, medium, high, critical."
    end
  end

  describe 'string from impact method' do
    it 'returns the proper impact string for 0.1' do
      impact.string_from_impact(0.1).must_equal 'low'
    end

    it 'returns the proper impact string for 0.57' do
      impact.string_from_impact(0.57).must_equal 'medium'
    end

    it 'returns the proper impact string for 0.7' do
      impact.string_from_impact(0.7).must_equal 'high'
    end

    it 'returns the proper impact string for 1' do
      impact.string_from_impact(1).must_equal 'critical'
    end

    it 'returns an error for a invalid impact score' do
      e = proc { impact.string_from_impact(99) }.must_raise(Inspec::ImpactError)
      e.message.must_match "'99.0' is not a valid impact score. Valid impact scores: [0.0 - 1.0]."
    end
  end

  describe 'is_number? method' do
    it 'returns true for int string' do
      impact.is_number?('1').must_equal true
    end

    it 'returns true for float string' do
      impact.is_number?('10.99').must_equal true
    end

    it 'returns false for char string' do
      impact.is_number?('abc').must_equal false
    end
  end
end
