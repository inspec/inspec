$pkg_name="inspec"
$pkg_origin="miah"
$pkg_version=$(cat "$PLAN_CONTEXT/../VERSION")
$pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
$pkg_upstream_url="https://www.inspec.io/"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=('Apache-2.0')
$pkg_deps=@(
  "core/coreutils",
  "core/cacerts",
  "core/git",
  "core/ruby",
  "core/bash"
)
$pkg_build_deps=@(
  "core/gcc",
  "core/make",
  "core/readline",
  "core/sed"
)
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
  mkdir "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  Copy-Item "$PLAN_CONTEXT"/.. "$HAB_CACHE_SRC_PATH/$pkg_dirname/" -Recurse
}

function Invoke-Build {
  Push-Location "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem build inspec.gemspec
  Pop-Location 
  Push-Location "$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec-bin"
    gem build inspec-bin.gemspec
  Pop-Location
}

function Invoke-Install {
  # MUST install inspec first because inspec-bin depends on it via gemspec
  Push-Location "$HAB_CACHE_SRC_PATH/$pkg_dirname/"
    gem install inspec-*.gem --no-document
  Pop-Location

  Push-Location "$HAB_CACHE_SRC_PATH/$pkg_dirname/inspec-bin"
    gem install inspec-bin*.gem --no-document
  Pop-Location
}