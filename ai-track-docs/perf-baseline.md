# Performance Baseline — `Inspec::Impact`

**Module:** `lib/inspec/impact.rb`  
**Measured:** 2026-05-20  
**Ruby version:** 3.4.8 (arm64-darwin)  
**Machine:** Apple Silicon (M-series), single process, no external I/O  
**Methodology:** Ruby stdlib `Benchmark.bm`, 100,000 iterations per trial, 3 trials per method (warm-up: 5,000 calls each), wall-clock time.

---

## Results

| Method | Input type | avg wall (s) | ns / call | variance |
|--------|-----------|-------------|-----------|---------|
| `impact_from_string` | named string (`"high"`) | 0.098437 | **985 ns** | 2.0 % |
| `impact_from_string` | numeric string (`"0.7"`) | 0.012587 | **126 ns** | 1.3 % |
| `string_from_impact` | float (`0.7`) | 0.063257 | **633 ns** | 1.3 % |
| `is_number?` | non-numeric (`"abc"`) | 0.081661 | **817 ns** | 0.4 % |

Iterations per trial: **100,000** — variance is run-to-run jitter on the same process.

---

## Observations

### 1. `is_number?` is the hidden hot path cost (~817 ns)
`is_number?` uses exception-based control flow — `Float("abc")` raises `ArgumentError`,
which is rescued. **Exception allocation dominates** every call where the input is a named
severity string (the common case). This cost is embedded inside `impact_from_string`.

### 2. Numeric passthrough is 8× faster (126 ns vs 985 ns)
When input is already numeric (`"0.7"`), `Float()` succeeds immediately and the method
returns early — no hash lookup, no `downcase`, no exception. Fast path works well.

### 3. `string_from_impact` reverse-iterates a 5-entry hash (~633 ns)
For a 5-key hash this is negligible, but it scales linearly with the number of severity
levels. Adding many levels would make this measurably slower.

### 4. Variance is low (< 2.1%)
Results are stable across runs on this machine. Low variance means this baseline is
reliable for future comparisons.

---

## Benchmark script (reproduce)

```bash
/path/to/ruby -e "
require 'benchmark'
require_relative 'lib/inspec/errors'
require_relative 'lib/inspec/impact'

ITERATIONS = 100_000
5_000.times { Inspec::Impact.impact_from_string('high') }

Benchmark.bm(30) do |x|
  3.times { x.report('impact_from_string(name)')    { ITERATIONS.times { Inspec::Impact.impact_from_string('high') } } }
  3.times { x.report('impact_from_string(numeric)') { ITERATIONS.times { Inspec::Impact.impact_from_string('0.7') } } }
  3.times { x.report('string_from_impact(float)')   { ITERATIONS.times { Inspec::Impact.string_from_impact(0.7) } } }
  3.times { x.report('is_number?(string)')          { ITERATIONS.times { Inspec::Impact.is_number?('abc') } } }
end
"
```

---

## Re-measurement guidance

Run the script again before and after any change to `impact.rb`.
A change is worth investigating if a method regresses by **> 20%** in ns/call.

> **Note:** These numbers are only meaningful for relative comparisons on the same
> machine. Do not compare raw ns values across different hardware or Ruby versions.
