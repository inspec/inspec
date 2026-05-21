#!/usr/bin/env ruby
# frozen_string_literal: true

# scripts/pr-review-focus.rb
#
# Generates review focus bullets and verification steps for a Walk track PR
# by analysing the git diff for lib/inspec/impact.rb.
#
# Usage:
#   ruby scripts/pr-review-focus.rb                  # diff against HEAD~1
#   ruby scripts/pr-review-focus.rb HEAD~3..HEAD      # custom range
#   ruby scripts/pr-review-focus.rb --full            # include full PR template
#
# Output is printed to stdout; paste into your PR description.

IMPACT_FILE = 'lib/inspec/impact.rb'
TEST_FILE   = 'test/unit/impact_test.rb'

CATEGORY_PATTERNS = [
  { category: :constants,    pattern: /^\+.*[A-Z_]{3,}\s*=/, label: 'constant/data change' },
  { category: :public_api,   pattern: /^\+.*def self\.(impact_from_string|string_from_impact|number\?)/, label: 'public API change' },
  { category: :guard,        pattern: /^\+.*assert_type!|ImpactError/, label: 'type guard / error path' },
  { category: :logging,      pattern: /^\+.*(log_impact|warn_impact|BOUNDARY_SCORES|logging_enabled)/, label: 'observability / logging hook' },
  { category: :private_api,  pattern: /^\+.*private_class_method|def self\.[a-z]/, label: 'private helper change' },
  { category: :tests_added,  pattern: /^\+.*it ['"]/, label: 'new test cases' },
  { category: :frozen,       pattern: /^\+.*frozen_string_literal/, label: 'string literal freeze' },
].freeze

VERIFY_COMMANDS = {
  constants:   'ruby -e "require_relative \'lib/inspec/impact\'; p Inspec::Impact::IMPACT_SCORES"',
  public_api:  'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh',
  guard:       'ruby -I lib -e "require \'inspec/impact\'; Inspec::Impact.impact_from_string(nil) rescue puts $!.class"',
  logging:     'ruby -I lib -e "require \'inspec/log\'; require \'inspec/impact\'; Inspec::Log.level = :warn; Inspec::Impact.string_from_impact(0.7)" 2>&1',
  private_api: 'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh',
  tests_added: 'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh',
  frozen:      'ruby -c lib/inspec/impact.rb',
}.freeze

def run_git_diff(range)
  `git diff #{range} -- #{IMPACT_FILE} #{TEST_FILE} 2>/dev/null`
end

def detect_categories(diff)
  added_lines = diff.lines.select { |l| l.start_with?('+') && !l.start_with?('+++') }
  CATEGORY_PATTERNS.filter_map do |entry|
    matching = added_lines.select { |l| l.match?(entry[:pattern]) }
    next if matching.empty?

    { **entry, matches: matching.first(3) }
  end
end

def commit_sha
  `git log --format=%H -1`.strip[0, 12]
end

def branch_name
  `git branch --show-current`.strip
end

def changed_files(range)
  `git diff --name-only #{range} 2>/dev/null`.split
end

def generate_review_bullets(categories, diff_stat)
  bullets = []

  categories.each do |cat|
    case cat[:category]
    when :constants
      bullets << {
        area: 'IMPACT_SCORES / constant values',
        concern: 'Any change to IMPACT_SCORES or BOUNDARY_SCORES affects contract tests and '\
                 'all severity lookups — the most critical data in this module.',
        verify: VERIFY_COMMANDS[:constants]
      }
    when :public_api
      bullets << {
        area: 'Public API behaviour (`impact_from_string` / `string_from_impact`)',
        concern: 'Public method changes can silently break callers. Check round-trip '\
                 'invariants: `impact_from_string(string_from_impact(0.5)) == 0.5`.',
        verify: 'ruby -I lib -e "require \'inspec/impact\'; p Inspec::Impact.string_from_impact(Inspec::Impact.impact_from_string(\'high\'))"'
      }
    when :guard
      bullets << {
        area: 'Error handling / type guards (`assert_type!` / `ImpactError`)',
        concern: 'Guard changes control what input is accepted. Verify nil, wrong type, and '\
                 'boundary inputs still raise `Inspec::ImpactError` (never raw Ruby errors).',
        verify: VERIFY_COMMANDS[:guard]
      }
    when :logging
      bullets << {
        area: 'Observability hooks (`warn_impact` / `log_impact` / `BOUNDARY_SCORES`)',
        concern: 'WARN hooks fire at INFO log level — visible without debug mode. Verify '\
                 'the toggle suppresses output and mid-band scores do NOT trigger WARN.',
        verify: VERIFY_COMMANDS[:logging]
      }
    when :private_api
      bullets << {
        area: 'Private helpers (`assert_type!` / `number?` / `json_value` etc.)',
        concern: 'Private method changes should be behaviour-preserving. Run full suite '\
                 'to confirm no unit test regressions.',
        verify: VERIFY_COMMANDS[:private_api]
      }
    when :tests_added
      bullets << {
        area: 'New test cases',
        concern: 'Ensure tests are deterministic (no random data, no time-dependent assertions). '\
                 'Check that each test has a clear Arrange-Act-Assert structure.',
        verify: 'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh 2>&1 | grep "runs\|checks passed"'
      }
    end
  end

  # Always include coverage and contract bullets
  bullets << {
    area: 'Coverage delta',
    concern: "Confirm coverage for `impact.rb` stays ≥ 75% (baseline 81.71%). "\
             "Any new branch added without a test will show as a gap.",
    verify: 'ruby scripts/coverage-impact.rb 2>&1 | grep "impact.rb line coverage"'
  }

  bullets << {
    area: 'Contract golden file',
    concern: 'If `IMPACT_SCORES` changed, the golden file must be regenerated. '\
             'Contract tests will fail otherwise.',
    verify: 'ruby -I lib test/contract/impact_contract_test.rb'
  }

  bullets.first(5) # cap at 5 per Walk discipline
end

def format_output(bullets, categories, range, full_template)
  sha      = commit_sha
  branch   = branch_name
  files    = changed_files(range)
  n_cats   = categories.map { |c| c[:label] }.join(', ')

  lines = []
  lines << "<!-- Generated by scripts/pr-review-focus.rb | #{Time.now.strftime('%Y-%m-%dT%H:%M:%S')} -->"
  lines << ''

  if full_template
    lines << '## Summary'
    lines << "- **Branch:** `#{branch}`"
    lines << "- **What changed:** #{n_cats.empty? ? '(describe here)' : n_cats}"
    lines << "- **Files touched:** #{files.map { |f| "`#{f}`" }.join(', ')}"
    lines << ''
    lines << '## Evidence'
    lines << '```'
    lines << 'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh'
    lines << 'ruby scripts/coverage-impact.rb'
    lines << '```'
    lines << '> Paste actual output here before submitting.'
    lines << ''
    lines << '## Risk & Rollback'
    lines << '- Risk: low'
    lines << "- Rollback: `git revert #{sha}`"
    lines << ''
  end

  lines << '## Review Focus'
  lines << ''
  lines << '> Auto-generated from `git diff`. Review and adjust before submitting.'
  lines << ''

  bullets.each_with_index do |b, i|
    lines << "- [ ] **#{b[:area]}** — #{b[:concern]}"
    lines << "  - Verify: `#{b[:verify]}`"
    lines << '' if i < bullets.size - 1
  end

  lines << ''
  lines << '## Verification Steps (reviewer checklist)'
  lines << ''
  lines << '```bash'
  lines << "git checkout #{branch}"
  lines << 'gem install minitest -v "~> 6.0" --no-document'
  lines << ''
  lines << '# Run all track checks'
  lines << 'RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh'
  lines << ''
  lines << '# Run contract tests'
  lines << 'ruby -I lib test/contract/impact_contract_test.rb'
  lines << ''
  lines << '# Check coverage'
  lines << 'ruby scripts/coverage-impact.rb'
  lines << ''
  lines << '# Lint'
  lines << 'rubocop lib/inspec/impact.rb test/unit/impact_test.rb --format simple'
  lines << '```'

  unless full_template
    lines << ''
    lines << '## Risk & Rollback'
    lines << "- Rollback: `git revert #{sha}`"
  end

  lines.join("\n")
end

# --- main ---

range       = ARGV.reject { |a| a.start_with?('--') }.first || 'HEAD~1..HEAD'
full_mode   = ARGV.include?('--full')

diff = run_git_diff(range)

if diff.empty?
  warn "No diff found for range '#{range}' on #{IMPACT_FILE} / #{TEST_FILE}."
  warn 'Make sure you have committed your changes, or provide a custom range.'
  exit 1
end

categories = detect_categories(diff)
bullets    = generate_review_bullets(categories, diff)

puts format_output(bullets, categories, range, full_mode)
