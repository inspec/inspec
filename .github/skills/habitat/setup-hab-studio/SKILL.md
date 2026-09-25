---
name: setup-hab-studio
description: Check if Chef Habitat (hab) is installed and set up. If not installed, install it for the current platform and configure required environment variables by prompting the user for any that are missing.
---

You are a tool that helps the user install and configure Chef Habitat (`hab`) and prepare their environment for working with Habitat Studio on this InSpec project.

Follow each step in order. Be thorough but only ask for information that is actually needed.

## 1. Detect the Operating System

Determine whether the user is on:
- **macOS** (Darwin)
- **Linux**
- **Windows** — check if they are using WSL (Windows Subsystem for Linux); if so, treat as Linux for installation purposes

Use `uname -s` on macOS/Linux. On Windows, check for WSL via `/proc/version` or `uname -r`.

## 2. Check if `hab` is Already Installed

Run `hab --version`.

- If it succeeds, report the installed version and skip to **Step 5** (env var check). Do not reinstall.
- If it fails or the command is not found, proceed to **Step 3**.

## 3. Install `hab`

Install based on the detected platform:

### macOS
First try Homebrew:
```
brew install hab
```
If Homebrew is not available, fall back to the curl installer:
```
curl https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh | bash
```

### Linux
Use the official curl installer:
```
curl https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh | bash
```

### Windows (WSL)
Run inside the WSL bash shell:
```
curl https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh | bash
```

After installation, verify with `hab --version` and report the installed version. If installation failed, report the error and stop.

## 4. Ensure `hab` is on PATH

After installation, if `hab --version` still fails, check common install paths:
- `/bin/hab`
- `/usr/local/bin/hab`
- `$HOME/.hab/bin/hab`

If found, inform the user to add the directory to their `PATH` and provide the exact export command.

## 5. Check Required Environment Variables

Check each of the following environment variables. For any that are not set or empty, prompt the user:

### `HAB_ORIGIN`
- **Required.** This is the Habitat origin name used for building packages.
- Check: `echo $HAB_ORIGIN`
- If not set: Ask the user — *"What is your HAB_ORIGIN (your Habitat origin name)? This is typically your username or your organization's origin (e.g., 'myorg')."*
- Set it: `export HAB_ORIGIN=<value>`

### `HAB_LICENSE`
- **Required.** Controls license acceptance for Chef products.
- Check: `echo $HAB_LICENSE`
- If not set: Ask the user — *"How would you like to accept the Chef license? Options: `accept` (permanent), `accept-no-persist` (for this session only, recommended for local dev)."*
- Default recommendation: `accept-no-persist`
- Set it: `export HAB_LICENSE=<value>`

### `HAB_REFRESH_CHANNEL`
- **Optional but recommended.** Controls which channel to pull base packages from.
- Check: `echo $HAB_REFRESH_CHANNEL`
- If not set: Inform the user the default used in this project is `base-2025` and ask — *"Should I set HAB_REFRESH_CHANNEL to `base-2025` (project default), or do you want a different channel?"*
- Set it: `export HAB_REFRESH_CHANNEL=<value>`

### `HAB_NONINTERACTIVE` and `HAB_NOCOLORING`
- **Optional but helpful for automation and clean output.**
- If either is not set, automatically set both to `true` without prompting.
- Set them: `export HAB_NONINTERACTIVE=true && export HAB_NOCOLORING=true`

### `HAB_AUTH_TOKEN`
- **Required** for authenticating with Habitat Builder to push/pull packages.
- Check: `echo $HAB_AUTH_TOKEN`
- If not set: Ask — *"Please provide your Habitat Builder auth token (HAB_AUTH_TOKEN)."*
- If provided, set: `export HAB_AUTH_TOKEN=<value>`

## 6. Generate Origin Key if Missing

After `HAB_ORIGIN` is confirmed, check whether an origin key already exists:
```
ls ~/.hab/cache/keys/${HAB_ORIGIN}*.pub 2>/dev/null || ls /hab/cache/keys/${HAB_ORIGIN}*.pub 2>/dev/null
```

- If a key is found, report it and skip key generation.
- If no key is found, generate one:
  ```
  hab origin key generate $HAB_ORIGIN
  ```
  Report the key path after generation.

## 7. Output Summary and Persistence Commands

After all steps are complete, output a clear summary:

1. **Installation status** — whether `hab` was already installed or was just installed, and the version.
2. **Environment variables set** — list each one and its value (mask any token values).
3. **Origin key** — whether it existed or was just generated, and the key file path.
4. **Shell export commands to persist** — provide a copy-pasteable block of `export` commands the user can add to their shell profile (`.zshrc`, `.bashrc`, etc.):

```sh
export HAB_ORIGIN="chef"
export HAB_LICENSE="accept-no-persist"
export HAB_REFRESH_CHANNEL="base-2025"
export HAB_NONINTERACTIVE=true
export HAB_NOCOLORING=true
# export HAB_AUTH_TOKEN="<value>"  # uncomment if needed
```

5. **Next step** — Remind the user they can now enter the Habitat Studio with:
   ```
   hab studio enter
   ```
   Or build the InSpec Habitat package with:
   ```
   DO_CHECK=true hab pkg build .
   ```
