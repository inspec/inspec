---
name: build-hab-pkg
description: >
  Creates a Habitat plan file for a new target platform (e.g. aarch64-linux,
  aarch64-darwin). Use this skill when asked to add Habitat build support for
  a new platform or architecture. The skill asks for the target platform,
  selects the correct base plan to source, and creates the plan file.
---

# Skill: build-hab-pkg

When this skill is invoked, follow these steps in order.

---

## Step 1 – Ask for the target platform

Ask the user:

> *"Which platform would you like to add Habitat package support for?
> Examples: `aarch64-linux`, `aarch64-darwin`, `x86_64-darwin`.
> (Enter the full Habitat target string, e.g. `aarch64-linux`)"*

Store the answer as `<TARGET>` (e.g. `aarch64-linux`).

---

## Step 2 – Determine the base plan to source

Derive the base plan path from `<TARGET>` using these rules:

| `<TARGET>` contains | Base plan to source |
|---------------------|---------------------|
| `linux`             | `../x86_64-linux/plan.sh` |
| `darwin`            | `../x86_64-darwin/plan.sh` (if it exists) |
| `windows`           | `../x86_64-windows/plan.ps1` |

- Check whether the resolved base plan file exists under `habitat/`.
- If it **does not exist**, warn the user:
  > *"⚠️ No base plan found for `<TARGET>` (expected `habitat/<base>`).
  > Please ensure the base plan exists before continuing."*
  Then stop.

---

## Step 3 – Check if the plan file already exists

Check whether `habitat/<TARGET>/plan.sh` already exists and sources the base plan.

- **Already in place** → report `✔ habitat/<TARGET>/plan.sh – already in place` and stop.
- **Missing** → proceed to Step 4.

---

## Step 4 – Create the plan file

### 4a – Read the existing base plan as reference

Before creating anything, **read the base plan file** resolved in Step 2
(e.g. `habitat/x86_64-linux/plan.sh` or `habitat/x86_64-windows/plan.ps1`).

Use its content to understand:
- The variables set at the top (`pkg_name`, `pkg_origin`, `pkg_deps`, etc.)
- Any `do_build`, `do_install`, `do_setup_environment` hooks defined
- The file extension and shell used (`.sh` for Linux/Darwin, `.ps1` for Windows)

The new plan file for `<TARGET>` **does not duplicate** this logic — it simply
sources the base plan so both platforms stay in sync.

### 4b – Write the new plan file

Create `habitat/<TARGET>/plan.sh` (or `plan.ps1` for Windows targets) with:

```bash
# Reuse the <BASE_PLATFORM> plan for <TARGET> builds.
source "$(dirname "${BASH_SOURCE[0]}")/<BASE_PLAN_PATH>"
```

Where:
- `<BASE_PLATFORM>` is the platform of the base plan (e.g. `x86_64-linux`)
- `<BASE_PLAN_PATH>` is the relative path from Step 2 (e.g. `../x86_64-linux/plan.sh`)

**Example** — for `aarch64-linux` (references `habitat/x86_64-linux/plan.sh`):

```bash
# Reuse the x86_64-linux plan for aarch64-linux builds.
source "$(dirname "${BASH_SOURCE[0]}")/../x86_64-linux/plan.sh"
```

> If the base plan is a `.ps1` (Windows), use the PowerShell equivalent:
> `. "$PSScriptRoot\..\x86_64-windows\plan.ps1"`

Report: `✅ habitat/<TARGET>/plan.sh – created (sources habitat/<BASE_PLATFORM>/plan.sh)`

---

## Step 5 – Summary

Print a summary of what was done:

```
Platform : <TARGET>
Plan file: habitat/<TARGET>/plan.sh
Sources  : habitat/<BASE_PLATFORM>/plan.sh
Status   : ✅ created  (or ✔ already in place)
```

---

## Step 6 – Set up Habitat Studio for testing

Now that the plan file is ready, invoke the **`setup-hab-studio`** skill to
prepare the Habitat Studio environment so the new plan can be built and tested:

> *"Invoking the `setup-hab-studio` skill to complete Habitat Studio setup…"*

The `setup-hab-studio` skill will:
1. Detect the OS and check whether `hab` is installed (install if missing)
2. Verify and configure all required environment variables
   (`HAB_ORIGIN`, `HAB_LICENSE`, `HAB_AUTH_TOKEN`, etc.)
3. Generate an origin key if one does not exist
4. Confirm the studio is ready to build `habitat/<TARGET>/plan.sh`

---

## Step 7 – Enter Habitat Studio and build the package

Once `setup-hab-studio` completes, enter the Habitat Studio and run the build
for the provided platform.

### 7a – Enter the Habitat Studio

```bash
hab studio enter
```

> On Linux this opens a sandboxed Studio shell. Wait for the `[1][default:/src:0]$`
> prompt before proceeding.

### 7b – Run the build for `<TARGET>`

Inside the Studio, run:

```bash
DO_CHECK=true build habitat/<TARGET>
```

Where `<TARGET>` is the platform chosen in Step 1 (e.g. `aarch64-linux`).

This is equivalent to running `hab pkg build habitat/<TARGET>` and will:
- Compile the gems for the target platform
- Run the `DO_CHECK` hooks defined in the base plan
- Produce a `.hart` artifact under `./results/`

### 7c – Verify the build succeeded

After the build completes, check the results:

```bash
source ./results/last_build.env
echo "Built: $pkg_artifact"
ls -lh ./results/$pkg_artifact
```

- If the `.hart` file is present → report `✅ Build succeeded: results/$pkg_artifact`
- If the build failed → show the last error lines from Studio output and suggest:
  > *"Check the build log above for errors. Common causes: missing deps in
  > `pkg_deps`, Ruby gem native extension failures, or incorrect `HAB_ORIGIN`."*

---

## Step 8 – Install the `.hart` package and verify

Once the `.hart` artifact is confirmed, exit the Studio and install the package
on the host machine, then verify it works correctly.

### 8a – Exit the Habitat Studio

```bash
exit
```

### 8b – Install the `.hart` package

```bash
source ./results/last_build.env
hab pkg install ./results/$pkg_artifact
```

- If installation succeeds → report `✅ Package installed: $pkg_ident`
- If it fails → show the error and stop.

### 8c – Add the package binaries to PATH

```bash
hab pkg binlink $pkg_origin/inspec inspec --force
```

Or export the bin path directly:

```bash
export PATH="$(hab pkg path $pkg_origin/inspec)/bin:$PATH"
```

### 8d – Verify with `inspec version`

```bash
inspec version
```

- Expected: prints the InSpec version string (e.g. `6.x.x`)
- `✅ inspec version – OK` if a version string is returned
- `❌ inspec version failed` — show output and suggest checking `PATH` or re-running `hab pkg binlink`

### 8e – Verify with `inspec detect`

```bash
inspec detect
```

- Expected: prints platform details (OS name, family, release, arch)
- `✅ inspec detect – OK` if platform info is returned
- `❌ inspec detect failed` — show output for diagnosis

### 8f – Final summary

Print a complete summary:

```
Platform    : <TARGET>
Package     : $pkg_ident
Artifact    : results/$pkg_artifact
inspec version : ✅ <version string>
inspec detect  : ✅ <platform info>
```

> *"The `<TARGET>` Habitat package is built, installed, and verified successfully."*
