# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

# Pin hab to 1.6.x to ensure consistent dependency resolution.
# Build queues run hab 2.0 which resolves from 'base' channel (glibc/2.41),
# conflicting with ruby31-plus-devkit. Installing 1.6 here overrides the queue default.
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$HabVersion = "1.6.1245"
Write-Host "--- Installing hab $HabVersion to override queue default"
$installScriptUrl = 'https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'
$installScriptPath = Join-Path $env:TEMP "hab-install-$HabVersion.ps1"
Invoke-WebRequest -Uri $installScriptUrl -OutFile $installScriptPath
try {
    & $installScriptPath -Version $HabVersion
}
finally {
    Remove-Item $installScriptPath -Force -ErrorAction SilentlyContinue
}

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
  "chef/ruby31-plus-devkit"
  "core/git"
)
$pkg_bin_dirs=@("bin"
                "vendor/bin")
$project_root= (Resolve-Path "$PLAN_CONTEXT/../").Path

function Invoke-SetupEnvironment {
    Push-RuntimeEnv -IsPath GEM_PATH "$pkg_prefix/vendor"

    Set-RuntimeEnv APPBUNDLER_ALLOW_RVM "true" # prevent appbundler from clearing out the carefully constructed runtime GEM_PATH
    Set-RuntimeEnv FORCE_FFI_YAJL "ext"
    Set-RuntimeEnv LANG "en_US.UTF-8"
    Set-RuntimeEnv LC_CTYPE "en_US.UTF-8"
}

function Invoke-Build {
    try {
        $env:Path += ";c:\\Program Files\\Git\\bin"
        Push-Location $project_root
        $env:GEM_HOME = "$HAB_CACHE_SRC_PATH/$pkg_dirname/vendor"

        Write-BuildLine " ** Configuring bundler for this build environment"
        bundle config --local without integration deploy maintenance
        bundle config --local jobs 4
        bundle config --local retry 5
        bundle config --local silence_root_warning 1

        Write-BuildLine " ** Using bundler to retrieve the Ruby dependencies"
        bundle install
        If ($lastexitcode -ne 0) { Exit $lastexitcode }
        Write-BuildLine " ** Running the inspec project's 'rake install' to install the path-based gems so they look like any other installed gem."
        bundle exec rake install # this needs to be 'bundle exec'd because a Rakefile makes reference to Bundler
        If ($lastexitcode -ne 0) { Exit $lastexitcode }
    } finally {
        Pop-Location
    }
}

function Invoke-Install {
    Write-BuildLine "** Copy built & cached gems to install directory"
    Copy-Item -Path "$HAB_CACHE_SRC_PATH/$pkg_dirname/*" -Destination $pkg_prefix -Recurse -Force -Exclude @("gem_make.out", "mkmf.log", "Makefile",
                     "*/latest", "latest",
                     "*/JSON-Schema-Test-Suite", "JSON-Schema-Test-Suite")

    try {
        Push-Location $pkg_prefix
        bundle config --local gemfile $project_root/Gemfile
        foreach($gem in ("inspec-core", "inspec", "inspec-bin")) {
            Write-BuildLine "** generating binstubs for $gem with precise version pins"
            Invoke-Expression -Command "appbundler.bat $project_root $pkg_prefix/bin $gem"
            If ($lastexitcode -ne 0) { Exit $lastexitcode }
        }
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