#!/usr/bin/env ruby
# frozen_string_literal: true

# scripts/update-impact-contract.rb
#
# Regenerates test/fixtures/impact_scores_golden.json from the current
# IMPACT_SCORES constant in lib/inspec/impact.rb.
#
# == When to run
#   Run this ONLY when you have intentionally changed IMPACT_SCORES (e.g.
#   added a new severity level or adjusted a threshold). Always review the
#   diff before committing.
#
# == Usage
#   ruby scripts/update-impact-contract.rb
#
# == Workflow
#   1. Edit IMPACT_SCORES in lib/inspec/impact.rb.
#   2. ruby scripts/update-impact-contract.rb
#   3. git diff test/fixtures/impact_scores_golden.json  # review change
#   4. git add lib/inspec/impact.rb test/fixtures/impact_scores_golden.json
#   5. git commit -s -m "feat: update CVSS severity mapping + contract"

$LOAD_PATH.reject! { |p| p.include?('/.rvm/') }
# Also reset Gem paths so Rubygems doesn't activate the incompatible RVM json gem.
if defined?(Gem)
  rvm_free = Gem.paths.path.reject { |p| p.include?('/.rvm/') }
  home = Gem.paths.home.include?('/.rvm/') ? rvm_free.first.to_s : Gem.paths.home
  Gem.paths = { 'GEM_HOME' => home, 'GEM_PATH' => rvm_free.join(File::PATH_SEPARATOR) }
end
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'json'
require 'inspec/errors'
require 'inspec/impact'

GOLDEN_PATH = File.expand_path('../test/fixtures/impact_scores_golden.json', __dir__)

old_data = File.exist?(GOLDEN_PATH) ? JSON.parse(File.read(GOLDEN_PATH)) : {}

new_data = {
  'contract_version' => old_data.fetch('contract_version', '1.0'),
  'description'      => old_data.fetch('description',
    'CVSS 3.0 severity name → minimum score mapping for Inspec::Impact. ' \
    'This file is the authoritative contract for the IMPACT_SCORES constant. ' \
    'Any intentional change MUST be accompanied by a regeneration of this file ' \
    '(see scripts/update-impact-contract.rb).'),
  'scores'           => Inspec::Impact::IMPACT_SCORES.transform_keys(&:to_s),
  'method_contracts' => old_data.fetch('method_contracts', {})
}

File.write(GOLDEN_PATH, JSON.pretty_generate(new_data) + "\n")

puts "Updated #{GOLDEN_PATH}"
puts "Scores now:"
new_data['scores'].each { |name, score| puts "  #{name.ljust(10)} #{score}" }
puts
puts "Review the diff, then commit both files together:"
puts "  git diff #{GOLDEN_PATH}"
