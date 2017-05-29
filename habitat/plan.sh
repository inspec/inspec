pkg_name=inspec
pkg_origin=chef
pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
pkg_upstream_url=https://www.inspec.io/
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2.0')
pkg_deps=(
  core/busybox-static
  core/cacerts
  core/coreutils
  core/libxml2
  core/libxslt
  core/net-tools
  core/ruby
)
pkg_build_deps=(
  core/bundler
  core/gcc
  core/make
  core/readline
  core/sed
)
pkg_bin_dirs=(bin)

pkg_version() {
  cat VERSION
}

do_before() {
  if [[ ! -f VERSION ]]; then
    exit_with "habitat/VERSION not found. Run 'rake release_habitat' to ensure it exists" 1
  fi
  update_pkg_version
}

do_prepare() {
  # If we use the Gemfile in the project ($SRC_PATH/Gemfile), and run `bundle
  # install` (which we do in `do_build` below), Bundler will write out a
  # .bundle/config into the $SRC_PATH. If this happens, if you try to use
  # InSpec outside of the build process it will fail, since the settings used
  # in this plan will be saved in the .bundle/config.
  #
  # Instead, we build a minimal Gemfile in the $CACHE_PATH and bundle using that.
  cat > "$CACHE_PATH/Gemfile" <<GEMFILE
source 'https://rubygems.org'
gem '$pkg_name', path: '$SRC_PATH'
GEMFILE

  export BUNDLE_SILENCE_ROOT_WARNING GEM_HOME GEM_PATH
  BUNDLE_SILENCE_ROOT_WARNING=1
  build_line "Setting BUNDLE_SILENCE_ROOT_WARNING=$BUNDLE_SILENCE_ROOT_WARNING"
  GEM_HOME="$pkg_prefix/vendor/bundle"
  build_line "Setting GEM_HOME=$GEM_HOME"
  GEM_PATH="$(pkg_path_for bundler):$GEM_HOME"
  build_line "Setting GEM_PATH=$GEM_PATH"
}

do_build() {
  bundle install \
    --binstubs "$pkg_prefix/bin" \
    --gemfile "$CACHE_PATH/Gemfile" \
    --jobs "$(nproc)" \
    --path "$pkg_prefix/bundle" \
    --retry 5 \
    --standalone

  # Delete everything that's not inspec in bin
  find "$pkg_prefix/bin" -type f -not -name 'inspec' -delete

  fix_interpreter "$pkg_prefix/bin/inspec" core/coreutils bin/env

  # Insert the SSL cert path into the inspec executable
  sed -i "2iENV['SSL_CERT_FILE'] = '$(pkg_path_for cacerts)/ssl/cert.pem'" \
    "$pkg_prefix/bin/inspec"
}

do_install() {
  install -m 0644 Gemfile.lock "$pkg_prefix/Gemfile.lock"
}

do_strip() {
  return 0
}
