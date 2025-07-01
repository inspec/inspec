#!/usr/bin/env powershell

#Requires -Version 5
# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'
$env:HAB_ORIGIN = 'ci'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$env:HAB_BLDR_CHANNEL = 'base-2025'
$env:HAB_REFRESH_CHANNEL = 'base-2025'
$Plan = 'inspec'

Write-Host "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize

Write-Host "--- Installing the version of Habitat required"
try {
  hab --version
}
catch {
  Set-ExecutionPolicy Bypass -Scope Process -Force
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'))
}
finally {
  Write-Host ":habitat: I think I have the version I need to build."
}


Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN

Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

$env:DO_CHECK=$true; hab pkg build .

. $project_root/results/last_build.ps1

$Env:Path += ";C:\hab\bin"

Write-Host "+++ Testing $Plan"

Push-Location $project_root/test/artifact
hab pkg exec chef/inspec rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
