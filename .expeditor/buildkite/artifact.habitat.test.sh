#!/usr/bin/env bash

set -eo pipefail

export HAB_ORIGIN='ci'
export PLAN='inspec'
export CHEF_LICENSE="accept-no-persist"
export HAB_LICENSE="accept-no-persist"
export project_root="$(git rev-parse --show-toplevel)"
export HAB_NONINTERACTIVE=true
export HAB_NOCOLORING=true
export HAB_STUDIO_SECRET_HAB_NONINTERACTIVE=true

echo "--- system details"
uname -a

echo "--- Installing Habitat"
id -a
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | bash


echo "--- Generating fake origin key"
hab origin key generate $HAB_ORIGIN
HAB_CI_KEY=$(realpath /hab/cache/keys/"$HAB_ORIGIN"*.pub)
export HAB_CI_KEY
if [ -f "$HAB_CI_KEY" ]; then
    hab origin key import < "$HAB_CI_KEY"
else
    echo "$HAB_CI_KEY not found"
    ls "$HOME/.hab/cache/keys"
    ls "$project_root/hab/cache/keys"
    ls /hab
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
hab pkg install -b "${project_root:?is undefined}/results/${pkg_artifact:?is undefined}"

echo "--- Removing world readability from /usr/local/bundle"
chmod go-w /usr/local/bundle

echo "+++ Testing $PLAN"

PATH="$(hab pkg path ci/inspec)/bin:$PATH"
export PATH
echo "PATH is $PATH"

pushd "$project_root/test/artifact"
rake
