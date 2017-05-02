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
  core/libxml2
  core/libxslt
  core/ruby
  core/net-tools
  core/hab
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
gem 'rake'
GEMFILE
}

do_build() {
  local _bundler_dir
  local _libxml2_dir
  local _libxslt_dir

  _bundler_dir="$(pkg_path_for bundler)"

  export GEM_HOME=${pkg_path}/vendor/bundle
  export GEM_PATH=${_bundler_dir}:${GEM_HOME}
  export BUNDLE_SILENCE_ROOT_WARNING=1

  bundle install --jobs "$(nproc)" --retry 5 --standalone \
    --path "$pkg_prefix/bundle" \
    --binstubs "$pkg_prefix/bin"
}

do_install () {
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
  cp Gemfile.lock "$pkg_prefix"
}
