#!/usr/bin/env bash

set -eo pipefail

export PLAN='inspec'
export CHEF_LICENSE="accept-no-persist"
export HAB_LICENSE="accept-no-persist"

echo "--- checking if git is installed"
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo yum install -y git
else
    echo "Git is already installed."
    git --version
fi

echo "--- add an exception for this directory since detected dubious ownership in repository at /workdir"
git config --global --add safe.directory /workdir

echo "--- git status for this workdir"
git status

echo "--- ruby version"
ruby -v

export project_root="$(git rev-parse --show-toplevel)"
echo "The value for project_root is: $project_root"

export HAB_NONINTERACTIVE=true
export HAB_NOCOLORING=true
export HAB_STUDIO_SECRET_HAB_NONINTERACTIVE=true
export HAB_REFRESH_CHANNEL="base-2025"

echo "--- system details"
uname -a

echo "--- Installing Habitat"
id -a
curl https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.sh | bash

# Set HAB_ORIGIN after Habitat installation
echo "--- Setting HAB_ORIGIN to 'ci' after installation"
export HAB_ORIGIN='ci'

echo "--- Generating fake origin key"
hab origin key generate $HAB_ORIGIN
# Use a glob loop instead of `realpath` (GNU-only, unavailable on macOS).
# Check /hab/cache/keys (Linux) first, then $HOME/.hab/cache/keys (macOS).
HAB_CI_KEY=""
for f in /hab/cache/keys/"$HAB_ORIGIN"*.pub "$HOME/.hab/cache/keys/$HAB_ORIGIN"*.pub; do
    if [ -f "$f" ]; then
        HAB_CI_KEY="$f"
        break
    fi
done
export HAB_CI_KEY
if [ -f "$HAB_CI_KEY" ]; then
    hab origin key import < "$HAB_CI_KEY"
else
    echo "Origin key for $HAB_ORIGIN not found in /hab/cache/keys or $HOME/.hab/cache/keys"
    exit 1
fi


echo "--- Building $PLAN"
cd "$project_root"
DO_CHECK=true hab pkg build .

echo "--- Sourcing 'results/last_build.sh'"
if [ -f ./results/last_build.env ]; then
    cat ./results/last_build.env
    . ./results/last_build.env
    export pkg_artifact
fi

echo "+++ Installing ${pkg_ident:?is undefined}"
echo "++++"
echo $project_root
echo "+++"
# Skip -b (binlink into /usr/local/bin) — requires root on macOS; PATH is set below via hab pkg path.
hab pkg install "${project_root:?is undefined}/results/${pkg_artifact:?is undefined}"

echo "--- Removing world readability from /usr/local/bundle"
# /usr/local/bundle only exists in Docker Ruby images (Linux). Skip on macOS.
[ -d /usr/local/bundle ] && chmod go-w /usr/local/bundle || true

echo "+++ Testing $PLAN"

PATH="$(hab pkg path ci/inspec)/bin:$PATH"
export PATH
echo "PATH is $PATH"

pushd "$project_root/test/artifact"
rake
popd

# ---------------------------------------------------------------------------
# Export hab tar from the locally-built hart and upload to S3.
#
# Exporting from the local results/ hart (not from a channel) means:
#   - No HAB_AUTH_TOKEN needed for the export step
#   - The tar is produced on the exact platform/arch the package was built for
#   - Works on macOS ARM64 agents that have no EC2 IAM role for channel access
# ---------------------------------------------------------------------------
echo "--- Exporting hab tar from local build artifact"
BUILD_PKG_TARGET="${BUILD_PKG_TARGET:-x86_64-linux}"
arch="${BUILD_PKG_TARGET%%-*}"      # x86_64 | aarch64
platform="${BUILD_PKG_TARGET##*-}"  # linux  | darwin

cd "$project_root"

# Export from the local hart — no channel download, no auth token required.
hab pkg export tar "${project_root}/results/${pkg_artifact}" --no-hab-bin

# Locate and rename to the standard inspec-enterprise naming convention.
original_tar_name=$(find . -maxdepth 1 -name "chef-inspec-*.tar.gz" -type f | head -1 | xargs basename 2>/dev/null || true)
if [[ -z "$original_tar_name" ]]; then
  echo "ERROR: could not find chef-inspec-*.tar.gz after export" >&2
  ls -la ./*.tar.gz 2>/dev/null || true
  exit 1
fi
echo "Exported tarball: $original_tar_name"

# Extract version and timestamp using sed (macOS/BSD-compatible; no grep -P).
version=$(echo "$original_tar_name" | sed 's/chef-inspec-\([0-9]*\.[0-9]*\.[0-9]*\)-.*/\1/')
timestamp=$(echo "$original_tar_name" | sed 's/chef-inspec-[0-9]*\.[0-9]*\.[0-9]*-\([0-9]*\)\.tar\.gz/\1/')
tar_name="inspec-enterprise-${version}-${timestamp}.tar.gz"
mv "$original_tar_name" "$tar_name"
echo "Renamed to: $tar_name"

# Upload tarball to S3 at the platform/arch-specific unstable path.
echo "--- Uploading tar to S3"
aws s3 cp "$tar_name" \
  "s3://chef-enterprise-artifacts/software-unstable-local/inspec-enterprise/${version}/${platform}/${arch}/${tar_name}"

echo "--- Tar export and upload complete"
