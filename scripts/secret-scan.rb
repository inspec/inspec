#!/usr/bin/env ruby
# frozen_string_literal: true

# scripts/secret-scan.rb
#
# Lightweight secret pattern scanner for the GHCP track files.
# No external tools required — pure Ruby regex checks.
#
# Complements the CI gitleaks job with a fast local pre-commit check.
#
# Usage:
#   ruby scripts/secret-scan.rb              # scan track files
#   ruby scripts/secret-scan.rb lib/ test/   # scan specific dirs
#
# Exit codes:
#   0 — no findings
#   1 — one or more high-confidence findings

REPO_ROOT = File.expand_path('..', __dir__)

# Patterns are ordered highest-confidence first.
# Each entry: [id, regex, description]
PATTERNS = [
  ['AWS_ACCESS_KEY',    /AKIA[A-Z0-9]{16}/,                           'AWS access key ID'],
  ['AWS_SECRET_KEY',    /(?i)aws.{0,20}secret.{0,20}[=:]\s*[A-Za-z0-9\/+=]{40}/, 'AWS secret key'],
  ['GITHUB_TOKEN',      /ghp_[A-Za-z0-9]{36}/,                        'GitHub personal access token'],
  ['GITHUB_OAUTH',      /gho_[A-Za-z0-9]{36}/,                        'GitHub OAuth token'],
  ['GITLAB_TOKEN',      /glpat-[A-Za-z0-9\-_]{20}/,                   'GitLab personal access token'],
  ['STRIPE_KEY',        /sk_live_[A-Za-z0-9]{24}/,                     'Stripe live secret key'],
  ['PRIVATE_KEY_BLOCK', /-----BEGIN\s+(RSA|EC|DSA|OPENSSH) PRIVATE/,   'Private key block'],
  ['JWT_TOKEN',         /eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]+/, 'JWT token'],
  ['GENERIC_SECRET',    /(?i)(secret|password|passwd|token|api.?key)\s*[=:]\s*["']?[A-Za-z0-9\/+=_\-]{16,}["']?/, 'Generic high-entropy secret assignment'],
].freeze

# Files/dirs to skip (fixtures with intentional mock data, etc.)
SKIP_PATHS = [
  'test/fixtures/cmd',
  'test/fixtures/profiles',
  'coverage/',
  'vendor/',
  '.git/',
  'node_modules/',
].freeze

# Default scan targets (track-owned files)
DEFAULT_TARGETS = %w[
  lib/inspec/impact.rb
  test/unit/impact_test.rb
  test/contract/impact_contract_test.rb
  test/fixtures/impact_scores_golden.json
  scripts/
  ai-track-docs/
  .copilot-track/
  .gitleaks.toml
].freeze

def scan_file(path)
  findings = []
  return findings unless File.file?(path)
  return findings if SKIP_PATHS.any? { |skip| path.include?(skip) }
  return findings unless path.match?(/\.(rb|json|yml|yaml|toml|md|sh|txt)\z/i) || File.basename(path) == '.env'

  File.open(path).each_line.with_index(1) do |line, lineno|
    PATTERNS.each do |id, regex, desc|
      next unless line.match?(regex)

      findings << { file: path, line: lineno, rule: id, desc: desc, content: line.chomp }
    end
  end
  findings
end

def collect_files(targets)
  targets.flat_map do |target|
    full = File.join(REPO_ROOT, target)
    if File.directory?(full)
      Dir.glob(File.join(full, '**', '*')).select { |f| File.file?(f) }
    else
      [full]
    end
  end
end

targets = ARGV.empty? ? DEFAULT_TARGETS : ARGV
files   = collect_files(targets)
all_findings = files.flat_map { |f| scan_file(f) }

# ── Filter known-safe patterns (documented allowlist) ────────────────────────
ALLOWLIST = [
  # security.md discusses secret *names*, not values — every match is documentation
  ->(f) { f[:file].end_with?('security.md') },
  # GENERIC_SECRET firing on "option :token" or "option :password" in CLI code
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:content].include?('option') },
  # GENERIC_SECRET firing on RuboCop test assertions
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:content].include?('must_include') },
  # GENERIC_SECRET firing on desc/documentation strings
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:content].match?(/desc|#|\/\//) },
  # GENERIC_SECRET in gitleaks config itself (pattern definitions)
  ->(f) { f[:file].end_with?('.gitleaks.toml') },
  # users.rb: `passwd` is a local var holding parsed /etc/passwd struct, not a credential
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:file].end_with?('users.rb') && f[:content].include?('parse_passwd_line') },
  # compliance README: `mycompliancetoken` is an explicit documentation placeholder
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:file].include?('inspec-compliance') && f[:content].include?('mycompliancetoken') },
  # compliance api.rb: reads token FROM config — no hardcoded value
  ->(f) { f[:rule] == 'GENERIC_SECRET' && f[:file].include?('inspec-compliance') && f[:content].include?('config[') },
].freeze

real_findings = all_findings.reject { |f| ALLOWLIST.any? { |rule| rule.call(f) } }

# ── Report ────────────────────────────────────────────────────────────────────
puts "Secret scan — #{files.size} files checked, #{all_findings.size} raw matches, " \
     "#{all_findings.size - real_findings.size} suppressed by allowlist"
puts

if real_findings.empty?
  puts '✅  No high-confidence findings. Scan clean.'
  exit 0
else
  real_findings.each do |f|
    rel = f[:file].sub("#{REPO_ROOT}/", '')
    puts "❌  #{f[:rule]} #{rel}:#{f[:line]}"
    puts "    Rule: #{f[:desc]}"
    puts "    Line: #{f[:content][0, 120]}"
    puts
  end
  puts "#{real_findings.size} finding(s) require review."
  exit 1
end
