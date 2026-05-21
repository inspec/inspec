#!/usr/bin/env ruby
# frozen_string_literal: true

# scripts/coverage-impact.rb
#
# Standalone SimpleCov coverage runner for lib/inspec/impact.rb.
# Does NOT require bundler — uses rbenv gems directly.
#
# Usage:
#   ruby scripts/coverage-impact.rb
#   RUBY_BIN=/path/to/ruby ruby scripts/coverage-impact.rb
#
# Output:
#   - Coverage summary printed to stdout
#   - JSON report written to coverage/impact/coverage.json
#   - Exits non-zero if coverage < MIN_COVERAGE

MIN_COVERAGE = 75 # percent — alert if impact.rb drops below this baseline (79.71% at Ex15)

REPO_ROOT  = File.expand_path("..", __dir__)
SCRIPT_DIR = __dir__

require "simplecov"
require "simplecov_json_formatter"

SimpleCov.start do
  enable_coverage :branch
  command_name "coverage-impact"
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::SimpleFormatter,
    SimpleCov::Formatter::JSONFormatter,
  ])
  coverage_dir File.join(REPO_ROOT, "coverage", "impact")
  add_filter "/test/"
  add_filter "/scripts/"
  track_files File.join(REPO_ROOT, "lib/inspec/impact.rb")
end

# ── Load subject under test ───────────────────────────────────────────────────
$LOAD_PATH.unshift(File.join(REPO_ROOT, "lib"))
require "inspec/errors"
require "inspec/impact"

# ── Inline Minitest suite (mirrors impact_test.rb) ───────────────────────────
require "minitest/autorun"

describe "Inspec::Impact coverage run" do
  let(:i) { Inspec::Impact }

  # impact_from_string — named severities
  it { _(i.impact_from_string("none")).must_equal 0.0 }
  it { _(i.impact_from_string("low")).must_equal 0.1 }
  it { _(i.impact_from_string("medium")).must_equal 0.4 }
  it { _(i.impact_from_string("high")).must_equal 0.7 }
  it { _(i.impact_from_string("critical")).must_equal 0.9 }
  it { _(i.impact_from_string("HIGH")).must_equal 0.7 }
  it { _(i.impact_from_string("0.5")).must_equal "0.5" }

  # impact_from_string — error paths
  it { _ { i.impact_from_string("fake") }.must_raise Inspec::ImpactError }
  it { _ { i.impact_from_string(nil) }.must_raise Inspec::ImpactError }
  it { _ { i.impact_from_string([1, 2]) }.must_raise Inspec::ImpactError }
  it { _ { i.impact_from_string(Object.new) }.must_raise Inspec::ImpactError }

  # string_from_impact — numeric scores
  it { _(i.string_from_impact(0.0)).must_equal "none" }
  it { _(i.string_from_impact(0.1)).must_equal "low" }
  it { _(i.string_from_impact(0.57)).must_equal "medium" }
  it { _(i.string_from_impact(0.7)).must_equal "high" }
  it { _(i.string_from_impact(1)).must_equal "critical" }

  # string_from_impact — error paths
  it { _ { i.string_from_impact(99) }.must_raise Inspec::ImpactError }
  it { _ { i.string_from_impact(nil) }.must_raise Inspec::ImpactError }
  it { _ { i.string_from_impact("abc") }.must_raise Inspec::ImpactError }
  it { _ { i.string_from_impact({ score: 0.5 }) }.must_raise Inspec::ImpactError }

  # number? predicate
  it { _(i.number?("1")).must_equal true }
  it { _(i.number?("10.99")).must_equal true }
  it { _(i.number?("abc")).must_equal false }

  # logging_enabled toggle
  it {
    Inspec::Impact.logging_enabled = false
    _(i.impact_from_string("high")).must_equal 0.7
    Inspec::Impact.logging_enabled = true
  }
  it { _(i.logging_enabled?).must_equal true }
end

# ── Print coverage summary after tests ───────────────────────────────────────
Minitest.after_run do
  result = SimpleCov.result
  if result
    files       = result.files
    target      = files.find { |f| f.filename.end_with?("impact.rb") }
    total_pct   = result.covered_percent.round(2)
    impact_pct  = target ? target.covered_percent.round(2) : "N/A"

    puts
    puts "─" * 50
    puts "Coverage Summary — lib/inspec/impact.rb"
    puts "─" * 50
    puts "  impact.rb line coverage : #{impact_pct}%"
    puts "  Total (tracked files)   : #{total_pct}%"
    puts "  Report                  : coverage/impact/coverage.json"
    puts "─" * 50

    if impact_pct.is_a?(Numeric) && impact_pct < MIN_COVERAGE
      puts "COVERAGE BELOW #{MIN_COVERAGE}%: #{impact_pct}% — investigate!"
      exit 1
    end
  end
end
