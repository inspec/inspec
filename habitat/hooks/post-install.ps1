# Runs after package installation to clean up outdated bundled gem files
# from the Ruby dependency package.

$gemHome    = "{{pkg.path}}\vendor\gems"
$rubyPkgNames = @("core/ruby31", "core/ruby3_1", "chef/ruby31-plus-devkit")

# Gems whose Gemfile.lock should be removed (not used at runtime)
foreach ($gem in @("lint_roller", "rbs")) {
    Get-ChildItem "$gemHome" -Filter "Gemfile.lock" -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -like "*\gems\$gem-*\Gemfile.lock" } |
        Remove-Item -Force
}

# Clean up old bundled gem versions from the Ruby dependency package
foreach ($rubyPkg in $rubyPkgNames) {
    $rubyGemsPath = "$(hab pkg path $rubyPkg 2>$null)\lib\ruby\gems"
    if (-not (Test-Path "$rubyGemsPath")) { continue }

    Get-ChildItem "$rubyGemsPath" -Filter "Gemfile.lock" -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -like "*\gems\rbs-*\Gemfile.lock" } |
        Remove-Item -Force

    Get-ChildItem "$rubyGemsPath" -Filter "rexml-*.gemspec" -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "rexml-3.4.2.gemspec" } |
        Remove-Item -Force

    Get-ChildItem "$rubyGemsPath" -Filter "rexml-*" -Directory -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "rexml-3.4.2" } |
        Remove-Item -Recurse -Force
}
