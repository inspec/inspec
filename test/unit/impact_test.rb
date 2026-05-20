# frozen_string_literal: true

# copyright: 2017, Chef Software Inc.

require 'helper'
require 'inspec/impact'

describe 'Impact' do
  let(:impact) { Inspec::Impact }

  describe 'impact from string method' do
    it 'returns the proper impact for none string' do
      _(impact.impact_from_string('none')).must_equal 0.0
    end

    it 'returns the proper impact for low string' do
      _(impact.impact_from_string('low')).must_equal 0.1
    end

    it 'returns the proper impact for medium string' do
      _(impact.impact_from_string('medium')).must_equal 0.4
    end

    it 'returns the proper impact for high string' do
      _(impact.impact_from_string('high')).must_equal 0.7
    end

    it 'returns the proper impact for critical string' do
      _(impact.impact_from_string('critical')).must_equal 0.9
    end

    it 'returns an error for a invalid impact string' do
      e = _ { impact.impact_from_string('fake') }.must_raise(Inspec::ImpactError)
      expected = "'fake' is not a valid impact name. Valid impact names: none, low, medium, high, critical."
      _(e.message).must_match expected
    end

    # Arrange: numeric string input; Act: call impact_from_string; Assert: passes through as-is (string)
    it 'passes through a numeric string unchanged without lookup' do
      _(impact.impact_from_string('0.5')).must_equal '0.5'
    end

    # Arrange: uppercase severity name; Act: call impact_from_string; Assert: case-insensitive match
    it 'accepts uppercase severity names' do
      _(impact.impact_from_string('HIGH')).must_equal 0.7
    end

    # Negative test: nil input must raise ImpactError, not NoMethodError
    it 'raises ImpactError for nil input' do
      e = _ { impact.impact_from_string(nil) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'nil'
    end
  end

  describe 'string from impact method' do
    it 'returns the proper impact string for 0.1' do
      _(impact.string_from_impact(0.1)).must_equal 'low'
    end

    it 'returns the proper impact string for 0.57' do
      _(impact.string_from_impact(0.57)).must_equal 'medium'
    end

    it 'returns the proper impact string for 0.7' do
      _(impact.string_from_impact(0.7)).must_equal 'high'
    end

    it 'returns the proper impact string for 1' do
      _(impact.string_from_impact(1)).must_equal 'critical'
    end

    it 'returns an error for a invalid impact score' do
      e = _ { impact.string_from_impact(99) }.must_raise(Inspec::ImpactError)
      expected_msg = "'99.0' is not a valid impact score. Valid impact scores: [0.0 - 1.0]."
      _(e.message).must_match expected_msg
    end

    # Arrange: exact lower boundary 0.0; Act: call string_from_impact; Assert: returns "none"
    it "returns 'none' for the lower boundary score of 0.0" do
      _(impact.string_from_impact(0.0)).must_equal 'none'
    end

    # Negative test: nil must raise ImpactError, not silently return "none"
    it 'raises ImpactError for nil input' do
      e = _ { impact.string_from_impact(nil) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'nil'
    end
  end

  describe 'logging_enabled toggle' do
    # Restore default after each test so other tests are unaffected.
    def teardown
      Inspec::Impact.logging_enabled = true
    end

    # Arrange: default state; Assert: logging is ON by default
    it 'is enabled by default' do
      _(impact.logging_enabled?).must_equal true
    end

    # Arrange: toggle OFF; Act: query; Assert: returns false
    it 'can be disabled' do
      impact.logging_enabled = false
      _(impact.logging_enabled?).must_equal false
    end

    # Arrange: toggle OFF; Act: impact_from_string; Assert: correct result (toggle does not affect logic)
    it 'toggle OFF does not affect impact_from_string return value' do
      impact.logging_enabled = false
      _(impact.impact_from_string('high')).must_equal 0.7
    end

    # Arrange: toggle OFF; Act: string_from_impact; Assert: correct result (toggle does not affect logic)
    it 'toggle OFF does not affect string_from_impact return value' do
      impact.logging_enabled = false
      _(impact.string_from_impact(0.5)).must_equal 'medium'
    end

    # Arrange: toggle OFF then ON; Assert: re-enables cleanly
    it 'can be re-enabled after being disabled' do
      impact.logging_enabled = false
      impact.logging_enabled = true
      _(impact.logging_enabled?).must_equal true
    end
  end

  describe 'number? method' do
    it 'returns true for int string' do
      _(impact.number?('1')).must_equal true
    end

    it 'returns true for float string' do
      _(impact.number?('10.99')).must_equal true
    end

    it 'returns false for char string' do
      _(impact.number?('abc')).must_equal false
    end
  end
end
