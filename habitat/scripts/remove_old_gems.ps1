# Removes outdated gems bundled with the Ruby Habitat package and installs updated versions.
# Called from Invoke-After in plan.ps1.

$rubyGemsPath = "$(hab pkg path chef/ruby31-plus-devkit)\lib\ruby\gems"

# Gems whose Gemfile.lock should be removed (not used at runtime)
$gemfileLockGems = @("lint_roller", "rbs")

# Gems to replace with updated versions: name = version
$gemsToUpdate = @{
    "rexml" = "3.4.2"
}

$searchPaths = @($rubyGemsPath, "$pkg_prefix\vendor\gems")

foreach ($gem in $gemfileLockGems) {
    $searchPaths | ForEach-Object {
        Get-ChildItem $_ -Filter "Gemfile.lock" -Recurse -ErrorAction SilentlyContinue |
            Where-Object { $_.FullName -like "*\gems\$gem-*\Gemfile.lock" } |
            Remove-Item -Force
    }
}

foreach ($entry in $gemsToUpdate.GetEnumerator()) {
    $gemName    = $entry.Key
    $gemVersion = $entry.Value

    Get-ChildItem "$rubyGemsPath" -Filter "$gemName-*.gemspec" -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "$gemName-$gemVersion.gemspec" } |
        Remove-Item -Force

    Get-ChildItem "$rubyGemsPath" -Filter "$gemName-*" -Directory -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "$gemName-$gemVersion" } |
        Remove-Item -Recurse -Force

    gem install $gemName -v $gemVersion --no-document
}
