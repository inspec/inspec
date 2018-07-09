$pkg_name="inspec"
$pkg_origin="chef"
$pkg_version=$(Get-Content "$PLAN_CONTEXT/../VERSION")
$pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
$pkg_upstream_url="https://www.inspec.io/"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=('Apache-2.0')
$pkg_source="https://packages.chef.io/files/stable/inspec/${pkg_version}/windows/2016/inspec-${pkg_version}-1-x64.msi"
$pkg_shasum="fcdf17b29bc94f2eff1ed59fbb8d224f05df6552e0ff85e1eb71fb4e3b7db24d"
$pkg_build_deps=@("core/lessmsi")
$pkg_bin_dirs=@(
    "inspec/bin",
    "inspec/embedded/bin"
)

function Invoke-Unpack {
  lessmsi x (Resolve-Path "$HAB_CACHE_SRC_PATH/$pkg_filename").Path
  Expand-Archive -Path "inspec-${pkg_version}-1-x64/SourceDir/opscode/inspec.zip" -DestinationPath "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  Remove-Item inspec-${pkg_version}-1-x64 -Recurse -Force
  Get-ChildItem "$HAB_CACHE_SRC_PATH/$pkg_dirname/embedded/bin/*.bat" | % {
    (Get-Content $_).Replace("C:\opscode\inspec\embedded\bin", "%~dp0") | Set-Content $_
    (Get-Content $_).Replace("C:/opscode/inspec/embedded/bin", "%~dp0") | Set-Content $_
  }
}

function Invoke-Install {
  Remove-Item "$pkg_prefix/inspec/*" -Recurse
  Copy-Item "$HAB_CACHE_SRC_PATH/$pkg_dirname/*" "$pkg_prefix/inspec" -Recurse
}
