# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$env:HAB_BLDR_CHANNEL = "base-2025"
$env:HAB_REFRESH_CHANNEL = "base-2025"
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

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
  "core/ruby3_4-plus-devkit"
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

        # --- Installing custom chef-licensing branch ---
        $customGemsPath = Join-Path $HAB_CACHE_SRC_PATH "custom_gems"
        if (!(Test-Path $customGemsPath)) {
            New-Item -ItemType Directory -Path $customGemsPath | Out-Null
        }

        Write-BuildLine "** Installing custom chef-licensing branch "
        git clone --depth 1 --branch nm/introducing-optional-mode https://github.com/chef/chef-licensing.git "$customGemsPath\chef-licensing"
        Push-Location "$customGemsPath\chef-licensing\components\ruby"
        Write-BuildLine " ** Installing chef-licensing"
        bundle install
        If ($lastexitcode -ne 0) { Exit $lastexitcode }
        Pop-Location

        # internal artificatory is not compatible to resolve gem deps and fails with gem install <URL>
        # so we are using the following workaround
        Write-BuildLine "** Installing chef-official-distribution gem from artifactory"
        $gemFile = Join-Path $customGemsPath "chef-official-distribution-0.1.3.gem"
        if (!(Test-Path $gemFile)) {
            Write-BuildLine " ** Downloading chef-official-distribution"
            Invoke-WebRequest -Uri "https://artifactory-internal.ps.chef.co/artifactory/omnibus-gems-local/gems/chef-official-distribution-0.1.3.gem" -OutFile $gemFile
        }

        Write-BuildLine " ** Installing test-distribution gem"
        gem install $gemFile --no-document --install-dir $env:GEM_HOME
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
        gem install --install-dir $env:GEM_HOME appbundler

        foreach($gem in ("inspec-core", "inspec", "inspec-bin")) {
            Write-BuildLine "** Generating binstubs for $gem with precise version pins"
            Invoke-Expression -Command "$env:GEM_HOME/bin/appbundler.bat $project_root $pkg_prefix/bin $gem"
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
