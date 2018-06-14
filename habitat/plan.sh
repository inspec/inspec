pkg_name=inspec
pkg_origin=chef
pkg_version=$(cat "$PLAN_CONTEXT/../VERSION")
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
  core/bundler
)
pkg_build_deps=(
  core/bundler
  core/gcc
  core/make
  core/readline
  core/sed
)
pkg_bin_dirs=(bin)

do_prepare() {
  export BUNDLE_SILENCE_ROOT_WARNING GEM_HOME GEM_PATH
  BUNDLE_SILENCE_ROOT_WARNING=1
  build_line "Setting BUNDLE_SILENCE_ROOT_WARNING=$BUNDLE_SILENCE_ROOT_WARNING"
  GEM_HOME="$pkg_prefix/vendor/bundle"
  build_line "Setting GEM_HOME=$GEM_HOME"
  GEM_PATH="$(pkg_path_for bundler):$GEM_HOME"
  build_line "Setting GEM_PATH=$GEM_PATH"
}

do_build() {
  # If we use the Gemfile in the project ($SRC_PATH/Gemfile), and run `bundle
  # install` (which we do in `do_build` below), Bundler will write out a
  # .bundle/config into the $SRC_PATH. If this happens, if you try to use
  # InSpec outside of the build process it will fail, since the settings used
  # in this plan will be saved in the .bundle/config.
  #
  # Instead, we first use Bundler to build up a local cache of gem dependencies.
  # Then when we build, we'll build the InSpec gem and write out a new Gemfile
  # to use that instead.
  #
  # Building up the local cache of dependencies is necessary because Bundler won't
  # try and walk the sources if it finds the initial gem in the local cache.
  build_line "Caching InSpec's gem dependencies..."
  mkdir -p $CACHE_PATH/vendor/cache

  cat > "$CACHE_PATH/Gemfile" <<GEMFILE
source 'https://rubygems.org'
gem '$pkg_name', path: "${PLAN_CONTEXT}/.."
GEMFILE

  bundle install \
    --binstubs "$pkg_prefix/bin" \
    --gemfile "$CACHE_PATH/Gemfile" \
    --jobs "$(nproc)" \
    --path "$pkg_prefix/bundle" \
    --retry 5 \
    --standalone

  build_line "Building the InSpec gem..."
  gem build inspec.gemspec

  build_line "Moving the InSpec gem into the cache path..."
  mv inspec-${pkg_version}.gem ${CACHE_PATH}/vendor/cache

  build_line "Re-bundling with the new InSpec gem..."
  cat > "$CACHE_PATH/Gemfile" <<GEMFILE
gem '$pkg_name', '= ${pkg_version}'
GEMFILE

  bundle install \
    --binstubs "$pkg_prefix/bin" \
    --gemfile "$CACHE_PATH/Gemfile" \
    --jobs "$(nproc)" \
    --path "$pkg_prefix/bundle" \
    --retry 5 \
    --local \
    --standalone

  # Delete everything that's not inspec in bin
  find "$pkg_prefix/bin" -type f -not -name 'inspec' -delete

  fix_interpreter "$pkg_prefix/bin/inspec" core/ruby ruby

  # Insert the SSL cert path into the inspec executable
  sed -i "2iENV['SSL_CERT_FILE'] = '$(pkg_path_for cacerts)/ssl/cert.pem'" \
    "$pkg_prefix/bin/inspec"
}

do_install() {
  install -m 0644 ${CACHE_PATH}/Gemfile.lock "$pkg_prefix/Gemfile.lock"
}

do_strip() {
  return 0
}
