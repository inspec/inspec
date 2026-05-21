# Walk Track — PR Template

Copy this block into every Walk PR description.
See `scripts/pr-review-focus.rb` to auto-generate the Review Focus section from git diff.

---

**Title: GHCP -- Walk: \<ex#\> \<name\>**

## Summary
- What changed and why (1–3 lines)
- Plan: \<link to plan or inline summary\>
- Files/paths touched

## Evidence
- Tests/logs/metrics: \<commands + output summary\>
- Coverage: \<percentage or contract evidence\>

## Risk & Rollback
- Risk: low / medium / high
- Rollback: `git revert <commit SHA>` (or `toggle <flag>` / `pin back <gem>=<prev_version>`)

## Review Focus

> 3–5 bullets. Each bullet: **what** to look at + **why** it matters + **how** to verify.

- [ ] **\<area 1\>** — \<what changed and why it's the key risk\>
  - Verify: `<command reviewer can run>`
- [ ] **\<area 2\>** — \<correctness / edge-case concern\>
  - Verify: `<command reviewer can run>`
- [ ] **\<area 3\>** — \<side-effects or coupling to other code\>
  - Verify: `<command reviewer can run>`

## Verification Steps (reviewer checklist)

```bash
# 1. Clone branch and install deps
git checkout <branch>
gem install minitest -v '~> 6.0'

# 2. Run unit + contract tests
RUBY_BIN=$(which ruby) bash scripts/crawl-track-test.sh
ruby -I lib test/contract/impact_contract_test.rb

# 3. Run coverage
ruby scripts/coverage-impact.rb   # expect ≥ 75%

# 4. Lint
rubocop lib/inspec/impact.rb test/unit/impact_test.rb --format simple
```

## Track
- Level: Walk
- Exercise: \<ex#\>
- Evidence: \<logs / coverage % / diagram link / doc path\>
