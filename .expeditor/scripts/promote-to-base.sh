#!/bin/bash

set -euo pipefail

echo "--- Promoting Habitat package from base-2025-current to base"

# Expeditor provides these environment variables automatically
echo "Package Origin: ${EXPEDITOR_PKG_ORIGIN}"
echo "Package Name: ${EXPEDITOR_PKG_NAME}"
echo "Package Version: ${EXPEDITOR_PKG_VERSION}"
echo "Package Release: ${EXPEDITOR_PKG_RELEASE}"
echo "Package Ident: ${EXPEDITOR_PKG_IDENT}"
echo "Package Target: ${EXPEDITOR_PKG_TARGET}"
echo "Source Channel: ${EXPEDITOR_CHANNEL}"

# Get HAB_AUTH_TOKEN from vault
HAB_AUTH_TOKEN=$(vault kv get -field auth_token account/static/habitat/chef-ci)
export HAB_AUTH_TOKEN

# Habitat 2.0+ uses 'base' as the default channel for chef-origin packages.
# This is a workaround until Expeditor has native support for promoting to
# additional channels beyond the ones bumped via built_in:promote_habitat_packages.
echo "--- Promoting ${EXPEDITOR_PKG_IDENT} to base channel"
hab pkg promote "${EXPEDITOR_PKG_IDENT}" "base"

echo "--- Promotion completed successfully!"
