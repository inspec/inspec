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

  # Needed for some InSpec resources
  core/bind
  core/curl
  core/docker
  core/git
  core/less
  core/mysql-client
  core/netcat
  core/postgresql
)
pkg_build_deps=(
  core/gcc
  core/make
  core/readline
  core/sed
)
pkg_bin_dirs=(bin)

do_prepare() {
  export GEM_HOME="$pkg_prefix/lib"
  build_line "Setting GEM_HOME=$GEM_HOME"
  export GEM_PATH="$GEM_HOME"
  build_line "Setting GEM_PATH=$GEM_PATH"
}

do_unpack() {
  mkdir -pv "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  cp -R "$PLAN_CONTEXT"/../ "$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

do_build() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem build inspec.gemspec
  popd
}

do_install() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem install inspec-*.gem --no-document
  popd

  wrap_inspec_bin
}

# Need to wrap the InSpec binary to ensure GEM_HOME/GEM_PATH is correct
wrap_inspec_bin() {
  local bin="$pkg_prefix/bin/$pkg_name"
  local real_bin="$GEM_HOME/gems/inspec-${pkg_version}/bin/inspec"
  build_line "Adding wrapper $bin to $real_bin"
  cat <<EOF > "$bin"
#!$(pkg_path_for busybox-static)/bin/sh
export SSL_CERT_FILE=$(pkg_path_for cacerts)/ssl/cert.pem
set -e
export GEM_HOME="$GEM_HOME"
export GEM_PATH="$GEM_PATH"
exec $(pkg_path_for core/ruby)/bin/ruby $real_bin \$@
EOF
  chmod -v 755 "$bin"
}

do_strip() {
  return 0
}
