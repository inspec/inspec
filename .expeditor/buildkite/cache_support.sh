#!/bin/bash

set -ue

S3_URL="s3://public-cd-buildkite-cache/${BUILDKITE_PIPELINE_SLUG}/${BUILDKITE_LABEL}"

pull_s3_file() {
    aws s3 cp "${S3_URL}/$1" "$1" || echo "Could not pull $1 from S3"
}

push_s3_file() {
    if [ -f "$1" ]; then
        aws s3 cp "$1" "${S3_URL}/$1" || echo "Could not push $1 to S3 for caching."
    fi
}

# Debian 11 (bullseye) reached EOL on 2026-08-31. Its live
# deb.debian.org / security.debian.org repos no longer publish fresh
# Release files (causing "Release file ... is expired") and their
# package indexes have drifted out of sync with each other, leading to
# 404s (e.g. sudo, libssl-dev) and unmet-dependency errors on install.
# Scope a workaround to Debian 11 only: disable every live repo
# definition (classic sources.list *and* deb822 sources.list.d/*.sources,
# regardless of host) and replace them with an explicit, pinned,
# internally-consistent snapshot.debian.org mirror. Other apt-based
# platforms (e.g. Ubuntu) are untouched.
fix_debian_11_eol_repos() {
    local os_id="" os_version_id=""
    if [ -r /etc/os-release ]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        os_id="${ID:-}"
        os_version_id="${VERSION_ID:-}"
    fi

    if [ "$os_id" != "debian" ] || [ "$os_version_id" != "11" ]; then
        return 1
    fi

    echo "--- detected Debian 11 (bullseye, EOL); switching to snapshot.debian.org"

    # Pin to a snapshot taken shortly before bullseye's EOL date so all
    # three components (main/security/updates) are guaranteed to be
    # internally consistent with each other.
    local snapshot_ts="20260824T000000Z"

    # Disable any live repo definitions, in whatever form/location they
    # exist, instead of relying on a specific commented-out line being
    # present.
    if [ -f /etc/apt/sources.list ]; then
        sed -i -E \
            's~^[[:space:]]*deb(-src)?[[:space:]]+(\[[^]]*\][[:space:]]+)?https?://(deb|security)\.debian\.org/.*~# &~' \
            /etc/apt/sources.list
    fi
    if [ -d /etc/apt/sources.list.d ]; then
        for f in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
            [ -e "$f" ] || continue
            if grep -Eq 'https?://(deb|security)\.debian\.org' "$f" 2>/dev/null; then
                mv "$f" "$f.disabled"
            fi
        done
    fi

    # Write an explicit, known-good snapshot source rather than assuming
    # the image already ships one to uncomment.
    cat >/etc/apt/sources.list.d/debian-11-eol-snapshot.list <<-EOF
	deb http://snapshot.debian.org/archive/debian/${snapshot_ts} bullseye main
	deb http://snapshot.debian.org/archive/debian-security/${snapshot_ts} bullseye-security main
	deb http://snapshot.debian.org/archive/debian/${snapshot_ts} bullseye-updates main
	EOF
}

install_cache_deps() {
    if fix_debian_11_eol_repos; then
        apt-get update -y -o Acquire::Check-Valid-Until=false
    else
        apt-get update -y
    fi

    if [ -n "${1:-}" ]; then
        apt-get install "$@" -y
    fi

    if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
        apt-get install awscli -y
    fi
}

pull_bundle() {
    if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
        pull_s3_file "bundle.tar.gz"
        pull_s3_file "bundle.sha256"

        if [ -f bundle.tar.gz ]; then
            tar -xzf bundle.tar.gz
            mv Gemfile.lock Gemfile.lock.old || true
        fi

        if [ -n "${RESET_BUNDLE_CACHE:-}" ]; then
            rm bundle.sha256
        fi
    fi
}

push_bundle() {
    if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
        if test -f bundle.sha256 && shasum --check bundle.sha256 --status; then
            echo "Bundled gems have not changed. Skipping upload to s3"
        else
            echo "Bundled gems have changed. Uploading to s3"
            shasum -a 256 Gemfile.lock > bundle.sha256
            tar -czf bundle.tar.gz Gemfile.lock vendor/
            push_s3_file bundle.tar.gz
            push_s3_file bundle.sha256
        fi
    fi
}
