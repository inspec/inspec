# Release Automation Plan

## Overview

This document describes the current release process, what can be automated with GitHub Actions, and the proposed pipeline design for `main` branch releases.

---

## Current Process (Expeditor-driven)

InSpec releases are currently managed by Chef's internal **Expeditor** automation tool. The flow is split into two phases: **post-merge automation** and **manual promotion**.

### Phase 1 — On PR Merge to `main` (Expeditor)

| Step | How |
|------|-----|
| Bump patch version in `VERSION` | Expeditor `built_in:bump_version` |
| Sync version to `lib/inspec/version.rb` and `inspec-bin/lib/inspec-bin/version.rb` | `.expeditor/update_version.sh` |
| Update `CHANGELOG.md` with PR titles grouped by label | Expeditor `built_in:update_changelog` |
| Trigger Habitat package build (Linux + Windows) | Expeditor → Buildkite (`.expeditor/build.habitat.yml`) |
| Build gems and stage to internal Artifactory | Expeditor `built_in:build_gem` |

Labels that control Expeditor behaviour on a PR:

| Label | Effect |
|-------|--------|
| `Expeditor: Bump Minor Version` | Bumps minor version instead of patch |
| `Expeditor: Bump Major Version` | Bumps major version |
| `Expeditor: Skip Version Bump` | Skips version bump (e.g., docs-only PRs) |
| `Expeditor: Skip Changelog` | Skips changelog entry (e.g., dummy PRs) |
| `Expeditor: Skip Habitat` | Skips Habitat build |
| `Expeditor: Skip All` | Skips all post-merge Expeditor actions |

### Phase 2 — Manual Promotion Steps (Human)

These steps must be performed **in order** before and during a release:

1. **Promote dependency gems** — `train`, `train-core`, `train-winrm`, `train-aws`, `train-habitat` must be promoted to RubyGems.org via Expeditor _before_ merging the last InSpec PR:
   ```
   /expeditor promote inspec/train:main <VERSION>
   ```

2. **Notify Docs team** — Ask `@docs-team` to prepare release notes in [chef-web-docs](https://github.com/chef/chef-web-docs). Wait for confirmation before proceeding.

3. **Verify green artifacts** in `#inspec-notify` Slack channel — Habitat build must be green. Retry manually in Buildkite if needed (Windows build is unreliable).

4. **Run promotion command** in `#inspec-notify`:
   ```
   /expeditor promote inspec/inspec:main <VERSION>
   ```

5. **Merge homebrew-chef PR** — Expeditor auto-creates a PR at [chef/homebrew-chef](https://github.com/chef/homebrew-chef) after promotion.

### Phase 2 — On Promotion (Expeditor)

| Step | How |
|------|-----|
| Rollover CHANGELOG (move `latest_release` → stable section) | Expeditor `built_in:rollover_changelog` |
| Publish 4 gems to RubyGems.org | Expeditor `built_in:publish_rubygems` |
| Promote Habitat packages to `stable` channel | Expeditor `built_in:promote_habitat_packages` |
| Update `ARG VERSION` in Dockerfile | `.expeditor/update_dockerfile.sh` |
| Purge Fastly CDN cache for `/inspec/latest` | Expeditor `purge_packages_chef_io_fastly` |
| Notify Slack channels | Expeditor `built_in:notify_chefio_slack_channels` |
| Create GitHub Release | Manual — `.github/workflows/create-github-release.yml` (`workflow_dispatch`) |

> **Note:** Promotion is NOT idempotent. If it fails mid-way, do not retry — contact `#releng-support`. Manually comment out already-passed steps before re-running.

---

## What CAN Be Automated with GitHub Actions

| Step | Automatable | Requires |
|------|------------|---------|
| Bump patch version in `VERSION` on merge | ✅ Yes | GitHub Actions + write token |
| Sync version to `version.rb` files | ✅ Yes | Part of version bump job |
| Update `CHANGELOG.md` (from PR titles/labels) | ✅ Yes | `release-drafter` or `git-cliff` action |
| Run full test suite before release | ✅ Yes | Already done in CI |
| Build gems (`inspec`, `inspec-core`, `inspec-bin`, `inspec-core-bin`) | ✅ Yes | Ruby setup |
| Publish gems → RubyGems.org | ✅ Yes | `RUBYGEMS_API_KEY` secret |
| Create GitHub Release with release notes | ✅ Yes | `create-github-release.yml` exists (manual only today) |
| Build + push Docker image | ✅ Yes | Registry credentials secret |
| Notify Slack on release | ✅ Yes | `SLACK_WEBHOOK_URL` secret |
| Habitat package builds | ⚠️ Partial | `HAB_AUTH_TOKEN` already in CI; Windows builds unreliable |
| Promote dependency gems (train etc.) | ❌ No | Chef internal Expeditor command |
| Publish to internal Chef Artifactory | ❌ No | Chef internal infrastructure |
| Fastly CDN purge | ❌ No | Chef internal credentials |
| Expeditor promotion | ❌ No | Chef internal tool |

---

## Proposed GitHub Actions Release Pipeline

```
PR merges to main
       │
       ▼
┌─────────────────────────────┐
│  version-bump.yml           │  Triggered: push to main
│  • Read VERSION             │
│  • Bump patch (or minor/    │
│    major based on PR label) │
│  • Update VERSION,          │
│    lib/inspec/version.rb,   │
│    inspec-bin/.../version.rb│
│  • Commit + push to main    │
│  • Create git tag vX.Y.Z    │
└─────────────────────────────┘
       │ on tag push (vX.Y.Z)
       ▼
┌─────────────────────────────┐
│  release.yml                │  Triggered: tag vX.Y.Z pushed
│                             │
│  1. Run full test suite     │
│  2. Build 4 gems            │
│  3. Publish → RubyGems.org  │
│  4. Build + push Docker img │
│  5. Update CHANGELOG        │
│  6. Create GitHub Release   │
│  7. Notify Slack            │
└─────────────────────────────┘
```

### Workflows to Create

| File | Trigger | Purpose |
|------|---------|---------|
| `.github/workflows/version-bump.yml` | `push` to `main` | Bumps version, commits, creates tag |
| `.github/workflows/release.yml` | `push` tag `v*.*.*` | Builds gems, publishes, creates release, notifies |

### Secrets Required

| Secret Name | Used For |
|-------------|---------|
| `RUBYGEMS_API_KEY` | Publishing gems to RubyGems.org |
| `DOCKER_REGISTRY_URL` | Docker image destination |
| `DOCKER_USERNAME` / `DOCKER_PASSWORD` | Docker registry auth |
| `SLACK_WEBHOOK_URL` | Release notification |
| `HAB_AUTH_TOKEN` | Habitat build (already in CI) |

### Version Bump Rules

The version bump logic should mirror Expeditor label behaviour:

| Condition | Bump |
|-----------|------|
| PR has label `Expeditor: Bump Major Version` | Major (`X+1.0.0`) |
| PR has label `Expeditor: Bump Minor Version` | Minor (`X.Y+1.0`) |
| PR has label `Expeditor: Skip Version Bump` | No bump |
| Default (no label) | Patch (`X.Y.Z+1`) |

---

## Remaining Manual Steps (Cannot Be Automated)

Even with the above automation, these steps still require a human:

1. **Promote dependency gems** via Expeditor in `#inspec-notify` before the final PR merge
2. **Notify and wait for Docs team** to finalize release notes
3. **Monitor Habitat build** in Buildkite and retry on failure (especially Windows)
4. **Merge homebrew-chef PR** after promotion

---

## Files Involved in Release

| File | Role |
|------|------|
| `VERSION` | Single source of truth for version number |
| `lib/inspec/version.rb` | Ruby constant synced from `VERSION` |
| `inspec-bin/lib/inspec-bin/version.rb` | Binary gem version constant |
| `CHANGELOG.md` | Release notes (managed by Expeditor; never edit manually) |
| `Dockerfile` | `ARG VERSION` updated by `.expeditor/update_dockerfile.sh` on promotion |
| `.expeditor/update_version.sh` | Syncs version constants after bump |
| `.expeditor/config.yml` | Defines all Expeditor automation triggers |
| `.github/workflows/create-github-release.yml` | Manual GitHub release creation (to be automated) |
