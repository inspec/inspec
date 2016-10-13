pkg_name=inspec
pkg_origin=chef
pkg_version=$(cat "VERSION")
pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
pkg_upstream_url=https://github.com/chef/inspec
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2.0')
pkg_source=false
pkg_deps=(
  core/coreutils
  core/ruby
  core/net-tools
)
pkg_build_deps=(
  core/bundler
  core/coreutils
  core/gcc
  core/make
  core/readline
)
pkg_bin_dirs=(bin)

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_prepare() {
  # Create a Gemfile with what we need
  cat > Gemfile <<GEMFILE
source 'https://rubygems.org'
gem '$pkg_name', '= $pkg_version'
GEMFILE
}

do_build() {
  export BUNDLE_SILENCE_ROOT_WARNING=1 GEM_PATH
  GEM_PATH="$(pkg_path_for core/bundler)"
  bundle install --jobs "$(nproc)" --retry 5 --standalone \
    --path "$pkg_prefix/bundle" \
    --binstubs "$pkg_prefix/bin"
}

do_install () {
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
  cp Gemfile.lock "$pkg_prefix"
}
