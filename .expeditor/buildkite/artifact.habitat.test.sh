#!/usr/bin/env bash

set -ueo pipefail

export HAB_ORIGIN='ci'
export PLAN='inspec'
export CHEF_LICENSE="accept-no-persist"
export HAB_LICENSE="accept-no-persist"
export CI_USER=$(whoami)

echo "--- system details"
uname -a

echo "--- Generating fake origin key"
hab origin key generate $HAB_ORIGIN

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
echo "$HOME"

env

sudo -E cat /var/lib/"$CI_USER"/.hab/"$HAB_ORIGIN"*.pub /usr/bin/hab origin key import

sudo -E hab pkg install "./results/${pkg_artifact:?is undefined}"

echo "+++ Testing $PLAN"
pushd "$project_root/test/artifact"
rake
popd
