# Resilience Guide — `Inspec::Impact`

**Updated:** Exercise 15

---

## Pattern: Error Mapping (Type Guards)

Both public methods now apply **explicit type guards** that map raw Ruby errors
(`NoMethodError`, `TypeError`) into the public `Inspec::ImpactError` API.
Callers only need to rescue one exception class.

### Before Ex 15 (failure modes)

| Input | Method | Old behaviour | New behaviour |
|-------|--------|---------------|---------------|
| `[1, 2]` | `impact_from_string` | `NoMethodError: undefined method 'downcase' for Array` | `Inspec::ImpactError: ...got Array` |
| `Object.new` | `impact_from_string` | `NoMethodError: undefined method 'downcase' for Object` | `Inspec::ImpactError: ...got Object` |
| `"abc"` | `string_from_impact` | Silent `"none"` (`"abc".to_f == 0.0`) | `Inspec::ImpactError: ...got String` |
| `{score: 0.5}` | `string_from_impact` | `NoMethodError: undefined method 'to_f' for Hash` | `Inspec::ImpactError: ...got Hash` |

### Root cause of `"abc"` → `"none"` silent failure

```ruby
# Before Ex 15: .to_f on a non-numeric string silently returns 0.0
value = value.to_f          # "abc".to_f => 0.0
(0..1).cover?(0.0)          # => true (passes the range check)
# returns "none" — wrong answer, no error
```

---

## Implementation

Two private guard helpers, called at method entry:

```ruby
# lib/inspec/impact.rb

def self.assert_impact_string_type!(value)
  return if value.is_a?(String) || value.is_a?(Numeric)
  raise Inspec::ImpactError,
        "Impact value must be a String or Numeric, got #{value.class}."
end

def self.assert_impact_score_type!(value)
  return if value.is_a?(Numeric)
  raise Inspec::ImpactError,
        "Impact score must be Numeric, got #{value.class}."
end
```

Called as the **second guard** in each method (after nil check):

```ruby
def self.impact_from_string(value)
  raise Inspec::ImpactError, '...' if value.nil?    # 1. nil guard
  assert_impact_string_type!(value)                  # 2. type guard ← Ex 15
  # ... rest of method
end
```

---

## Guard Order (both methods)

```
nil? ──► ImpactError "must not be nil"
type? ──► ImpactError "must be String/Numeric, got <class>"   ← Ex 15
value valid? ──► ImpactError "not a valid name/score"
happy path ──► return result
```

---

## Failure Tests

| Test | Proves |
|------|--------|
| `impact_from_string([1,2])` raises `ImpactError` with "Array" | no raw NoMethodError leaks |
| `impact_from_string(Object.new)` raises `ImpactError` with "Object" | arbitrary objects rejected cleanly |
| `string_from_impact('abc')` raises `ImpactError` with "String" | silent coercion prevented |
| `string_from_impact({score:0.5})` raises `ImpactError` with "Hash" | no raw NoMethodError leaks |

Run:
```bash
RUBY_BIN=/path/to/ruby bash scripts/crawl-track-test.sh
```

---

## Rollback

```bash
git revert <commit-SHA>   # removes type guards and their tests
```

---

## Extension: Adding Guards to Other Modules

Follow this pattern when adding guards to any InSpec module:

1. Create a private `assert_<context>_type!(value)` method
2. Raise `Inspec::ImpactError` (or the relevant module error class) with `got #{value.class}`
3. Call it immediately after the nil check
4. Add one test per unexpected type class (Array, Hash, arbitrary Object)
