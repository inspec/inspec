#!/bin/bash
set -eo pipefail

channel="${CHANNEL:-unstable}"
product="${PRODUCT:-inspec}"
version="${VERSION:-latest}"
package_file=${PACKAGE_FILE:-""}

echo "--- Installing $channel $product $version"
if [[ -z $package_file ]]; then
  package_file="$(.omnibus-buildkite-plugin/install-omnibus-product.sh -c "$channel" -P "$product" -v "$version" | tail -1)"
else
  .omnibus-buildkite-plugin/install-omnibus-product.sh -f "$package_file" -P "$product" -v "$version" &> /dev/null
fi

echo "--- Verifying omnibus package is signed"
/opt/omnibus-toolchain/bin/check-omnibus-package-signed "$package_file"

sudo rm -f "$package_file"

echo "--- Verifying ownership of package files"

export INSTALL_DIR=/opt/inspec
NONROOT_FILES="$(find "$INSTALL_DIR" ! -user 0 -print)"
if [[ "$NONROOT_FILES" == "" ]]; then
  echo "Packages files are owned by root.  Continuing verification."
else
  echo "Exiting with an error because the following files are not owned by root:"
  echo "$NONROOT_FILES"
  exit 1
fi

echo "--- Running verification for $channel $product $version"

export CHEF_LICENSE="accept-no-persist"
project_root="$(pwd)"
export project_root

cd test/artifact

PATH=/opt/inspec/bin:/opt/inspec/embedded/bin:$PATH
export PATH

rake
