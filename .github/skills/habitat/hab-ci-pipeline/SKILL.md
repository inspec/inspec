---
name: hab-ci-pipeline
description: >
  Wires a Habitat target platform into the Expeditor CI pipelines so it is
  built and tested automatically on every merge. Adds a new Buildkite pipeline
  step for the target to .expeditor/artifact.habitat.yml. Use when asked to
  add CI pipeline support for a new Habitat platform.
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

## Step 2 – Add a pipeline step to `.expeditor/artifact.habitat.yml`

Read the file and check whether a step for `<TARGET>` already exists (look for `BUILD_PKG_TARGET: "<TARGET>"`).

### Already present
Report `✔ artifact.habitat.yml – step for <TARGET> already in place` and skip to Step 3.

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

## Step 3 – Summary

Print a final summary:

```
Platform : <TARGET>

File                                   Status
----                                   ------
.expeditor/artifact.habitat.yml        ✅ pipeline step added for <TARGET> (or ✔ already in place)
```

> *"CI pipeline is now configured to build and test `<TARGET>` Habitat packages on every merge. Commit and push this file to include it in your PR."*
