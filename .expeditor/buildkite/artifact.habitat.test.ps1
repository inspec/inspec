#!/usr/bin/env powershell

#Requires -Version 5
# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'
$env:HAB_ORIGIN = 'ci'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$Plan = 'inspec'

Write-Host "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize

Write-Host "--- Installing the version of Habitat required"
$hab_version = (hab --version)
$hab_minor_version = $hab_version.split('.')[1]
if ( -not $? -Or $hab_minor_version -lt 85 ) {
    Install-Habitat --version 0.85.0.20190916
} else {
    Write-Host ":habicat: I think I have the version I need to build."
}


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
aws s3 cp s3://core-buildkite-cache-chef-prod/rubyinstaller-devkit-2.6.6-1-x64.exe c:/rubyinstaller-devkit-2.6.6-1-x64.exe

Write-Host "--- Installing Ruby + DevKit"
Start-Process c:\rubyinstaller-devkit-2.6.6-1-x64.exe -ArgumentList '/verysilent /dir=C:\\ruby26' -Wait

Write-Host "--- Cleaning up installation"
Remove-Item c:\rubyinstaller-devkit-2.6.6-1-x64.exe -Force

$Env:Path += ";C:\ruby26\bin;C:\hab\bin"

Write-Host "+++ Testing $Plan"

Push-Location $project_root/test/artifact
rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
