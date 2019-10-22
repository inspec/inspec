#!/usr/bin/env bash

set -ueo pipefail

export HAB_ORIGIN='ci'
export PLAN='inspec'
export CHEF_LICENSE="accept-no-persist"
export HAB_LICENSE="accept-no-persist"

echo "--- system details"
uname -a

echo "--- Generating fake origin key"
hab origin key generate $HAB_ORIGIN
HAB_CI_KEY=$(realpath "$HOME"/.hab/cache/keys/"$HAB_ORIGIN"*.pub)
export HAB_CI_KEY

echo "--- Building $PLAN"
project_root="$(git rev-parse --show-toplevel)"
cd "$project_root"

DO_CHECK=true hab pkg build .

echo "--- Sourcing 'results/last_build.sh'"
if [ -f ./results/last_build.env ]; then
    . ./results/last_build.env
fi

echo "+++ Installing ${pkg_ident:?is undefined}"

whoami
echo "$HAB_CI_KEY"

sudo -E cat "$HAB_CI_KEY" | /usr/bin/hab origin key import && hab pkg install "./results/${pkg_artifact:?is undefined}"

echo "+++ Testing $PLAN"
pushd "$project_root/test/artifact"
rake
popd
