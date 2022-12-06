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
try {
  hab --version
}
catch {
  Set-ExecutionPolicy Bypass -Scope Process -Force
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'))
}
finally {
  Write-Host ":habicat: I think I have the version I need to build."
}

Write-Host "--- :construction: Verifying Git is Installed"
$source = Get-Command -Name Git -Verbose
Write-Host "Which version of Git is installed? - " $source.version
if (-not ($source.name -match "git.exe")) {
    choco install git -y
    # gotta refresh the path so you can actually use Git now
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN

Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

Write-Host "--- :construction: Building $Plan"
$env:DO_CHECK=$true; hab pkg build . -D
if (-not $?) { throw "unable to build"}

. results/last_build.ps1
if (-not $?) { throw "unable to determine details about this build"}

Write-Host "--- Installing $pkg_ident/$pkg_artifact"
hab pkg install -b $project_root/results/$pkg_artifact
if (-not $?) { throw "unable to install this build"}

# Write-Host "--- Downloading Ruby + DevKit"
# aws s3 cp s3://core-buildkite-cache-chef-prod/rubyinstaller-devkit-3.1.2-1-x64.exe c:/rubyinstaller-devkit-3.1.2-1-x64.exe

# Write-Host "--- Installing Ruby + DevKit"
# Start-Process c:\rubyinstaller-devkit-3.1.2-1-x64.exe -ArgumentList '/verysilent /dir=C:\\ruby31' -Wait

# Write-Host "--- Cleaning up installation"
# Remove-Item c:\rubyinstaller-devkit-3.1.2-1-x64.exe -Force

#$Env:Path += ";C:\ruby31\bin;C:\hab\bin"

Write-Host "+++ Testing $Plan"

Push-Location $project_root/test/artifact
rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
