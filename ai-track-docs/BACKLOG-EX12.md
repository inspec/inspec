# BACKLOG — Crawl Track Exercise 12

> Generated from findings across Exercises 0–11 on `lib/inspec/impact.rb` and surrounding
> infrastructure. Each item has clear acceptance criteria and a direct code link.
> Items are ordered by priority (highest first).

---

## BACK-01 · Replace exception-based `is_number?` with regex guard

**Type:** performance / refactor  
**Priority:** medium  
**Source finding:** Exercise 6 perf baseline — `is_number?` uses `Float()` raise/rescue as control flow, measured at ~817 ns/call vs ~126 ns for direct numeric input. It is called on every invocation of `impact_from_string`.

**Code link:** [`lib/inspec/impact.rb` lines 76–80](../lib/inspec/impact.rb#L76)

```ruby
# Current (slow path)
def self.is_number?(value)
  Float(value)
  true
rescue TypeError, ArgumentError
  false
end
```

**Proposed fix:**
```ruby
def self.is_number?(value)
  value.is_a?(Numeric) || value.to_s.match?(/\A[-+]?\d+(\.\d+)?\z/)
end
```

**Acceptance criteria:**
- [ ] `is_number?` no longer raises/rescues for normal string input
- [ ] `impact_from_string("0.5")`, `impact_from_string(0.7)`, `impact_from_string("high")` all return correct values
- [ ] A micro-benchmark shows ≥30% improvement for string-numeric input (e.g. `"0.5"`)
- [ ] All 22 existing tests still pass
- [ ] `ai-track-docs/perf-baseline.md` updated with new numbers

---

## BACK-02 · Add upper-bound constraint for `chef-licensing` gem

**Type:** dependency hygiene  
**Priority:** high  
**Source finding:** Exercise 7 — `inspec-core.gemspec` pins `chef-licensing >= 1.2.0` with no upper bound. The file also contains a TODO comment acknowledging an open bug in the gem.

**Code link:** [`inspec-core.gemspec` line 73](../inspec-core.gemspec#L73)

```ruby
# Current — no ceiling, could pick up a major breaking release
spec.add_dependency "chef-licensing", ">= 1.2.0"
```

**Acceptance criteria:**
- [ ] Constraint changed to `">= 1.2.0", "< 2.0"` (pessimistic lock on major version)
- [ ] `bundle install` still resolves cleanly (no version conflicts)
- [ ] Add a comment explaining the upper bound rationale (links to the TODO)
- [ ] `ai-track-docs/dependencies.md` updated with the resolved constraint

---

## BACK-03 · `string_from_impact` silently accepts out-of-range scores above 1.0

**Type:** bug / validation  
**Priority:** medium  
**Source finding:** Exercise 5 added nil validation, but during review it was observed that values such as `1.5` or `99.0` pass the `>= 0.0` check and return `"critical"` without error. The YARD docs promise `[0.0, 1.0]` but the code only checks the lower bound.

**Code link:** [`lib/inspec/impact.rb` lines 94–101](../lib/inspec/impact.rb#L94)

```ruby
# Current — only rejects value < 0.0
if value < 0.0
  ...
  raise Inspec::ImpactError, ...
end
```

**Acceptance criteria:**
- [ ] Guard changed to reject `value < 0.0 || value > 1.0`
- [ ] Error message clearly states valid range `[0.0, 1.0]`
- [ ] New tests:
  - `string_from_impact(1.001)` raises `Inspec::ImpactError`
  - `string_from_impact(99.0)` raises `Inspec::ImpactError`
  - `string_from_impact(1.0)` still returns `"critical"` (boundary OK)
- [ ] All existing tests still pass

---

## BACK-04 · Enable unit tests in main GHA CI pipeline

**Type:** ci  
**Priority:** high  
**Source finding:** Exercise 10 — `.github/workflows/ci-main-pull-request-stub.yml` delegates to `chef/common-github-actions` with `unit-tests: false` and `build: false`. Unit tests only run on the Crawl Track branch workflow and locally.

**Code link:** [`.github/workflows/ci-main-pull-request-stub.yml` lines 91–99](../.github/workflows/ci-main-pull-request-stub.yml#L91)

```yaml
# Current
unit-tests: false
build: false
```

**Acceptance criteria:**
- [ ] Investigate whether `unit-tests: true` is safe for the `chef/common-github-actions` version pinned
- [ ] If safe: flip flag and verify CI passes on a test branch
- [ ] If not safe (e.g. requires internal Buildkite access): document the blocker in `ai-track-docs/build-test.md` with a workaround note
- [ ] Either outcome results in an updated note in `ai-track-docs/build-test.md`

---

## BACK-05 · Add band-boundary tests for `string_from_impact`

**Type:** test coverage  
**Priority:** low  
**Source finding:** Exercise 3 refactored `string_from_impact` to use `reverse_each.find`. The CVSS bands share exact boundary values (e.g. `0.4` is simultaneously the top of `low` and the bottom of `medium`). No test currently exercises these exact transition points.

**Code link:** [`lib/inspec/impact.rb` lines 32–38](../lib/inspec/impact.rb#L32) (IMPACT_SCORES constant) and [`test/unit/impact_test.rb`](../test/unit/impact_test.rb)

**CVSS band boundaries to test:**
```
none   0.0 – 0.01
low    0.01 – 0.4
medium 0.4 – 0.7
high   0.7 – 0.9
critical 0.9 – 1.0
```

**Acceptance criteria:**
- [ ] Tests added for every band transition point:
  - `string_from_impact(0.0)` → `"none"` ✅ already exists
  - `string_from_impact(0.01)` → `"low"`
  - `string_from_impact(0.4)` → `"medium"` (or `"low"` — confirm expected)
  - `string_from_impact(0.7)` → `"high"` (or `"medium"` — confirm expected)
  - `string_from_impact(0.9)` → `"critical"` (or `"high"` — confirm expected)
  - `string_from_impact(1.0)` → `"critical"`
- [ ] Document the confirmed boundary semantics (inclusive/exclusive) in YARD `@param` note
- [ ] All tests deterministic (no floating-point ranges)

---

## Summary Table

| ID | Title | Type | Priority | Effort |
|----|-------|------|----------|--------|
| BACK-01 | Replace exception-based `is_number?` | perf/refactor | medium | S |
| BACK-02 | Upper-bound `chef-licensing` constraint | deps | **high** | XS |
| BACK-03 | Reject out-of-range scores > 1.0 | bug/validation | medium | S |
| BACK-04 | Enable unit tests in main GHA CI | ci | **high** | M |
| BACK-05 | Band-boundary tests for `string_from_impact` | test | low | S |

> **Effort key:** XS = < 30 min · S = 30–60 min · M = 60–90 min
