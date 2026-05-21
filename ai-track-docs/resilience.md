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

---

## Walk Ex15: Retry-with-Backoff Resilience (Log Call Sites)

Walk Ex15 adds `lib/inspec/utils/retry_with_backoff.rb` and wraps the two
observability log call sites in impact.rb (`Inspec::Log.warn` and
`Inspec::Log.debug`) with retry-backoff so transient log backend failures
never surface to callers of `impact_from_string` / `string_from_impact`.

### Call Sites Wrapped

| Call site | Method | Exception guarded | Retry budget | Fallback |
|-----------|--------|-------------------|--------------|---------|
| `Inspec::Log.warn(entry)` | `warn_impact` | `IOError` | 2 retries | `nil` (silent swallow) |
| `Inspec::Log.debug(entry)` | `log_impact` | `IOError` | 2 retries | `nil` (silent swallow) |

### Tuning Parameters

```ruby
Inspec::Utils::RetryWithBackoff.call(
  retries:    2,       # re-attempts after first failure (total = retries + 1)
  base_delay: 0.01,   # initial sleep in seconds; doubles each retry
  max_delay:  1.0,    # sleep cap in seconds
  on:         IOError, # exception class(es) to retry
  fallback:   nil      # value returned after budget exhausted (:raise to propagate)
) { Inspec::Log.warn(entry) }
```

Backoff sequence (base_delay: 0.01): 10 ms → 20 ms → 40 ms → … (capped at 1 s).
With `retries: 2`, worst-case additional latency = **30 ms** before fallback.

### Rollback

```bash
# Full rollback — removes helper + wrapping
git revert <commit-SHA>

# Minimal rollback — revert to simple rescue (no retry overhead)
# In warn_impact and log_impact, replace:
Inspec::Utils::RetryWithBackoff.call(retries: 2, ...) { Inspec::Log.warn(entry) }
# with:
Inspec::Log.warn(entry)
rescue IOError
  nil
```

See `ai-track-docs/resilience.md` for the full tuning and failure test table.
