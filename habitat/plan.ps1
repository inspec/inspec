$pkg_name="inspec"
$pkg_origin="miah"
$pkg_version=$(cat "$PLAN_CONTEXT/../VERSION")
$pkg_revision="1"
$pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
$pkg_upstream_url="https://www.inspec.io/"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=('Apache-2.0')

$pkg_deps=@(
  "core/cacerts"
  "robbkidd/ruby-plus-devkit/2.6.3"
)
$pkg_bin_dirs=@("bin"
                "vendor/bin")
$project_root= (Resolve-Path "$PLAN_CONTEXT/../").Path

function Invoke-SetupEnvironment {
    Push-RuntimeEnv -IsPath GEM_PATH "$pkg_prefix/vendor"

    Set-RuntimeEnv APPBUNDLER_ALLOW_RVM "true" # prevent appbundler from clearing out the carefully constructed runtime GEM_PATH
    Set-RuntimeEnv -IsPath SSL_CERT_FILE "$(Get-HabPackagePath cacerts)/ssl/cert.pem"
    Set-RuntimeEnv LANG "en_US.UTF-8"
    Set-RuntimeEnv LC_CTYPE "en_US.UTF-8"
}

function Invoke-Build {
    try {
        Push-Location $project_root
        $env:GEM_HOME = "$HAB_CACHE_SRC_PATH/$pkg_dirname/vendor"

        Write-BuildLine " ** Configuring bundler for this build environment"
        bundle config --local without integration deploy maintenance
        bundle config --local jobs 4

        Write-BuildLine " ** Using bundler to retrieve the Ruby dependencies"
        bundle install
        Write-BuildLine " ** Running the inspec project's 'rake install' to install the path-based gems so they look like any other installed gem."
        bundle exec rake install # this needs to be 'bundle exec'd because a Rakefile makes reference to Bundler
    } finally {
        Pop-Location
    }
}

function Invoke-Install {
    Write-BuildLine "** Copy built & cached gems to install directory"
    Copy-Item -Path "$HAB_CACHE_SRC_PATH/$pkg_dirname/*" -Destination $pkg_prefix -Recurse -Force -Exclude @("gem_make.out", "mkmf.log", "Makefile")

    try {
        Push-Location $pkg_prefix
        bundle config --local gemfile $project_root/Gemfile
        foreach($gem in ("inspec-bin", "inspec")) {
            Write-BuildLine "** generating binstubs for $gem with precise version pins"
            Invoke-Expression -Command "appbundler.bat $project_root $pkg_prefix/bin $gem"
        }
        Remove-StudioPathFrom -File $pkg_prefix/vendor/gems/inspec-$pkg_version*/Gemfile
    } finally {
        Pop-Location
        # forget about the build bundle config
        Remove-Item $pkg_prefix/.bundle -Recurse -Force
    }
}

function Invoke-Check {
    Push-Location $project_root/test/artifact
    rake
    Pop-Location
}

function Invoke-After {
    # Trim the fat before packaging

    # We don't need the cache of downloaded .gem files ...
    Remove-Item $pkg_prefix/vendor/cache -Recurse -Force

    # We don't need the gem docs.
    Remove-Item $pkg_prefix/vendor/doc -Recurse -Force
    # We don't need to ship the test suites for every gem dependency,
    # only inspec's for package verification.
    Get-ChildItem $pkg_prefix/vendor/gems -Filter "spec" -Directory -Recurse -Depth 1 `
        | Where-Object -FilterScript { $_.FullName -notlike "*inspec*" }             `
        | Remove-Item -Recurse -Force
}
function Remove-StudioPathFrom {
    Param(
        [Parameter(Mandatory=$true)]
        [String]
        $File
    )
    (Get-Content $File) -replace ($env:FS_ROOT -replace "\\","/"),"" | Set-Content $File
}
