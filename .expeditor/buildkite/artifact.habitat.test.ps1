#!/usr/bin/env powershell

#Requires -Version 5
# https://stackoverflow.com/questions/9948517
# TODO: Set-StrictMode -Version Latest
$PSDefaultParameterValues['*:ErrorAction']='Stop'
$ErrorActionPreference = 'Stop'
$env:CHEF_LICENSE = 'accept-no-persist'
$env:HAB_LICENSE = 'accept-no-persist'
$Plan = 'inspec'

Write-Host "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize

Write-Host "--- Installing the version of Habitat required"

function Install-Habitat {
  Write-Host "Downloading and installing Habitat..."

  # Suppress errors from the installer script that might try to remove locked files
  $ErrorActionPreference = 'Continue'
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/habitat-sh/habitat/main/components/hab/install.ps1'))
  $ErrorActionPreference = 'Stop'

  # Add Habitat to PATH for current session
  $habPath = "C:\ProgramData\Habitat"
  if (Test-Path $habPath) {
    $env:Path = "$habPath;$env:Path"
    Write-Host "Added $habPath to PATH"
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

# Ensure Habitat is in PATH before checking
$habPath = "C:\ProgramData\Habitat"
if (Test-Path $habPath) {
  $env:Path = "$habPath;$env:Path"
}

try {
  $habVersion = hab --version 2>&1
  if ($LASTEXITCODE -eq 0) {
    Write-Host "Habitat is already installed: $habVersion"
  } else {
    throw "hab command failed"
  }
}
catch {
  Write-Host "Installing Habitat ...."
  Set-ExecutionPolicy Bypass -Scope Process -Force
  Install-Habitat
}

# Set HAB_ORIGIN after Habitat installation
Write-Host "HAB_ORIGIN set to 'ci' after installation."
$env:HAB_ORIGIN = 'ci'


Write-Host "--- Generating fake origin key"
hab origin key generate $env:HAB_ORIGIN

# Find the key file
$HAB_CI_KEY = Get-ChildItem -Path C:\hab\cache\keys\$env:HAB_ORIGIN*.pub | Select-Object -ExpandProperty FullName

# Export the HAB_CI_KEY environment variable
$Env:HAB_CI_KEY = $HAB_CI_KEY

if (Test-Path -Path $HAB_CI_KEY) {
    # Import the key if it exists
    $keyContents = Get-Content -Path $HAB_CI_KEY
    $keyContents | ForEach-Object { hab origin key import - }  # Use '-' to accept input from the pipeline
}
else {
    Write-Host "$HAB_CI_KEY not found"
    Get-ChildItem -Path $env:USERPROFILE\.hab\cache\keys
    Get-ChildItem -Path $project_root\hab\cache\keys
    Get-ChildItem -Path C:\hab
    Exit 1
}

Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

$env:DO_CHECK = $true
hab pkg build .

if ($LASTEXITCODE -ne 0) {
  Write-Host "Package build failed."
}

try {
  . $project_root/results/last_build.ps1
} catch {
  Write-Host "Error running last_build.ps1: $_"
}

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

# Check the test result and handle any errors
if ($LASTEXITCODE -ne 0) {
  Write-Host "Tests failed. Exit code: $LASTEXITCODE"
}

Write-Host "--- Script completed successfully."
