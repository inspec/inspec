---
name: hab-ci-pipeline
description: >
  Wires a Habitat target platform into the Expeditor CI pipelines so it is
  built and tested automatically on every merge. Updates
  .expeditor/buildkite/artifact.habitat.test.sh to support the BUILD_PKG_TARGET
  env var and adds a new Buildkite pipeline step for the target to
  .expeditor/artifact.habitat.yml. Use when asked to add CI pipeline support
  for a new Habitat platform.
---

# Skill: hab-ci-pipeline

When this skill is invoked, follow these steps in order.

---

## Step 1 – Ask for the target platform

Ask the user:

> *"Which platform would you like to add Habitat CI pipeline support for?
> Examples: `aarch64-linux`, `aarch64-darwin`, `x86_64-darwin`.
> (Enter the full Habitat target string, e.g. `aarch64-linux`)"*

Store the answer as `<TARGET>` (e.g. `aarch64-linux`).

---

## Step 2 – Update `.expeditor/buildkite/artifact.habitat.test.sh`

Read the file and check whether it already contains a `BUILD_PKG_TARGET` conditional block:

```bash
if [ -n "$BUILD_PKG_TARGET" ]; then
```

### Already present
Report `✔ artifact.habitat.test.sh – BUILD_PKG_TARGET support already in place` and skip to Step 3.

### Missing
Find this line:

```bash
DO_CHECK=true hab pkg build .
```

Replace it with:

```bash
if [ -n "$BUILD_PKG_TARGET" ]; then
  echo "--- Building for target: $BUILD_PKG_TARGET"
  DO_CHECK=true hab pkg build "habitat/$BUILD_PKG_TARGET"
else
  DO_CHECK=true hab pkg build .
fi
```

> This allows the same script to build any target platform by setting `BUILD_PKG_TARGET` in the pipeline step environment.

Report: `✅ artifact.habitat.test.sh – added BUILD_PKG_TARGET support`

---

## Step 3 – Add a pipeline step to `.expeditor/artifact.habitat.yml`

Read the file and check whether a step for `<TARGET>` already exists (look for `BUILD_PKG_TARGET: "<TARGET>"`).

### Already present
Report `✔ artifact.habitat.yml – step for <TARGET> already in place` and skip to Step 4.

### Missing — add the step

Insert the new step **after** the existing x86_64 Linux step and **before** the Windows step, using the appropriate template below.

**For `aarch64-linux`:**

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

**For `aarch64-darwin`:**

```yaml
  - label: ":darwin: Arm64 Validate Habitat Builds of Chef InSpec"
    commands:
      - .expeditor/buildkite/artifact.habitat.test.sh
    agents:
      queue: default-privileged-aarch64-darwin
    expeditor:
      executor:
        macos:
          privileged: true
          environment:
            - HAB_AUTH_TOKEN
            - BUILD_PKG_TARGET: "aarch64-darwin"
```

**For any other `<TARGET>`** — use the `aarch64-linux` template as a base, substituting the correct queue name and `BUILD_PKG_TARGET` value.

Report: `✅ artifact.habitat.yml – added pipeline step for <TARGET>`

---

## Step 4 – Summary

Print a final summary:

```
Platform : <TARGET>

File                                                  Status
----                                                  ------
.expeditor/buildkite/artifact.habitat.test.sh         ✅ BUILD_PKG_TARGET support added (or ✔ already in place)
.expeditor/artifact.habitat.yml                       ✅ pipeline step added for <TARGET> (or ✔ already in place)
```

> *"CI pipeline is now configured to build and test `<TARGET>` Habitat packages on every merge. Commit and push these two files to include them in your PR."*
