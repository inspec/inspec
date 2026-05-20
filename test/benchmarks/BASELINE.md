# NginxParser Benchmark Baseline

## Environment

- Date: 2026-05-21
- Machine: macOS (Apple Silicon)
- Ruby: 3.x (bundle exec)
- Branch: learn/crawl/vasundhara-ex5-minimum-validation (with input validation added)

## Input

- Fixture: `test/fixtures/files/nginx.conf`
- Size: 47 lines, 1184 bytes
- Content: realistic server block with http, events, nested locations

## Results

| Metric | Value |
|--------|-------|
| Iterations | 1000 × 5 samples |
| Mean | 8770 ms (total for 1000 parses) |
| Per-parse | **~8.77 ms** |
| Min | 8752 ms |
| Max | 8790 ms |
| Stddev | 13.9 ms |
| CV (stddev/mean) | **0.2%** |

## Variance Notes

- CV of 0.2% indicates extremely stable measurements.
- This machine has low background noise during benchmarking.
- Parslet creates many intermediate objects per parse — GC pauses are the main
  source of variance in longer runs.
- The input validation guard (`is_a?(String)` + `empty?`) adds negligible
  overhead (nanoseconds) relative to the ~8.8 ms parse time.

## How to Reproduce

```bash
bundle exec ruby test/benchmarks/nginx_parser_bench.rb
```

## Regression Threshold

A **>15% increase** in per-parse time (above ~10.1 ms on comparable hardware)
warrants investigation. Smaller fluctuations are likely environmental.
