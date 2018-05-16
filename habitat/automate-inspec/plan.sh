# This is a repackaging of InSpec for Automate 2.
# Changes:
#  * After installing inspec as a gem, install inspec-scap as a gem
#  * Force acceptance of a license to use inspec (TODO)
pkg_name=automate-inspec
pkg_origin=chef
pkg_version=$(cat "$PLAN_CONTEXT/../../VERSION")
pkg_description="InSpec packaged for use in Chef Automate"
pkg_upstream_url=https://www.inspec.io/
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Chef-MLSA")
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
  # TODO: inspec has core/postgresql listed here; why doesn't this file?
)
pkg_build_deps=(
  core/gcc
  core/git
  core/make
)
pkg_bin_dirs=(bin)

# Implementaion notes:
# * We assume we're being built from the inspec repo in the root directory
# * So, we already have the inspec files; but we need to fetch the inspec-scap code

do_prepare() {
  export GEM_HOME="$pkg_prefix/lib"
  build_line "Setting GEM_HOME=$GEM_HOME"
  export GEM_PATH="$GEM_HOME"
  build_line "Setting GEM_PATH=$GEM_PATH"
}

do_download() {
  # TODO: I can't get the token auth to work - it wants a username and then the token as password.  
  # git clone --depth=1 https://$GITHUB_TOKEN@github.com/chef/inspec-scap.git $INSPEC_SCAP_SRC_CACHE
  # https://github.com/chef/inspec-scap/archive/master.tar.gz
  # https://github.com/chef/inspec-scap/archive/1.7.0.tar.gz
  # Cheating by placing tarballs in mirror/
  true
}

do_unpack() {
  # Copy in the inspec source into the build area
  export INSPEC_MAIN_SRC_CACHE="$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec"
  mkdir -pv "$INSPEC_MAIN_SRC_CACHE"
  cp -R "$PLAN_CONTEXT"/../../ "$INSPEC_MAIN_SRC_CACHE"

  # Now obtain inspec-scap
  export INSPEC_SCAP_SRC_CACHE="$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec-scap"
  # TODO: this line is buried, should be moved to top
  export INSPEC_SCAP_VERSION=1.7.0 
  build_line "Cloning InSpec SCAP source to $INSPEC_SCAP_SRC_CACHE"
  mkdir -pv "$INSPEC_SCAP_SRC_CACHE"
  pushd $INSPEC_SCAP_SRC_CACHE
    # TODO, clone, don't untar
    tar xzf /src/mirror/inspec-scap-"$INSPEC_SCAP_VERSION".tar.gz
  popd
}

do_build() {
  # First build InSpec
  pushd "$INSPEC_MAIN_SRC_CACHE"
    gem build inspec.gemspec
  popd
  attach
  # Now build inspec-scap
  pushd "$INSPEC_SCAP_SRC_CACHE/inspec-scap-$INSPEC_SCAP_VERSION"
    gem build inspec-scap.gemspec
  popd
}

do_install() {
  # First install InSpec
  pushd "$INSPEC_MAIN_SRC_CACHE"
    gem install inspec-*.gem --no-document
  popd
  # Now install inspec-scap
  pushd "$INSPEC_SCAP_SRC_CACHE/inspec-scap-$INSPEC_SCAP_VERSION"
    gem install inspec-scap-*.gem --no-document
  popd

  wrap_inspec_bin
}

# Need to wrap the InSpec binary to ensure GEM_HOME/GEM_PATH is correct
wrap_inspec_bin() {
  local bin="$pkg_prefix/bin/inspec"
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
