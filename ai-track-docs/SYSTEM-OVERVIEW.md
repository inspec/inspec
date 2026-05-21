# InSpec – System Overview

> **Version tracked:** 5.24.10  
> **Last reviewed:** 2026-05-20

Repo Summary


Languages

┌─────────────────┬─────────────┬──────────────────────────────────────────────┐
│ Language        │ Files       │ Role                                         │
├─────────────────┼─────────────┼──────────────────────────────────────────────┤
│ Ruby            │ 1,068 .rb   │ 100% of application logic                    │
├─────────────────┼─────────────┼──────────────────────────────────────────────┤
│ Markdown        │ 557 .md     │ Docs (docs-chef-io/, dev-docs/, READMEs)     │
├─────────────────┼─────────────┼──────────────────────────────────────────────┤
│ YAML            │ 288 .yml    │ CI pipelines, fixtures, metadata             │
├─────────────────┼─────────────┼──────────────────────────────────────────────┤
│ ERB             │ 29          │ Report templates                             │
├─────────────────┼─────────────┼──────────────────────────────────────────────┤
│ Shell / PS1     │ 18          │ Packaging scripts (Habitat, Omnibus)         │
└─────────────────┴─────────────┴──────────────────────────────────────────────┘

-----------------------------------------------------------------------------------------------------------------------------------------------------

Entry Points

┌───────────────────┬─────────────────────────────────────┬──────────────────────────────────────────────────────────┐
│ Entry Point       │ File                                │ What it does                                             │
├───────────────────┼─────────────────────────────────────┼──────────────────────────────────────────────────────────┤
│ CLI               │ lib/inspec/cli.rb (600 LOC)         │ Defines all Thor commands (exec, check, shell, …)        │
├───────────────────┼─────────────────────────────────────┼──────────────────────────────────────────────────────────┤
│ Option groups     │ lib/inspec/base_cli.rb (393 LOC)    │ Shared CLI options (target_options, exec_options, …)     │
├───────────────────┼─────────────────────────────────────┼──────────────────────────────────────────────────────────┤
│ Runner            │ lib/inspec/runner.rb (368 LOC)      │ Orchestrates profile load → control eval → reporting     │
├───────────────────┼─────────────────────────────────────┼──────────────────────────────────────────────────────────┤
│ Profile           │ lib/inspec/profile.rb (1,241 LOC)   │ Profile resolution, fetching, metadata validation        │
├───────────────────┼─────────────────────────────────────┼──────────────────────────────────────────────────────────┤
│ Config            │ lib/inspec/config.rb (589 LOC)      │ Merges CLI flags + config file + defaults                │
└───────────────────┴─────────────────────────────────────┴──────────────────────────────────────────────────────────┘

-----------------------------------------------------------------------------------------------------------------------------------------------------

Test Approach

 - Framework: Minitest (describe/it + expectation syntax), with some legacy RSpec
 - Unit tests (test/unit/) — isolated, use MockLoader to fake backends; 166 resource tests plus core module tests
 - Functional tests (test/functional/) — spawn real inspec process against fixture profiles; cover CLI behaviour end-to-end
 - Integration tests (test/integration/) — require a live target (Docker/VM); run separately via rake test:integration
 - Coverage: SimpleCov, configured in test/helper.rb

-----------------------------------------------------------------------------------------------------------------------------------------------------

3 Low-Risk Modules

┌───┬──────────────────┬───────────────────────────────┬─────┬──────────────────────────────────────────┬────────────────────────────────────────┐
│ # │ Module           │ File                          │ LOC │ Tests                                    │ Churn                                  │
├───┼──────────────────┼───────────────────────────────┼─────┼──────────────────────────────────────────┼────────────────────────────────────────┤
│ 1 │ ini resource     │ lib/inspec/resources/ini.rb   │ 27  │ test/unit/resources/ini_test.rb          │ 3 commits, last was a style-only pass  │
├───┼──────────────────┼───────────────────────────────┼─────┼──────────────────────────────────────────┼────────────────────────────────────────┤
│ 2 │ csv resource     │ lib/inspec/resources/csv.rb   │ 84  │ test/unit/resources/csv_test.rb (59      │ 5 commits, last meaningful change was  │
│   │                  │                               │     │ lines)                                   │ resource_id addition                   │
├───┼──────────────────┼───────────────────────────────┼─────┼──────────────────────────────────────────┼────────────────────────────────────────┤
│ 3 │ Inspec::UI       │ lib/inspec/ui.rb              │ 224 │ test/unit/ui_test.rb — self-contained,   │ Low churn; last real change was        │
│   │                  │                               │     │ uses StringIO mock                       │ exit-code addition                     │
└───┴──────────────────┴───────────────────────────────┴─────┴──────────────────────────────────────────┴────────────────────────────────────────┘

-----------------------------------------------------------------------------------------------------------------------------------------------------

⭐ Recommendation: lib/inspec/resources/ini.rb

Why it's the lowest-risk module in the codebase:

 1. Tiny surface area — 27 LOC, 2 methods. The entire file fits on one screen.
 2. Zero downstream dependents — only 1 internal require reference; nothing in core imports it.
 3. Pure parsing logic — reads a file via the backend, parses with Ruby's stdlib IniFile. No network calls, no state mutation, no side effects.
 4. Self-contained test — ini_test.rb uses MockLoader with a fixture file, so tests run fully offline in milliseconds.
 5. Negligible churn — 3 commits ever, the last two were automated style passes (chefstyle -a). No one has touched the logic in years.
 6. Easy to verify — bundle exec ruby -Ilib -Itest test/unit/resources/ini_test.rb gives instant pass/fail feedback.
