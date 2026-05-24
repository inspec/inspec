# Backlog Items (From Crawl Findings)

## 1. Harden Nginx Parser Error Contract

**Problem**
`NginxConfig.parse` currently raises a generic runtime error string on parse failure, which is harder to rescue programmatically.

**Code Links**
- [lib/inspec/utils/nginx_parser.rb](lib/inspec/utils/nginx_parser.rb)
- [test/unit/utils/nginx_parser_test.rb](test/unit/utils/nginx_parser_test.rb)

**Acceptance Criteria**
- Introduce a dedicated exception class for nginx parse failures (for example `Inspec::NginxParseError`).
- `NginxConfig.parse` raises the dedicated exception for syntax errors, while keeping current error context.
- Existing negative tests are updated to assert exception class explicitly.
- Unit tests pass:
  - `bundle exec ruby -Ilib:test test/unit/utils/nginx_parser_test.rb`

---

## 2. Add Structured Logging Test Coverage

**Problem**
Structured logs were added for parser operations, but log format and required fields are not yet protected by tests.

**Code Links**
- [lib/inspec/utils/nginx_parser.rb](lib/inspec/utils/nginx_parser.rb)
- [ai-track-docs/structured-logging.md](ai-track-docs/structured-logging.md)
- [test/unit/utils/nginx_parser_test.rb](test/unit/utils/nginx_parser_test.rb)

**Acceptance Criteria**
- Add unit tests that capture debug logs and assert required fields exist for each path:
  - success: `op=parse`, `status=ok`, `elapsed_ms`
  - empty input: `op=parse`, `status=skip`
  - parse error: `op=parse`, `status=error`, `elapsed_ms`
- Keep logs in key=value style as documented.
- No regression in parser/resource tests.

---

## 3. Make Benchmark Baseline Drift Checkable

**Problem**
Benchmark data exists, but there is no repeatable guardrail for performance drift.

**Code Links**
- [test/benchmarks/nginx_parser_bench.rb](test/benchmarks/nginx_parser_bench.rb)
- [test/benchmarks/BASELINE.md](test/benchmarks/BASELINE.md)
- [ai-track-docs/perf-baseline.md](ai-track-docs/perf-baseline.md)

**Acceptance Criteria**
- Add a mode in the benchmark script to emit JSON (mean, min, max, stddev, per-parse).
- Add optional threshold check (for example fail if per-parse exceeds baseline by 15%).
- Document exact command to run threshold mode in docs.
- Script remains runnable without CI-only dependencies.

---

## 4. Expand Secret Hygiene With Automated Scan Command

**Problem**
Ignore rules and guidance are improved, but there is no standard command in repo docs to run a focused secret scan before push.

**Code Links**
- [.gitignore](.gitignore)
- [ai-track-docs/security-notes.md](ai-track-docs/security-notes.md)
- [.github/pull_request_template.md](.github/pull_request_template.md)

**Acceptance Criteria**
- Add a documented pre-push secret scan command in security docs using git diff/staged content.
- Add a PR template checkbox confirming secret scan was run for non-doc changes.
- Ensure fixture exceptions remain valid (`test/fixtures/**` should not be blocked by generic patterns).
- Validate with `git check-ignore` examples included in docs.

---

## 5. Dependency Hygiene Review Cadence

**Problem**
Dependency constraints are documented, but there is no explicit review cadence and owner workflow.

**Code Links**
- [ai-track-docs/dependencies.md](ai-track-docs/dependencies.md)
- [inspec-core.gemspec](inspec-core.gemspec)
- [inspec.gemspec](inspec.gemspec)
- [Gemfile](Gemfile)

**Acceptance Criteria**
- Add a quarterly review section in dependency notes with owner, command set, and output expectations.
- Standardize a minimal command checklist:
  - `bundle outdated`
  - `bundle audit check --update`
  - targeted reverse dependency checks for pinned gems
- Add a decision log section template (keep pin, loosen pin, or schedule follow-up issue).
- Link the review cadence from build/test docs for visibility.
