#!/usr/bin/env bash
# scripts/dev/setup-hab-studio.sh
#
# Installs Chef Habitat (hab) if missing and configures all required
# environment variables for working with Habitat Studio on InSpec.
#
# Usage:
#   bash scripts/dev/setup-hab-studio.sh
#   source scripts/dev/setup-hab-studio.sh   # to export vars into current shell

set -eo pipefail

# ─── Helpers ──────────────────────────────────────────────────────────────────

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}✔${NC}  $*"; }
warn()    { echo -e "${YELLOW}⚠${NC}  $*"; }
error()   { echo -e "${RED}✗${NC}  $*" >&2; }
prompt()  { echo -e "\n${YELLOW}?${NC}  $*"; }

ask() {
  local var_name="$1"
  local question="$2"
  local default="$3"
  local value

  prompt "$question"
  if [[ -n "$default" ]]; then
    read -r -p "    [default: $default]: " value
    value="${value:-$default}"
  else
    read -r -p "    > " value
  fi
  eval "$var_name='$value'"
}

mask() {
  local val="$1"
  [[ -z "$val" ]] && echo "<not set>" || echo "${val:0:4}****"
}

# ─── Step 1: Detect OS ────────────────────────────────────────────────────────

echo ""
echo "════════════════════════════════════════════"
echo "  Chef Habitat Studio Setup for InSpec"
echo "════════════════════════════════════════════"
echo ""

OS="$(uname -s)"
case "$OS" in
  Darwin)  PLATFORM="macos" ;;
  Linux)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      PLATFORM="wsl"
    else
      PLATFORM="linux"
    fi
    ;;
  *)
    error "Unsupported OS: $OS"
    exit 1
    ;;
esac

info "Detected platform: $OS ($PLATFORM)"

# ─── Step 2: Check if hab is installed ───────────────────────────────────────

HAB_BIN=""
for candidate in hab /bin/hab /usr/local/bin/hab "$HOME/.hab/bin/hab"; do
  if command -v "$candidate" &>/dev/null; then
    HAB_BIN="$candidate"
    break
  fi
done

if [[ -n "$HAB_BIN" ]]; then
  HAB_VERSION="$($HAB_BIN --version 2>&1)"
  info "hab already installed: $HAB_VERSION"
else
  # ─── Step 3: Install hab ───────────────────────────────────────────────────
  echo ""
  warn "hab not found. Installing..."

  if [[ "$PLATFORM" == "macos" ]] && command -v brew &>/dev/null; then
    info "Installing via Homebrew..."
    brew install hab
  else
    info "Installing via curl installer..."
    curl -fsSL https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh | bash
  fi

  # ─── Step 4: Ensure hab is on PATH ────────────────────────────────────────
  for candidate in hab /bin/hab /usr/local/bin/hab "$HOME/.hab/bin/hab"; do
    if command -v "$candidate" &>/dev/null; then
      HAB_BIN="$candidate"
      break
    fi
  done

  if [[ -z "$HAB_BIN" ]]; then
    error "hab installation failed or not found on PATH."
    error "Check these locations manually: /bin/hab, /usr/local/bin/hab, \$HOME/.hab/bin/hab"
    exit 1
  fi

  HAB_VERSION="$($HAB_BIN --version 2>&1)"
  info "hab installed: $HAB_VERSION"
fi

# ─── Step 5: Check / prompt for environment variables ────────────────────────

echo ""
echo "--- Checking environment variables ---"
echo ""

# HAB_ORIGIN
if [[ -z "$HAB_ORIGIN" ]]; then
  ask HAB_ORIGIN "What is your HAB_ORIGIN (Habitat origin name, e.g. 'myorg' or 'chef')?" "chef"
fi
export HAB_ORIGIN
info "HAB_ORIGIN=$HAB_ORIGIN"

# HAB_LICENSE
if [[ -z "$HAB_LICENSE" ]]; then
  echo ""
  prompt "How would you like to accept the Chef license?"
  echo "    1) accept-no-persist  (this session only — recommended for local dev)"
  echo "    2) accept             (permanent)"
  read -r -p "    [default: 1]: " lic_choice
  lic_choice="${lic_choice:-1}"
  case "$lic_choice" in
    2) HAB_LICENSE="accept" ;;
    *) HAB_LICENSE="accept-no-persist" ;;
  esac
fi
export HAB_LICENSE
info "HAB_LICENSE=$HAB_LICENSE"

# HAB_REFRESH_CHANNEL
if [[ -z "$HAB_REFRESH_CHANNEL" ]]; then
  ask HAB_REFRESH_CHANNEL "HAB_REFRESH_CHANNEL — project default is 'base-2025'. Press enter to accept or type a different channel." "base-2025"
fi
export HAB_REFRESH_CHANNEL
info "HAB_REFRESH_CHANNEL=$HAB_REFRESH_CHANNEL"

# HAB_NONINTERACTIVE & HAB_NOCOLORING (auto-set, no prompt)
if [[ -z "$HAB_NONINTERACTIVE" ]]; then
  export HAB_NONINTERACTIVE=true
fi
if [[ -z "$HAB_NOCOLORING" ]]; then
  export HAB_NOCOLORING=true
fi
info "HAB_NONINTERACTIVE=$HAB_NONINTERACTIVE  HAB_NOCOLORING=$HAB_NOCOLORING"

# HAB_AUTH_TOKEN
if [[ -z "$HAB_AUTH_TOKEN" ]]; then
  echo ""
  prompt "Please provide your Habitat Builder auth token (HAB_AUTH_TOKEN):"
  read -r -s -p "    > " HAB_AUTH_TOKEN
  echo ""
fi
export HAB_AUTH_TOKEN
info "HAB_AUTH_TOKEN=$(mask "$HAB_AUTH_TOKEN")"

# ─── Step 6: Generate origin key if missing ───────────────────────────────────

echo ""
echo "--- Checking origin key ---"
echo ""

EXISTING_KEY=$(ls ~/.hab/cache/keys/"${HAB_ORIGIN}"*.pub 2>/dev/null | head -1 || \
               ls /hab/cache/keys/"${HAB_ORIGIN}"*.pub 2>/dev/null | head -1 || true)

if [[ -n "$EXISTING_KEY" ]]; then
  info "Origin key found: $EXISTING_KEY"
else
  warn "No origin key found for '$HAB_ORIGIN'. Generating..."
  $HAB_BIN origin key generate "$HAB_ORIGIN"
  EXISTING_KEY=$(ls ~/.hab/cache/keys/"${HAB_ORIGIN}"*.pub 2>/dev/null | head -1 || \
                 ls /hab/cache/keys/"${HAB_ORIGIN}"*.pub 2>/dev/null | head -1 || true)
  info "Origin key generated: $EXISTING_KEY"
fi

# ─── Step 7: Summary ──────────────────────────────────────────────────────────

echo ""
echo "════════════════════════════════════════════"
echo "  Setup Complete — Summary"
echo "════════════════════════════════════════════"
echo ""
echo "  hab version       : $HAB_VERSION"
echo "  HAB_ORIGIN        : $HAB_ORIGIN"
echo "  HAB_LICENSE       : $HAB_LICENSE"
echo "  HAB_REFRESH_CHANNEL: $HAB_REFRESH_CHANNEL"
echo "  HAB_NONINTERACTIVE: $HAB_NONINTERACTIVE"
echo "  HAB_NOCOLORING    : $HAB_NOCOLORING"
echo "  HAB_AUTH_TOKEN    : $(mask "$HAB_AUTH_TOKEN")"
echo "  Origin key        : $EXISTING_KEY"
echo ""
echo "  ── To persist these across sessions, add to ~/.zshrc or ~/.bashrc: ──"
echo ""
echo "    export HAB_ORIGIN=\"$HAB_ORIGIN\""
echo "    export HAB_LICENSE=\"$HAB_LICENSE\""
echo "    export HAB_REFRESH_CHANNEL=\"$HAB_REFRESH_CHANNEL\""
echo "    export HAB_NONINTERACTIVE=true"
echo "    export HAB_NOCOLORING=true"
echo "    # export HAB_AUTH_TOKEN=\"<your token>\"  # uncomment if needed"
echo ""
echo "  ── Next steps: ──"
echo ""
echo "    Enter Habitat Studio:"
echo "      hab studio enter"
echo ""
echo "    Build the InSpec Habitat package:"
echo "      DO_CHECK=true hab pkg build ."
echo ""
