---
name: build-hab-pkg-aarch64-linux
description: >
  Sets up aarch64-linux (Linux ARM64) Habitat package support for InSpec.
  Use this skill when asked to add ARM64 Habitat build support, add the
  aarch64-linux plan file, or configure the ARM64 pipeline steps in
  artifact.habitat.yml and artifact.habitat.test.sh.
---

# Skill: build-hab-pkg-aarch64-linux

When this skill is invoked, check and apply the three changes below **in
order**. For each change, search the file for the identifying label/string
first. If it is already present, say `✔ <name> – already in place` and move
on. Only make an edit when the change is genuinely missing.

---

## Change 1 – `habitat/aarch64-linux/plan.sh`

**Check:** does `habitat/aarch64-linux/plan.sh` exist and contain
`x86_64-linux/plan.sh`?

- **Already in place** → report `✔ habitat/aarch64-linux/plan.sh – already in place`.
- **Missing** → create the file with this exact content and report
  `✅ habitat/aarch64-linux/plan.sh – created`:

  ```bash
  # Reuse the x86_64-linux plan for Linux ARM builds.
  source "$(dirname "${BASH_SOURCE[0]}")/../x86_64-linux/plan.sh"
  ```

---

## Change 2 – `.expeditor/artifact.habitat.yml`

**Check:** search `.expeditor/artifact.habitat.yml` for the label
`Arm64 Validate Habitat Builds`.

- **Already in place** → report `✔ artifact.habitat.yml ARM64 step – already in place`.
- **Missing** → insert the block below **immediately before** the line
  containing `:windows: Validate Habitat Builds`, then report
  `✅ artifact.habitat.yml ARM64 step – added`:

  ```yaml
    - label: ":linux: Arm64 Validate Habitat Builds of Chef InSpec"
      commands:
        - .expeditor/buildkite/artifact.habitat.test.sh
      agents:
        queue: default-privileged-aarch64
      plugins:
        - docker#v3.5.0:
            image: ruby:3.4.2-bullseye
            privileged: true
            propagate-environment: true
            environment:
              - HAB_AUTH_TOKEN
              - BUILD_PKG_TARGET: "aarch64-linux"
  ```

---

## Change 3 – `.expeditor/buildkite/artifact.habitat.test.sh`

**Check:** search `.expeditor/buildkite/artifact.habitat.test.sh` for the
string `BUILD_PKG_TARGET`.

- **Already in place** → report `✔ artifact.habitat.test.sh BUILD_PKG_TARGET – already in place`.
- **Missing** → replace the single unconditional line
  `DO_CHECK=true hab pkg build .` with the conditional block below, then
  report `✅ artifact.habitat.test.sh BUILD_PKG_TARGET – added`:

  ```bash
  if [ -n "$BUILD_PKG_TARGET" ]; then
    echo "--- Building for target: $BUILD_PKG_TARGET"
    DO_CHECK=true hab pkg build "habitat/$BUILD_PKG_TARGET"
  else
    DO_CHECK=true hab pkg build .
  fi
  ```

---

## Summary

After all three checks, print:

- `All aarch64-linux Habitat build changes are already in place. Nothing to do.` — if nothing was changed.
- `N change(s) applied successfully.` — if one or more edits were made.
