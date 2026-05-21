# Walk Track — Copilot Onboarding Prompt

> **How to use this file:** Paste the block below into Copilot Chat at the
> start of a new session to give it full context about this repo and the Walk
> track workflow. One paste is enough; no other preamble needed.

---

## Paste-Into-Chat Block

```
You are helping me work through the GHCP Walk track on the InSpec repo
(github.com/inspec/inspec). Here is everything you need to know:

### Repo in one paragraph
InSpec is an open-source Ruby infrastructure testing framework. The module
we practice on is lib/inspec/impact.rb — a pure-Ruby CVSS 3.0 severity
mapper (~195 lines). It has two public class methods (impact_from_string,
string_from_impact), a feature toggle (logging_enabled), and private
helpers (assert_type!, number?, log_impact, json_value, elapsed_ms_since).
Tests live in test/unit/impact_test.rb (27 tests, Minitest).

### Walk track rules (MUST follow)
1. Write a plan BEFORE generating any diff. List: files, reason, behaviour
   impact, test strategy, risk level.
2. Show diffs file-by-file. I review each one before you move to the next.
3. Every PR must include: plan summary, test output, coverage %, risk level,
   rollback command, and review focus.
4. Do NOT modify: Gemfile.lock, VERSION, .expeditor/, habitat/, submodules.
5. Keep changes in lib/inspec/impact.rb and test/unit/impact_test.rb unless
   the exercise explicitly requires other files.

### Branching convention
Branches: learn/walk/mohan-ex<N>-<slug>, chained from previous exercise.
Current chain: learn/walk/mohan-ex3-refactor (last pushed).

### How to run tests (no bundler needed)
  RUBY_BIN=/path/to/ruby bash scripts/crawl-track-test.sh
  # or standalone:
  /path/to/ruby -I lib test/unit/impact_test.rb

### How to run coverage
  GEM_PATH=/path/to/rbenv/gems \
  GEM_HOME=/path/to/rbenv/gems \
  /path/to/ruby scripts/coverage-impact.rb
  # Baseline: 84.75% (after Ex3)

### How to run RuboCop
  GEM_PATH=/path/to/rbenv/gems \
  /path/to/ruby $(gem contents rubocop | grep '/exe/rubocop$') \
  lib/inspec/impact.rb test/unit/impact_test.rb --format simple

### Key files
  lib/inspec/impact.rb           — practice module (primary target)
  test/unit/impact_test.rb       — 27 unit tests
  scripts/crawl-track-test.sh    — local CI (4 checks, no bundler)
  scripts/coverage-impact.rb     — standalone coverage runner
  scripts/validate-diagram.rb    — architecture diagram validator
  ai-track-docs/architecture.mmd — Mermaid diagram with real file paths
  ai-track-docs/build-test.md    — test & coverage reference
  ai-track-docs/SYSTEM-OVERVIEW.md — architecture node→path table
  .copilot-track/walk/pr-template.md — PR template for this track

### PR template (fill this for every exercise)
  Title: GHCP -- Walk: <ex#> <name>
  Summary: what changed, why, plan summary, files touched
  Evidence: test command + output; coverage %
  Risk & Rollback: risk level; revert <SHA> or toggle <flag>
  Review Focus: key areas + verification steps
  Track: Level: Walk; Exercise: <ex#>

### Suggested prompts
  Plan:  "Propose the smallest plan and diffs to meet THIS acceptance;
          list files, risks, and test plan; then show diffs file-by-file."
  Test:  "Create an Arrange-Act-Assert test for <fn> with one valid and
          one invalid case; deterministic only."
  PR:    "Fill this PR template for Exercise <id> using our changes;
          include commands, outputs, and a rollback note."
  Error: "From the last commit(s), propose 1 minimal error-handling
          improvement + a matching failure test."

Now tell me: what is the current exercise and what should I do first?
```

---

## Quick-Reference Card

| What | Where |
|------|-------|
| Practice module | `lib/inspec/impact.rb` |
| Unit tests | `test/unit/impact_test.rb` |
| Local CI | `bash scripts/crawl-track-test.sh` |
| Coverage | `ruby scripts/coverage-impact.rb` |
| Lint | `rubocop lib/inspec/impact.rb` |
| Diagram check | `ruby scripts/validate-diagram.rb` |
| PR template | `.copilot-track/walk/pr-template.md` |
| Architecture | `ai-track-docs/architecture.mmd` |
| Coverage baseline | 84.75% (after Ex3) |
| Test count | 27 passing |

## Walk Completion Checklist

Before opening each PR, verify:

- [ ] Plan written before any diff
- [ ] All changed files staged and committed with `git commit -s`
- [ ] Tests green (`crawl-track-test.sh` exits 0)
- [ ] RuboCop clean (0 offenses)
- [ ] Coverage ≥ 84% (or gap explained)
- [ ] PR description fills all five template sections
- [ ] Branch is chained from previous exercise branch
