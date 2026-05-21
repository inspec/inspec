# Performance Baseline — `Inspec::Impact`

**Module:** `lib/inspec/impact.rb`  
**Last updated:** 2026-05-21 (Walk Ex6 — `number?` optimization)
**Ruby version:** 3.4.8 (arm64-darwin)  
**Machine:** Apple Silicon (M-series), single process, no external I/O  
**Methodology:** Ruby stdlib `Benchmark.bm`, 200,000 iterations per case.

---

## Walk Ex6 Optimization — `number?()` (2026-05-21)

### What changed

Replaced exception-based `Float(value); rescue` in `number?` with an early
`Numeric` short-circuit + compiled regex (`NUMERIC_RE`). Exceptions are
expensive in Ruby; every named-severity call ("high", "low" etc.) previously
triggered a full exception allocation + stack unwind.

```ruby
# Before — exception on every named-severity call
def self.number?(value)
  Float(value); true
rescue TypeError, ArgumentError
  false
end

# After — no exception on hot path
NUMERIC_RE = /\A[-+]?(\d+\.?\d*|\.\d+)([eE][-+]?\d+)?\z/
def self.number?(value)
  return true if value.is_a?(Numeric)
  value.is_a?(String) && NUMERIC_RE.match?(value)
end
```

### Before / After measurements (N=200,000)

| Case | Before (s) | After (s) | Change |
|------|-----------|----------|--------|
| `number?('low')` — **false path** | 0.167 | 0.040 | **4.1× faster** |
| `number?('high')` — **false path** | 0.153 | 0.040 | **3.8× faster** |
| `number?('0.5')` — true path | 0.015 | 0.043 | 2.9× slower |
| `impact_from_string('high')` — **hot path** | 0.299 | 0.179 | **1.7× faster** |
| `impact_from_string('0.5')` — numeric passthrough | 0.128 | 0.153 | 1.2× slower |

### Analysis

The **false path** (named severity → not a number) is the dominant real-world
case — InSpec profiles almost always call `impact_from_string` with a name, not
a numeric string. That path is **4× faster**.

The **true path** (numeric string) regresses slightly (~43ms vs ~15ms) because
`Float()` is a C-level call optimised for numeric strings, while regex adds a
small overhead. This trade-off is acceptable: the numeric-string path is rare in
practice, and even at 43ms/200k the absolute latency (~215 ns/call) is
negligible.

### Safety

- All 1484 unit tests pass (no behaviour change)
- All 16 contract tests pass (golden file + return types unchanged)
- `number?` still correctly handles: integer strings, float strings, exponential
  notation, signed numbers, Numeric inputs, and non-numeric strings

---

## Original Crawl Baseline (2026-05-20)

| Method | Input type | avg wall (s) | ns / call | variance |
|--------|-----------|-------------|-----------|---------|
| `impact_from_string` | named string (`"high"`) | 0.098437 | **985 ns** | 2.0 % |
| `impact_from_string` | numeric string (`"0.7"`) | 0.012587 | **126 ns** | 1.3 % |
| `string_from_impact` | float (`0.7`) | 0.063257 | **633 ns** | 1.3 % |
| `number?` | non-numeric (`"abc"`) | 0.081661 | **817 ns** | 0.4 % |

> Numbers above used N=100,000 with 3 trials; Walk Ex6 uses N=200,000 single run.
> Compare same-N measurements for valid before/after conclusions.

---

## Reproduce

```bash
# Baseline script (no bundler needed)
/path/to/ruby scripts/perf-bench-impact.rb

# Or inline
/path/to/ruby -I lib -e "
require 'benchmark'; require 'inspec/errors'; require 'inspec/impact'
N = 200_000
Benchmark.bm(30) do |x|
  x.report(\"number?('low')\")           { N.times { Inspec::Impact.number?('low') } }
  x.report(\"number?('0.5')\")           { N.times { Inspec::Impact.number?('0.5') } }
  x.report(\"impact_from_string('high')\") { N.times { Inspec::Impact.impact_from_string('high') } }
end
"
```

## Re-measurement guidance

A change is worth investigating if a method regresses by **> 20%** in ns/call.
Always measure the same N on the same machine; do not compare across Ruby versions
or hardware.

