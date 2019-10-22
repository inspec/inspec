#!/usr/bin/env bash

set -ueo pipefail

hab origin key import < "$HAB_CI_KEY"
hab pkg install --binlink "./results/${pkg_artifact:?is undefined}"
