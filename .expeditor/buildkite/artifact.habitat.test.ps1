#!/usr/bin/env powershell

#Requires -Version 5
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

Write-Host "+++ Testing $Plan"

$env:PATH = "C:\hab\bin;$env:PATH"
Push-Location $project_root/test/artifact
hab pkg exec $pkg_ident rake.cmd
$hab_return_value = $?
Pop-Location
exit $hab_return_value
