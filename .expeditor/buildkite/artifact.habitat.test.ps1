#!/usr/bin/env pwsh

#Requires -Version 5
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'

$env:HAB_ORIGIN = 'ci'
$env:PLAN = 'inspec'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$env:HAB_BLDR_CHANNEL = 'LTS-2024'
$env:HAB_REFRESH_CHANNEL = 'LTS-2024'

Write-Host "--- Checking if Git is installed"
if (-Not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed. Installing Git..."
    choco install git -y
} else {
    Write-Host "Git is already installed."
    git --version
}

Write-Host "--- Adding an exception for this directory (handling dubious ownership)"
git config --global --add safe.directory /workdir

Write-Host "--- Git status for this workdir"
git status

Write-Host "--- Checking Ruby version"
ruby -v

Write-Host "--- Setting project root"
$env:project_root = $(git rev-parse --show-toplevel)
Write-Host "The value for project_root is: $env:project_root"

Write-Host "--- Setting Habitat environment variables"
$env:HAB_NONINTERACTIVE = 'true'
$env:HAB_NOCOLORING = 'true'
$env:HAB_STUDIO_SECRET_HAB_NONINTERACTIVE = 'true'

Write-Host "--- System details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize

Write-Host "--- Installing Habitat"
try {
    hab --version
} catch {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'))
} finally {
    Write-Host "Habitat installation checked."
}

Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN
$HAB_CI_KEY = Get-ChildItem -Path "C:\hab\cache\keys" -Filter "$env:HAB_ORIGIN*.pub" | Select-Object -ExpandProperty FullName
$env:HAB_CI_KEY = $HAB_CI_KEY

if (Test-Path $HAB_CI_KEY) {
    Get-Content $HAB_CI_KEY | hab origin key import
} else {
    Write-Host "$HAB_CI_KEY not found"
    Get-ChildItem "$env:USERPROFILE\.hab\cache\keys"
    Get-ChildItem "$env:project_root\hab\cache\keys"
    Get-ChildItem "C:\hab"
    Exit 1
}

Write-Host "--- Building $env:PLAN"
Set-Location $env:project_root
$env:DO_CHECK = 'true'
hab pkg build .

Write-Host "--- Sourcing 'results/last_build.ps1'"
if (Test-Path "$env:project_root/results/last_build.ps1") {
    . "$env:project_root/results/last_build.ps1"
} else {
    Write-Host "Error: last_build.ps1 not found."
    Exit 1
}

Write-Host "+++ Installing $pkg_ident/$pkg_artifact"
hab pkg install -b "$env:project_root/results/$pkg_artifact"

Write-Host "--- Removing world readability from /usr/local/bundle (not needed on Windows)"

Write-Host "+++ Testing $env:PLAN"
$Env:Path += ";C:\hab\bin"

Push-Location "$env:project_root/test/artifact"
rake
if ($lastexitcode -ne 0) { Exit $lastexitcode }
