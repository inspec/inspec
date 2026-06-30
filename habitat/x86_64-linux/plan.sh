export HAB_BLDR_CHANNEL="base-2025"
export HAB_REFRESH_CHANNEL="base-2025"
pkg_name=inspec
pkg_origin=chef
pkg_version=$(cat "$PLAN_CONTEXT/../../VERSION")
pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
pkg_upstream_url=https://www.inspec.io/
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2.0')
pkg_deps=(
  core/coreutils
  core/git
  core/ruby3_4
  core/bash
  core/gcc
  core/make
)
pkg_build_deps=(
  core/gcc
  core/make
  core/readline
  core/sed
)
pkg_bin_dirs=(bin)

do_prepare(){
  export HAB_STUDIO_SECRET_NODE_OPTIONS="--dns-result-order=ipv4first"
}

do_setup_environment() {
  build_line 'Setting GEM_HOME="$pkg_prefix/lib"'
  export GEM_HOME="$pkg_prefix/lib"

  build_line "Setting GEM_PATH=$GEM_HOME:${INSPEC_CONFIG_DIR:-~/.inspec}"
  export GEM_PATH="$GEM_HOME:${INSPEC_CONFIG_DIR:-~/.inspec}"
}

do_unpack() {
  mkdir -pv "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  cp -RT "$PLAN_CONTEXT"/../.. "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
}

do_build() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem build inspec.gemspec
    gem build inspec-core.gemspec
  popd
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec-bin"
    gem build inspec-bin.gemspec
  popd
}

do_install() {
  export ARTIFACTORY_URL="https://artifactory-internal.ps.chef.co/artifactory/omnibus-gems-local/"
  gem sources --add "$ARTIFACTORY_URL"
  gem install chef-official-distribution --ignore-dependencies --no-document
  gem sources --remove "$ARTIFACTORY_URL"

  # MUST install inspec first because inspec-bin depends on it via gemspec
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem install inspec-*.gem --no-document
  popd
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec-bin"
    gem install inspec-bin*.gem --no-document
  popd

  wrap_compiler_bins
  wrap_inspec_bin

  # Copy NOTICE.TXT to the package directory
  if [[ -f "$PLAN_CONTEXT/../../NOTICE.TXT" ]]; then
    build_line "Copying NOTICE.TXT to package directory"
    cp "$PLAN_CONTEXT/../../NOTICE.TXT" "$pkg_prefix/"
  else
    build_line "Warning: NOTICE.TXT not found at $PLAN_CONTEXT/../../NOTICE.TXT"
  fi

  # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
  # for omnibus we also install this as part of the package
  gem install ed25519 bcrypt_pbkdf --no-document

  # Clean up stray Gemfile.lock from lint_roller gem to appease security scanners
  ruby "$HAB_CACHE_SRC_PATH/$pkg_dirname/scripts/cleanup_lint_roller.rb"

  # Certain gems (timeliness) are getting installed with world writable files
  # This is removing write bits for group and other.
  find "$GEM_HOME" -xdev -perm -0002 -type f -print 2>/dev/null | xargs -I '{}' chmod go-w '{}'
}

# Create wrapper scripts for gcc/cc/g++/c++ so that native gem compilation
# works at runtime. mkmf.rb overrides LD_LIBRARY_PATH when running compile
# tests (to only include Ruby's lib dir), which prevents Hab's gcc from
# loading its own shared libraries (libstdc++.so.6, libgcc_s.so.1).
# A bash wrapper script avoids this problem: it sets LD_LIBRARY_PATH from
# within the forked process itself, AFTER mkmf's override, so the Hab gcc
# binary can always find its own shared libraries.
wrap_compiler_bins() {
  local gcc_bin_dir="$(pkg_path_for core/gcc)/bin"
  local gcc_lib="$(pkg_path_for core/gcc)/lib"
  local gcc_lib64="$(pkg_path_for core/gcc)/lib64"
  local bash_bin="$(pkg_path_for core/bash)/bin/bash"

  for name in gcc cc g++ c++; do
    local wrapper="$pkg_prefix/bin/$name"
    local real_bin
    case "$name" in
      cc|gcc)  real_bin="$gcc_bin_dir/gcc" ;;
      c++|g++) real_bin="$gcc_bin_dir/g++" ;;
    esac

    build_line "Creating compiler wrapper $wrapper -> $real_bin"
    cat <<EOF > "$wrapper"
#!$bash_bin
# Ensure Hab gcc's own shared libraries (libstdc++, libgcc_s) are available.
# This is set inside the wrapper so it takes effect even when mkmf.rb
# overrides the outer LD_LIBRARY_PATH during native extension compilation.
export LD_LIBRARY_PATH="${gcc_lib}:${gcc_lib64}:\$LD_LIBRARY_PATH"
exec "$real_bin" "\$@"
EOF
    chmod -v 755 "$wrapper"
  done
}

# Need to wrap the InSpec binary to ensure paths are correct
wrap_inspec_bin() {
  local bin="$pkg_prefix/bin/$pkg_name"
  local real_bin="$GEM_HOME/gems/inspec-bin-${pkg_version}/bin/inspec"
  build_line "Adding wrapper $bin to $real_bin"
  cat <<EOF > "$bin"
#!$(pkg_path_for core/bash)/bin/bash
set -e

# $pkg_prefix/bin contains gcc/cc/g++/c++ wrapper scripts that self-correct
# LD_LIBRARY_PATH so the Hab-bundled gcc can load its own shared libraries
# when building native gem extensions (e.g. bson, ed25519). These must come
# before any system or Hab gcc paths so the wrappers are found first.
export PATH="$pkg_prefix/bin:$(pkg_path_for core/gcc)/bin:$(pkg_path_for core/make)/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:\$PATH"

# Explicitly set CC/MAKE so mkmf uses the Hab-bundled wrappers even when
# RbConfig::CONFIG['CC'] points to a different compiler path.
export CC="$pkg_prefix/bin/gcc"
export MAKE="$(pkg_path_for core/make)/bin/make"

# Set Ruby paths defined from 'do_setup_environment()'
export GEM_HOME="$GEM_HOME"
export GEM_PATH="$GEM_PATH"

exec $(pkg_path_for core/ruby3_4)/bin/ruby $real_bin \$@
EOF
  chmod -v 755 "$bin"
}

do_strip() {
  return 0
}
