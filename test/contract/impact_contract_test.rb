# frozen_string_literal: true

# test/contract/impact_contract_test.rb
#
# Contract tests for the Inspec::Impact public API.
#
# These tests guard the BOUNDARY — the set of severity names, their numeric
# scores, method return types, and error types.  Unlike unit tests (which
# test behaviour), contract tests answer: "Has the interface changed?"
#
# == How to run
#   ruby -I lib test/contract/impact_contract_test.rb
#
# == How to update the contract (intentional changes only)
#   1. Make the intentional change to IMPACT_SCORES in lib/inspec/impact.rb.
#   2. Run: ruby scripts/update-impact-contract.rb
#   3. Review the diff in test/fixtures/impact_scores_golden.json.
#   4. Commit BOTH files together so the contract and the code stay in sync.

require 'minitest/autorun'

# Guard: remove RVM gem paths if running under rbenv Ruby to avoid
# loading native extensions compiled for a different Ruby version.
$LOAD_PATH.reject! { |p| p.include?('/.rvm/') }

require 'json'

$LOAD_PATH.unshift(File.expand_path('../../lib', __dir__))
require 'inspec/errors'
require 'inspec/impact'

GOLDEN_PATH = File.expand_path('../fixtures/impact_scores_golden.json', __dir__)

describe 'Inspec::Impact contract' do
  let(:golden) { JSON.parse(File.read(GOLDEN_PATH)) }
  let(:impact) { Inspec::Impact }

  # ── IMPACT_SCORES golden-file contract ───────────────────────────────────────

  describe 'IMPACT_SCORES golden file' do
    it 'has the same set of severity names as the golden file' do
      expected_names = golden['scores'].keys.sort
      actual_names   = Inspec::Impact::IMPACT_SCORES.keys.sort
      _(actual_names).must_equal expected_names
    end

    it 'has the same score for every severity name in the golden file' do
      golden['scores'].each do |name, expected_score|
        actual = Inspec::Impact::IMPACT_SCORES[name]
        _(actual).must_equal expected_score,
          "Score for '#{name}' changed: expected #{expected_score}, got #{actual}. " \
          'If this is intentional, run: ruby scripts/update-impact-contract.rb'
      end
    end

    it 'has no extra severity names beyond the golden file' do
      extra = Inspec::Impact::IMPACT_SCORES.keys - golden['scores'].keys
      assert_empty extra,
        "New severity names added without updating the contract: #{extra.inspect}. " \
        'Run: ruby scripts/update-impact-contract.rb'
    end

    it 'scores are in ascending order (lowest band first)' do
      scores = Inspec::Impact::IMPACT_SCORES.values
      assert_equal scores.sort, scores,
        'IMPACT_SCORES must remain in ascending order for string_from_impact to work correctly'
    end
  end

  # ── impact_from_string return-type contract ──────────────────────────────────

  describe 'impact_from_string return-type contract' do
    it 'returns Float for every named severity in the golden file' do
      golden['scores'].each_key do |name|
        result = impact.impact_from_string(name)
        assert_kind_of Float, result,
          "impact_from_string('#{name}') must return Float, got #{result.class}"
      end
    end

    it 'returns String (passthrough) for a numeric string input' do
      result = impact.impact_from_string('0.5')
      _(result).must_be_kind_of String
    end

    it 'returns String (passthrough) that equals the input for a numeric string' do
      _(impact.impact_from_string('0.7')).must_equal '0.7'
    end

    it 'raises Inspec::ImpactError (not TypeError/NoMethodError) for nil' do
      _ { impact.impact_from_string(nil) }.must_raise Inspec::ImpactError
    end

    it 'raises Inspec::ImpactError for an unknown severity name' do
      _ { impact.impact_from_string('extreme') }.must_raise Inspec::ImpactError
    end

    it 'raises Inspec::ImpactError (not NoMethodError) for a non-String/Numeric input' do
      _ { impact.impact_from_string([0.5]) }.must_raise Inspec::ImpactError
    end
  end

  # ── string_from_impact return-type contract ──────────────────────────────────

  describe 'string_from_impact return-type contract' do
    it 'returns String for every golden-file score' do
      golden['scores'].each_value do |score|
        result = impact.string_from_impact(score)
        assert_kind_of String, result,
          "string_from_impact(#{score}) must return String, got #{result.class}"
      end
    end

    it 'returns a severity name present in IMPACT_SCORES for every golden score' do
      golden['scores'].each_value do |score|
        result = impact.string_from_impact(score)
        assert_includes Inspec::Impact::IMPACT_SCORES.keys, result
      end
    end

    it 'raises Inspec::ImpactError (not TypeError) for nil' do
      _ { impact.string_from_impact(nil) }.must_raise Inspec::ImpactError
    end

    it 'raises Inspec::ImpactError for an out-of-range score' do
      _ { impact.string_from_impact(1.1) }.must_raise Inspec::ImpactError
    end

    it 'raises Inspec::ImpactError (not silent coercion) for a String input' do
      _ { impact.string_from_impact('high') }.must_raise Inspec::ImpactError
    end
  end

  # ── Round-trip contract ──────────────────────────────────────────────────────

  describe 'round-trip contract' do
    it 'impact_from_string → string_from_impact round-trips for all golden names' do
      golden['scores'].each do |name, score|
        via_score = impact.impact_from_string(name)   # String -> Float
        back      = impact.string_from_impact(via_score) # Float -> String
        assert_equal name, back,
          "Round-trip failed for '#{name}': " \
          "impact_from_string -> #{via_score} -> string_from_impact -> '#{back}'"
      end
    end
  end
end
