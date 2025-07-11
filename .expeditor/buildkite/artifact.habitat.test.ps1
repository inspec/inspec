#!/usr/bin/env powershell

#Requires -Version 5
# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$env:HAB_BLDR_CHANNEL = 'base-2025'
$env:HAB_REFRESH_CHANNEL = 'base-2025'
$Plan = 'inspec'

Write-Host "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize

Write-Host "--- Installing the version of Habitat required"

# Minimum required Habitat version. Bump this when CI needs a newer hab release.
# Format must match the semver portion of `hab --version` output (e.g. "1.6.652").
$MinHabVersion = "1.6.652"

function Install-Habitat {
  Write-Host "Downloading and installing Habitat..."

  # Suppress errors from the installer script that might try to remove locked files
  $ErrorActionPreference = 'Continue'
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'))
}
finally {
  Write-Host ":habitat: I think I have the version I need to build."
}
# Set HAB_ORIGIN after Habitat installation
Write-Host "HAB_ORIGIN set to 'ci' after installation."
$env:HAB_ORIGIN = 'ci'

Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN

Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

$env:DO_CHECK=$true; hab pkg build .

. $project_root/results/last_build.ps1

Write-Host "--- Installing $pkg_ident/$pkg_artifact"
hab pkg install -b $project_root/results/$pkg_artifact

Write-Host "--- Downloading Ruby + DevKit"
Invoke-WebRequest -Uri "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.1.7-1/rubyinstaller-3.1.7-1-x64.exe" -OutFile "c:/rubyinstaller-devkit-3.1.7-1x64.exe"

Write-Host "--- Installing Ruby + DevKit"
Start-Process c:\rubyinstaller-devkit-3.1.7-1x64.exe -ArgumentList '/verysilent /allusers /dir=C:\\ruby317' -Wait

Write-Host "--- Cleaning up installation"
Remove-Item c:\rubyinstaller-devkit-3.1.7-1x64.exe -Force

$Env:Path += ";C:\ruby317\bin;C:\hab\bin"

Write-Host "+++ Testing $Plan"

Push-Location $project_root/test/artifact
rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
