# Performance Baseline — NginxParser

## Environment

- Date: 2026-05-21
- Machine: macOS (Apple Silicon)
- Ruby: 3.x (bundle exec)
- Branch: learn/crawl/vasundhara-ex5-minimum-validation

## Input

- Fixture: `test/fixtures/files/nginx.conf`
- Size: 47 lines, 1184 bytes

## Results

| Metric | Value |
|--------|-------|
| Iterations | 1000 × 5 samples |
| Mean (1000 parses) | 8770 ms |
| Per-parse | **~8.77 ms** |
| Min | 8752 ms |
| Max | 8790 ms |
| Stddev | 13.9 ms |
| CV (stddev/mean) | **0.2%** |

## Variance Notes

- CV of 0.2% → extremely stable; no environmental noise.
- Parslet's object-heavy parsing dominates cost.
- Input validation guard (`is_a?(String)` + `empty?`) adds negligible overhead.
- GC forced between samples to isolate its effect.

## Regression Threshold

> A **>15% increase** in per-parse time (above ~10.1 ms on comparable hardware)
> warrants investigation.

## How to Reproduce

```bash
bundle exec ruby test/benchmarks/nginx_parser_bench.rb
```
