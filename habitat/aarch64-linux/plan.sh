# These metadata fields are declared explicitly so that Expeditor can parse
# this file statically (it uses a regex on raw file contents).
# They are immediately overridden by the sourced plan below.
pkg_name=inspec

# Reuse the x86_64-linux plan for Linux ARM builds.
source "$(dirname "${BASH_SOURCE[0]}")/../x86_64-linux/plan.sh"
