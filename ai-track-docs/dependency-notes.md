# Critical Dependency Notes

**InSpec version:** 5.24.10  
**Ruby floor:** 3.1.x (3.2+ breaks several pinned gems — see below)  
**Last reviewed:** 2026-05-21

---

## 1. The Ruby Version Constraint

```
spec.required_ruby_version = ">= 3.1.0"
```

**Hard ceiling: Ruby 3.1.x only for InSpec 5.**  
Several dependencies explicitly block Ruby 3.2+. Upgrading Ruby to 3.2 requires
resolving all constraints in the "Ruby-version blockers" column below first.

---

## 2. Direct Gemspec Dependencies

### `inspec-core.gemspec` — runtime

| Gem | Constraint | Resolved | Risk | Notes |
|-----|-----------|----------|------|-------|
| `thor` | `>= 0.20, < 1.5.0` | 1.4.0 | 🟡 Medium | Pinned `< 1.5.0` — thor 1.3.0 broke CLI alias behaviour ([#800](https://github.com/rails/thor/pull/800)); do **not** bump past 1.4.x without running `cli_args_test` |
| `train-core` | `~> 3.16, >= 3.16.1` | 3.16.1 | 🟢 Low | Pessimistic lock; minor bumps safe; major bump needs transport-API audit |
| `rspec` | `>= 3.9, <= 3.14` | 3.13.2 | 🟢 Low | Upper bound added deliberately; test output format changed in 3.10 — keep `>= 3.10` in Gemfile |
| `hashie` | `>= 3.4, < 6.0` | 5.1.0 | 🟢 Low | Used by `SimpleConfig`; wide range is safe; next major (6.x) not yet released |
| `addressable` | `< 2.8.8` | 2.8.7 | 🔴 High | `public_suffix` 7.0 (pulled by addressable 2.8.8+) requires Ruby 3.2. **Do not bump** until Ruby floor is raised |
| `parslet` | `>= 1.5, < 3.0` | 2.0.0 | 🟢 Low | Used in DSL; 2.0 stable; wide upper bound is intentional |
| `rubyzip` | `>= 1.2.2, < 4.0` | 2.4.1 | 🟢 Low | Profile packaging; safe range |
| `faraday` | `>= 1, < 3` | 1.10.4 | 🟡 Medium | faraday 2.x changed middleware API; running on 1.x; a jump to 2.x needs middleware compatibility check |
| `tomlrb` | `>= 1.2, < 2.1` | 1.3.0 | 🟢 Low | Config file parsing; 2.x API changed; upper bound protects against it |
| `mixlib-log` | `~> 3.0, < 3.2` | 3.1.2 | 🟢 Low | Pessimistic + explicit upper; safe |
| `pry` | `~> 0.13` | 0.15.2 | 🟢 Low | Shell REPL; pessimistic lock covers minor bumps |
| `cookstyle` | (none) | 7.32.8 | 🟡 Medium | No upper bound; a major Cookstyle bump could fail `inspec check`; consider adding `< 8.0` |
| `license-acceptance` | `>= 0.2.13, < 3.0` | 2.1.13 | 🟢 Low | Wide range; safe |
| `semverse` | `~> 3.0` | 3.0.2 | 🟢 Low | Pessimistic; stable |
| `multipart-post` | `~> 2.0` | 2.4.1 | 🟢 Low | Pessimistic; stable |

### `inspec.gemspec` — full gem (adds to core)

| Gem | Constraint | Resolved | Risk | Notes |
|-----|-----------|----------|------|-------|
| `train` | `~> 3.16, >= 3.16.1` | 3.16.1 | 🟢 Low | Mirrors train-core constraint |
| `train-winrm` | `~> 0.4.0` | 0.4.3 | 🟢 Low | Tight pessimistic; 0.4.0 added SOCKS5h support — do not loosen without testing WinRM transport |
| `train-kubernetes` | `< 0.3.1` | 0.1.7 | 🔴 High | 0.3.1+ requires Ruby 3.1 min (already met) but also pulls zeitwerk 2.7 which needs Ruby 3.2; safe to lift to `< 0.3.1` only |
| `mongo` | `= 2.21.3` | 2.21.3 | 🔴 High | **Exact pin.** mongo 2.14.0 introduced a broken symlink in `spec/support/ocsp`; only 2.21.3 confirmed clean. Do not bump without manual gemfile extraction test |
| `faraday_middleware` | `>= 0.12.2, < 1.3` | 1.2.1 | 🟡 Medium | Azure profile dep; 1.3+ may conflict with faraday 1.x adapter API |
| `progress_bar` | `~> 1.3.3` | 1.3.4 | 🟢 Low | Tight patch lock; fine |

---

## 3. Gemfile-Only Pins (dev/CI — not shipped in gem)

These are not in the gemspec but constrain the development environment and CI.

| Gem | Constraint | Resolved | Why pinned |
|-----|-----------|----------|-----------|
| `ffi` | `>= 1.15.5, < 1.17.0` | 1.16.3 | 1.17.0 requires RubyGems >= 3.3.22; breaks verify pipeline |
| `unf_ext` | `= 0.0.8.2` | 0.0.8.2 | 0.0.9 has a build failure on some platforms ([issue](https://github.com/knu/ruby-unf_ext/issues/74)) |
| `zeitwerk` | `~> 2.6.0, < 2.7` | 2.6.18 | 2.7.1+ requires Ruby >= 3.2; pulled by train-kubernetes dependency chain |
| `connection_pool` | `>= 2.5, < 3.0` | 2.5.5 | 3.0.0+ requires Ruby >= 3.2 |
| `net-imap` | `>= 0.2.5, < 0.6` | 0.5.13 | 0.6+ requires Ruby >= 3.2 |
| `minitest` | `= 5.15.0` | 5.15.0 | Test output format differences in other versions break test assertions |
| `minitest-sprint` | `~> 1.3.0, < 1.4.0` | 1.3.0 | 1.4.0+ requires Ruby >= 3.2 |
| `signet` | `< 0.22.0` | 0.21.0 | 0.22.0+ may require Ruby > 3.1 |
| `nokogiri` | `< 1.17.2` | — | Test dep; 1.17.2 changed XML serialisation affecting test assertions |
| `multi_json` | `~> 1.18.0` | — | 1.16+ requires Ruby 3.2; pinned to 1.18.0 patch range |
| `rspec` (Gemfile override) | `>= 3.10` | 3.13.2 | Raises gemspec floor from 3.9 → 3.10 for dev; output format stable from 3.10 |

---

## 4. `ini` Resource — Direct Dependency Chain

The `ini` resource itself touches only two libraries:

```
IniConfig#parse
  └── SimpleConfig  (lib/inspec/utils/simpleconfig.rb — vendored, no external gem)
        └── Inspec::Utils::CommentParser  (lib/inspec/utils/parser.rb — vendored)
              └── parslet  ~> 2.0  ← only external dep in the parse path
```

`parslet` is the sole external gem in the `ini` parse path.  
Current constraint `>= 1.5, < 3.0` with resolved 2.0.0 is safe.
**Minimal recommendation:** tighten to `~> 2.0` to prevent an accidental 3.x resolution.

---

## 5. Proposed Minimal Constraint Changes

These are conservative tightenings only — no version upgrades, no new gems.

| Location | Gem | Current | Proposed | Reason |
|----------|-----|---------|---------|--------|
| `inspec-core.gemspec` | `parslet` | `>= 1.5, < 3.0` | `~> 2.0` | Lock to known-good major; 2.0 is stable and `SimpleConfig` depends on its API |
| `inspec-core.gemspec` | `cookstyle` | *(none)* | `"< 9.0"` | No upper bound is risky; major bumps have broken `inspec check` before |
| `inspec-core.gemspec` | `faraday` | `>= 1, < 3` | `>= 1, < 2` | Running on 1.10.4; faraday 2.x rewrote middleware — safer to hold at 1.x until tested |
| `inspec.gemspec` | `faraday_middleware` | `>= 0.12.2, < 1.3` | `>= 0.12.2, < 1.3` | ✅ Already correct — no change needed |
| `Gemfile` | `ffi` | `>= 1.15.5, < 1.17.0` | `>= 1.15.5, < 1.17.0` | ✅ Already correct — retain as-is |

> **Note:** Do not change `addressable`, `mongo`, `zeitwerk`, `minitest`, or `unf_ext`
> constraints — they are intentional hard pins with documented breakage history.

---

## 6. Ruby-Version Blocker Map

All of the following must be resolved **before** raising the Ruby floor to 3.2:

| Gem | Current ceiling | Blocker reason |
|-----|----------------|---------------|
| `addressable` | `< 2.8.8` | `public_suffix` 7.0 needs Ruby 3.2 |
| `zeitwerk` | `< 2.7` | 2.7.1+ needs Ruby 3.2 |
| `connection_pool` | `< 3.0` | 3.0.0+ needs Ruby 3.2 |
| `net-imap` | `< 0.6` | 0.6+ needs Ruby 3.2 |
| `minitest-sprint` | `< 1.4.0` | 1.4.0+ needs Ruby 3.2 |
| `multi_json` | `~> 1.18.0` | 1.16+ needs Ruby 3.2 |
| `train-kubernetes` | `< 0.3.1` | pulls zeitwerk 2.7 which needs Ruby 3.2 |

---

## 8. Unbounded Dev/Test Gems (audit output)

These have no upper-bound constraint. They are all in `:test`, `:omnibus`, or `:deploy`
groups so they don't ship in the gem, but a runaway bump can still break CI.

| Gem | Group | Action |
|-----|-------|--------|
| `cookstyle` | runtime gemspec | ⚠️ Add `< 9.0` — already proposed in §5 |
| `chefstyle` | test | Low risk (style-only); monitor for major bumps |
| `concurrent-ruby` | test | Used in parallel tests; monitor |
| `rspec` | Gemfile override | Has gemspec upper `<= 3.14`; Gemfile raises floor to `>= 3.10` — net effective range is `3.10–3.14` ✅ |
| `simplecov` / `simplecov_json_formatter` | test | Coverage tooling; safe to leave unbounded |
| `webmock` / `mocha` | test | Test mocking; safe to leave unbounded |
| `rake` | deploy/test | Ubiquitous; safe |
| `m` | test | Test runner helper; safe |
| `appbundler`, `rb-readline`, `ed25519`, `bcrypt_pbkdf` | omnibus | Packaging only; not in verify path |

> Re-run the audit command below after any `bundle update` to check for new unbounded resolutions.

---

## 7. Quick Audit Command

```bash
# Show all gems with no upper bound (potential runaway bumps)
bundle exec ruby -e "
  require 'bundler'
  Bundler.load.dependencies.each do |d|
    reqs = d.requirement.requirements
    has_upper = reqs.any? { |op, _| %w[< <= ~>].include?(op) }
    puts \"#{d.name}: #{d.requirement}\" unless has_upper
  end
"
```
