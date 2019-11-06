#!/usr/bin/env powershell

#Requires -Version 5

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
    Write-Host "I'm being built with $hab_version. I need at least Hab 0.85.0, because I use the -IsPath option for setting/pushing paths in SetupEnvironment."
throw "unable to build: required minimum version of Habitat not installed"
} else {
    Write-Host ":habicat: I think I have the version I need to build."
}

Install-Habitat --version 0.85.0.20190916

Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN

Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

$env:DO_CHECK=$true; hab pkg build .
if (-not $?) { throw "unable to build" }

. $project_root/results/last_build.ps1
if (-not $?) { throw "unable to determine details about this build" }

Write-Host "--- Installing $pkg_ident/$pkg_artifact"
hab pkg install -b $project_root/results/$pkg_artifact
if (-not $?) { throw "unable to install this build" }

Write-Host "+++ Testing $Plan"
Push-Location $project_root/test/artifact
rake
if (-not $?) { throw "rake failed" }
Pop-Location
