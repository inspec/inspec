#!/usr/bin/env bash
# scripts/crawl-track-test.sh
#
# Crawl Track local test runner for lib/inspec/impact.rb
#
# Usage:
#   bash scripts/crawl-track-test.sh           # run all checks
#   bash scripts/crawl-track-test.sh --fast    # unit tests only (skip lint)
#
# Requirements:
#   - Ruby >= 3.1 (uses whichever 'ruby' is on PATH)
#   - minitest gem available to that Ruby
#   - No bundler/full-stack needed — impact.rb is pure Ruby
#
# Exit codes:
#   0  all checks passed
#   1  one or more checks failed

set -euo pipefail

FAST=${1:-""}
RUBY="${RUBY_BIN:-ruby}"
PASS=0
FAIL=0

# ─── colour helpers ────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'; NC='\033[0m'
ok()   { echo -e "${GREEN}✔ $*${NC}"; ((PASS++)) || true; }
fail() { echo -e "${RED}✘ $*${NC}";   ((FAIL++)) || true; }
info() { echo -e "${YELLOW}▶ $*${NC}"; }

# ─── 0. sanity: ruby version ───────────────────────────────────────────────────
info "Ruby: $($RUBY --version)"
RUBY_MAJOR=$($RUBY -e 'puts RUBY_VERSION.split(".").first.to_i')
if [[ $RUBY_MAJOR -lt 3 ]]; then
  fail "Ruby >= 3.0 required (found $($RUBY --version))"
  exit 1
fi
ok "Ruby version OK"

# ─── 1. impact.rb unit tests ───────────────────────────────────────────────────
info "Running Inspec::Impact unit tests (standalone, no bundler)..."

# Locate minitest — try stdlib path first, then gem path
MINITEST_LIB=$($RUBY -e "
  # Try gem-installed minitest
  begin
    require 'minitest'
    puts \$LOAD_PATH.find { |p| File.exist?(File.join(p, 'minitest', 'autorun.rb')) }
  rescue LoadError
    # Fall back to stdlib location
    puts File.join(RbConfig::CONFIG['rubylibdir'], '..', 'gems')
  end
" 2>/dev/null || echo "")

UNIT_OUTPUT=$(RUBYLIB="${MINITEST_LIB}:lib" $RUBY --disable-gems \
  -I lib -e "
require 'minitest/autorun'
require 'inspec/errors'

DEBUG_LINES = []
module Inspec
  module Log
    def self.debug?() = true
    def self.debug(msg) = DEBUG_LINES << msg
    def self.warn(msg) = nil
  end
end
require 'inspec/impact'

describe 'Inspec::Impact' do
  let(:i) { Inspec::Impact }
  before  { DEBUG_LINES.clear }

  # impact_from_string — happy paths
  it('none->0.0')    { _(i.impact_from_string('none')).must_equal 0.0 }
  it('low->0.1')     { _(i.impact_from_string('low')).must_equal 0.1 }
  it('medium->0.4')  { _(i.impact_from_string('medium')).must_equal 0.4 }
  it('high->0.7')    { _(i.impact_from_string('high')).must_equal 0.7 }
  it('critical->0.9'){ _(i.impact_from_string('critical')).must_equal 0.9 }
  it('HIGH->0.7')    { _(i.impact_from_string('HIGH')).must_equal 0.7 }
  it('passthrough')  { _(i.impact_from_string('0.5')).must_equal '0.5' }

  # impact_from_string — error paths
  it 'raises on unknown name' do
    e = _ { i.impact_from_string('fake') }.must_raise(Inspec::ImpactError)
    _(e.message).must_include 'fake'
  end
  it 'raises on nil input' do
    e = _ { i.impact_from_string(nil) }.must_raise(Inspec::ImpactError)
    _(e.message).must_include 'nil'
  end

  # string_from_impact — happy paths
  it('0.1->low')      { _(i.string_from_impact(0.1)).must_equal 'low' }
  it('0.57->medium')  { _(i.string_from_impact(0.57)).must_equal 'medium' }
  it('0.7->high')     { _(i.string_from_impact(0.7)).must_equal 'high' }
  it('1->critical')   { _(i.string_from_impact(1)).must_equal 'critical' }
  it('0.0->none')     { _(i.string_from_impact(0.0)).must_equal 'none' }

  # string_from_impact — error paths
  it 'raises on out-of-range' do
    _ { i.string_from_impact(99) }.must_raise(Inspec::ImpactError)
  end
  it 'raises on nil input' do
    _ { i.string_from_impact(nil) }.must_raise(Inspec::ImpactError)
  end

  # structured logging
  it 'logs op/status/elapsed_ms on ok path' do
    i.impact_from_string('high')
    _(DEBUG_LINES.last).must_include '\"op\":\"impact_from_string\"'
    _(DEBUG_LINES.last).must_include '\"status\":\"ok\"'
    _(DEBUG_LINES.last).must_include '\"elapsed_ms\"'
  end
  it 'logs status=error for bad input' do
    _ { i.impact_from_string('bad') }.must_raise(Inspec::ImpactError)
    _(DEBUG_LINES.last).must_include '\"status\":\"error\"'
  end

  # number?
  it('int true')   { _(i.number?('1')).must_equal true }
  it('float true') { _(i.number?('3.14')).must_equal true }
  it('chars false'){ _(i.number?('abc')).must_equal false }
  it('nil false')  { _(i.number?(nil)).must_equal false }
end
" 2>&1)

if echo "$UNIT_OUTPUT" | grep -qE "0 failures, 0 errors"; then
  RUNS=$(echo "$UNIT_OUTPUT" | grep -oE '[0-9]+ runs' | head -1)
  ok "Unit tests passed ($RUNS)"
else
  fail "Unit tests FAILED"
  echo "$UNIT_OUTPUT" | tail -30
fi

# ─── 2. lint (optional, skip with --fast) ──────────────────────────────────────
if [[ "$FAST" != "--fast" ]]; then
  info "Checking frozen string literal comment in impact.rb..."
  if head -3 lib/inspec/impact.rb | grep -q "frozen_string_literal"; then
    ok "frozen_string_literal present"
  else
    fail "frozen_string_literal comment missing from lib/inspec/impact.rb"
  fi

  info "Checking for bare 'rescue' (should use explicit exception types)..."
  if grep -n "^\s*rescue$" lib/inspec/impact.rb > /dev/null 2>&1; then
    fail "Bare 'rescue' found — use explicit exception types"
  else
    ok "No bare rescue found"
  fi
fi

# ─── summary ──────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────"
if [[ $FAIL -eq 0 ]]; then
  echo -e "${GREEN}All $PASS checks passed${NC}"
  exit 0
else
  echo -e "${RED}$FAIL check(s) failed, $PASS passed${NC}"
  exit 1
fi
