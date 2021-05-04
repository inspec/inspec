#!/bin/bash
set -ueo pipefail

# Set GEM_HOME and GEM_PATH to verify our appbundle inspec shim is correctly
# removing them from the environment while launching from our embedded ruby.
export GEM_HOME=/SHOULD_NOT_EXIST
export GEM_PATH=/SHOULD_NOT_EXIST

inspec version
