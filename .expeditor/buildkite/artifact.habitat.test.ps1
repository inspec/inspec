#!/usr/bin/env powershell

#Requires -Version 5
# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$env:HAB_BLDR_CHANNEL = 'LTS-2024'
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
  $ErrorActionPreference = 'Stop'

  # Add Habitat to PATH for current session
  $habExeDir = "C:\ProgramData\Habitat"
  if (Test-Path $habExeDir) {
    $env:Path = "$habExeDir;$env:Path"
    Write-Host "Added $habExeDir to PATH"
  }

  # Wait for installation to complete and avoid racing conditions
  Start-Sleep -Seconds 2

  # Verify installation
  $habVersion = hab --version 2>&1
  if ($LASTEXITCODE -eq 0) {
    Write-Host ":habitat: Installed Habitat version: $habVersion"
  } else {
    Write-Host "Warning: Could not verify Habitat installation"
  }
}

function Get-HabVersion {
  # Returns the installed hab semver string (e.g. "1.6.652"), or $null if not found.
  try {
    $output = hab --version 2>&1
    if ($LASTEXITCODE -ne 0) { return $null }
    # Output format: "hab 1.6.652/20230206161841"
    $versionPart = ($output -split " ")[1] -split "/" | Select-Object -First 1
    return $versionPart
  } catch {
    return $null
  }
}

# Ensure Habitat is in PATH before checking
$habExeDir = "C:\ProgramData\Habitat"
if (Test-Path $habExeDir) {
  $env:Path = "$habExeDir;$env:Path"
}

$installedVersion = Get-HabVersion

if ($null -eq $installedVersion) {
  Write-Host "Habitat not found. Installing..."
  Set-ExecutionPolicy Bypass -Scope Process -Force
  Install-Habitat
} elseif ([version]$installedVersion -ge [version]$MinHabVersion) {
  Write-Host "Habitat $installedVersion satisfies minimum required version $MinHabVersion. Skipping install."
} else {
  Write-Host "Habitat $installedVersion is below required $MinHabVersion. Upgrading..."
  # Only delete the binary when an upgrade is intentionally needed,
  # reducing risk of disrupting other parallel CI jobs in the common case.
  $habExe = "$habExeDir\hab.exe"
  if (Test-Path $habExe) {
    Remove-Item $habExe -Force -ErrorAction SilentlyContinue
    Write-Host "Removed old hab.exe to allow clean upgrade."
  }
  Set-ExecutionPolicy Bypass -Scope Process -Force
  Install-Habitat
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
