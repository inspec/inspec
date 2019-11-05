$pkg_name="inspec"
$pkg_origin="chef"
$pkg_version=$(Get-Content "$PLAN_CONTEXT/../VERSION")
$pkg_revision="1"
$pkg_description="InSpec is an open-source testing framework for infrastructure
  with a human- and machine-readable language for specifying compliance,
  security and policy requirements."
$pkg_upstream_url="https://www.inspec.io/"
$pkg_maintainer="The Chef Maintainers <humans@chef.io>"
$pkg_license=('Apache-2.0')

$pkg_deps=@(
  "core/cacerts"
  "chef/ruby-plus-devkit"
)
$pkg_bin_dirs=@("bin"
                "vendor/bin")
$project_root= (Resolve-Path "$PLAN_CONTEXT/../").Path

function Invoke-Begin {
    $hab_version = (hab --version)
    $hab_minor_version = $hab_version.split('.')[1]
    if ( -not $? -Or $hab_minor_version -lt 85 ) {
        Write-Warning "I'm being built with $hab_version. I need at least Hab 0.85.0, because I use the -IsPath option for setting/pushing paths in SetupEnvironment."
        throw "unable to build: required minimum version of Habitat not installed"
    } else {
        Write-BuildLine ":habicat: I think I have the version I need to build."
    }
}

function Invoke-SetupEnvironment {
    Push-RuntimeEnv -IsPath GEM_PATH "$pkg_prefix/vendor"

    Set-RuntimeEnv APPBUNDLER_ALLOW_RVM "true" # prevent appbundler from clearing out the carefully constructed runtime GEM_PATH
    Set-RuntimeEnv FORCE_FFI_YAJL "ext"
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
        bundle config --local retry 5
        bundle config --local silence_root_warning 1

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

function Invoke-After {
    # We don't need the cache of downloaded .gem files ...
    Remove-Item $pkg_prefix/vendor/cache -Recurse -Force
    # We don't need the gem docs.
    Remove-Item $pkg_prefix/vendor/doc -Recurse -Force
    # We don't need to ship the test suites for every gem dependency,
    # only inspec's for package verification.
    Get-ChildItem $pkg_prefix/vendor/gems -Filter "spec" -Directory -Recurse -Depth 1 `
        | Where-Object -FilterScript { $_.FullName -notlike "*inspec*" }             `
        | Remove-Item -Recurse -Force
    # Remove the byproducts of compiling gems with extensions
    Get-ChildItem $pkg_prefix/vendor/gems -Include @("gem_make.out", "mkmf.log", "Makefile") -File -Recurse `
        | Remove-Item -Force
}

function Remove-StudioPathFrom {
    Param(
        [Parameter(Mandatory=$true)]
        [String]
        $File
    )
    (Get-Content $File) -replace ($env:FS_ROOT -replace "\\","/"),"" | Set-Content $File
}
