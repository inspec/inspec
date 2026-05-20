# Extending `Inspec::Impact`

**File:** `lib/inspec/impact.rb`  
**Test file:** `test/unit/impact_test.rb`

---

## What the module does

`Inspec::Impact` maps between CVSS 3.0 severity **names** (`"none"`, `"low"`, `"medium"`, `"high"`, `"critical"`) and **numeric scores** (0.0 – 1.0).

Two public methods:

| Method | Input | Output |
|--------|-------|--------|
| `impact_from_string(value)` | severity name or numeric string | Float score (or passthrough string) |
| `string_from_impact(value)` | Float score 0.0–1.0 | severity name string |

---

## How to add a new severity level

**1. Add an entry to `IMPACT_SCORES`** in `lib/inspec/impact.rb`, in ascending score order:

```ruby
IMPACT_SCORES = {
  "none"     => 0.0,
  "low"      => 0.1,
  "medium"   => 0.4,
  "high"     => 0.7,
  "critical" => 0.9,
  "extreme"  => 0.95,   # ← new entry
}.freeze
```

That's the **only code change needed**. Error messages and lookups update automatically because they use `IMPACT_SCORES.keys`.

**2. Add tests** in `test/unit/impact_test.rb`:

```ruby
# impact_from_string round-trip
it "returns 0.95 for extreme" do
  _(impact.impact_from_string("extreme")).must_equal 0.95
end

# string_from_impact round-trip
it "returns 'extreme' for score 0.95" do
  _(impact.string_from_impact(0.95)).must_equal "extreme"
end
```

**3. Run and verify:**

```bash
ruby -e "
require 'minitest/autorun'
require_relative 'lib/inspec/errors'
require_relative 'lib/inspec/impact'
# paste tests here
"
```

---

## Design constraints to respect

| Constraint | Reason |
|------------|--------|
| Keep `IMPACT_SCORES` in **ascending score order** | `string_from_impact` uses `reverse_each` — insertion order determines band boundaries |
| Scores must be in **[0.0, 1.0]** | `string_from_impact` raises outside this range |
| Names must be **unique lowercase strings** | `impact_from_string` normalises with `.downcase` before lookup |

---

## How `string_from_impact` chooses a band

It iterates `IMPACT_SCORES` in **reverse** (highest first) and returns the first name whose score is ≤ the input:

```
Input 0.75  → checks critical(0.9)? no → checks high(0.7)? yes → returns "high"
Input 0.9   → checks critical(0.9)? yes → returns "critical"
Input 0.0   → checks all, falls to none(0.0)? yes → returns "none"
```

---

## Files touched in previous exercises

| Exercise | Change |
|----------|--------|
| Ex 2 | Fixed bug: `IMPACT_SCORES[value]` → `IMPACT_SCORES[value.downcase]` |
| Ex 3 | Refactor: `normalized` local var, explicit `rescue`, self-maintaining error message |
| Ex 4 (this) | YARD docstrings + extending guide |
