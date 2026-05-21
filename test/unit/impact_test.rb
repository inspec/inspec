# frozen_string_literal: true

# copyright: 2017, Chef Software Inc.

require 'helper'
require 'inspec/impact'

describe 'Impact' do
  let(:impact) { Inspec::Impact }

  # Shared spy helper: temporarily replaces Inspec::Log warn/warn? singleton methods,
  # captures emitted messages into an array, then restores originals in ensure.
  # Available to all describe groups in this file.
  def capture_warns
    captured = []
    Inspec::Log.define_singleton_method(:warn?)  { true }
    Inspec::Log.define_singleton_method(:warn) { |msg| captured << msg }
    yield
    captured
  ensure
    Inspec::Log.singleton_class.remove_method(:warn?)
    Inspec::Log.singleton_class.remove_method(:warn)
  end

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

    # Negative test: nil input must raise ImpactError via unified assert_type! guard
    it 'raises ImpactError for nil input' do
      e = _ { impact.impact_from_string(nil) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'nil'
    end

    # Resilience: Array input must raise ImpactError via assert_type! — not raw NoMethodError.
    # Guard: assert_type!(allowed: [String, Numeric]) — added Ex3 (consolidated).
    it 'raises ImpactError (not NoMethodError) for Array input' do
      e = _ { impact.impact_from_string([1, 2]) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'Array'
    end

    # Resilience: arbitrary Object input must raise ImpactError with type info.
    it 'raises ImpactError (not NoMethodError) for Object input' do
      e = _ { impact.impact_from_string(Object.new) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'Object'
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

    # Negative test: nil must raise ImpactError via unified assert_type! guard
    it 'raises ImpactError for nil input' do
      e = _ { impact.string_from_impact(nil) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'nil'
    end

    # Resilience: String "abc".to_f == 0.0 would silently return "none" without
    # the Numeric type guard in assert_type!. Must raise ImpactError instead.
    it 'raises ImpactError (not silent "none") for String input' do
      e = _ { impact.string_from_impact('abc') }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'String'
    end

    # Resilience: Hash input must raise ImpactError via assert_type!, not raw NoMethodError.
    it 'raises ImpactError (not NoMethodError) for Hash input' do
      e = _ { impact.string_from_impact({ score: 0.5 }) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'Hash'
    end
  end

  describe 'strict_numeric_mode flag (Walk Ex13)' do
    # Restore default after each test so other tests are unaffected.
    def teardown
      Inspec::Impact.strict_numeric_mode = false
    end

    # --- OFF mode (default) ---

    # Arrange: flag OFF (default); Act: pass numeric string; Assert: passthrough unchanged
    it 'is OFF by default — numeric strings pass through unchanged' do
      _(impact.strict_numeric_mode?).must_equal false
      _(impact.impact_from_string('0.5')).must_equal '0.5'
    end

    # Arrange: flag OFF; Act: pass Numeric (not string); Assert: passthrough (Numeric always allowed)
    it 'OFF mode — real Numeric values always pass through (not affected by flag)' do
      impact.strict_numeric_mode = false
      _(impact.impact_from_string(0.7)).must_equal 0.7
    end

    # Arrange: flag OFF; Act: pass named severity; Assert: resolves to Float (unchanged)
    it 'OFF mode — named severities still resolve correctly' do
      impact.strict_numeric_mode = false
      _(impact.impact_from_string('critical')).must_equal 0.9
    end

    # --- ON mode ---

    # Arrange: flag ON; Act: pass numeric string; Assert: raises ImpactError (strict rejection)
    it 'ON mode — rejects numeric strings with ImpactError' do
      impact.strict_numeric_mode = true
      e = _ { impact.impact_from_string('0.7') }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'strict numeric mode'
      _(e.message).must_include '0.7'
    end

    # Arrange: flag ON; Act: pass real Numeric (not string); Assert: passes through (only strings blocked)
    it 'ON mode — real Numeric values are NOT rejected (only String numerics are blocked)' do
      impact.strict_numeric_mode = true
      _(impact.impact_from_string(0.7)).must_equal 0.7
    end

    # Arrange: flag ON; Act: pass named severity; Assert: resolves correctly (flag only affects numeric strings)
    it 'ON mode — named severities still resolve correctly' do
      impact.strict_numeric_mode = true
      _(impact.impact_from_string('high')).must_equal 0.7
    end

    # Arrange: flag ON; Act: pass nil; Assert: raises ImpactError from assert_type! (not strict mode guard)
    it 'ON mode — nil still raises ImpactError from assert_type! (not strict mode guard)' do
      impact.strict_numeric_mode = true
      e = _ { impact.impact_from_string(nil) }.must_raise(Inspec::ImpactError)
      _(e.message).must_include 'nil'
    end

    # --- Lifecycle: toggle ON then OFF ---

    # Arrange: toggle ON then OFF; Assert: numeric strings pass through again after disabling
    it 'can be toggled OFF after being ON — restores passthrough behaviour' do
      impact.strict_numeric_mode = true
      impact.strict_numeric_mode = false
      _(impact.impact_from_string('0.5')).must_equal '0.5'
    end

    # Arrange: flag ON; Act: WARN emitted for rejected numeric string
    it 'ON mode — emits WARN with strict_numeric_rejected reason' do
      impact.strict_numeric_mode = true
      warns = capture_warns { _ { impact.impact_from_string('0.5') }.must_raise(Inspec::ImpactError) }
      _(warns).wont_be_empty
      _(warns.first).must_include '"strict_numeric_rejected"'
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

  describe 'observability — WARN hooks (Walk Ex9)' do
    # capture_warns is defined in the outer describe scope (shared helper).

    # Ensure toggle is restored after each test in this group.
    def teardown
      Inspec::Impact.logging_enabled = true
    end

    # --- boundary-score WARN ---

    # Arrange: exact boundary score 0.7 (high band minimum); Act: string_from_impact;
    # Assert: WARN emitted with reason=boundary_score AND correct name returned.
    it 'emits WARN with boundary_score reason for exact high boundary 0.7' do
      warns = capture_warns { _(impact.string_from_impact(0.7)).must_equal 'high' }
      _(warns).wont_be_empty
      _(warns.first).must_include '"boundary_score"'
    end

    # Arrange: mid-band score 0.75 (not on a boundary); Act: string_from_impact;
    # Assert: no WARN emitted (boundary check skipped for non-boundary values).
    it 'does NOT emit WARN for mid-band score 0.75' do
      warns = capture_warns { _(impact.string_from_impact(0.75)).must_equal 'high' }
      boundary_warns = warns.select { |w| w.include?('boundary_score') }
      _(boundary_warns).must_be_empty
    end

    # --- error-path WARN ---

    # Arrange: invalid severity name; Act: impact_from_string raises ImpactError;
    # Assert: WARN emitted with reason=invalid_severity_name BEFORE the raise.
    it 'emits WARN with invalid_severity_name reason before raising ImpactError' do
      warns = capture_warns { _ { impact.impact_from_string('bogus') }.must_raise(Inspec::ImpactError) }
      _(warns).wont_be_empty
      _(warns.first).must_include '"invalid_severity_name"'
    end

    # Arrange: out-of-range score; Act: string_from_impact raises ImpactError;
    # Assert: WARN emitted with reason=out_of_range.
    it 'emits WARN with out_of_range reason before raising ImpactError' do
      warns = capture_warns { _ { impact.string_from_impact(99) }.must_raise(Inspec::ImpactError) }
      _(warns).wont_be_empty
      _(warns.first).must_include '"out_of_range"'
    end

    # Arrange: logging_enabled OFF; Act: string_from_impact at boundary;
    # Assert: no WARN emitted — toggle suppresses warn_impact too.
    it 'does NOT emit WARN when logging_enabled is OFF' do
      impact.logging_enabled = false
      warns = capture_warns { impact.string_from_impact(0.7) }
      _(warns).must_be_empty
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
