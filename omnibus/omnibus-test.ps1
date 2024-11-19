# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# Reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

# *********Debugging ***************
Write-Host ":ruby: Validating Ruby can run"
& $embedded_bin_dir\ruby.exe --version
if ($LASTEXITCODE -ne 0) { Throw "Ruby validation failed with exit code $LASTEXITCODE" }

Write-Host ":bundler: Validating Bundler can run"
& $embedded_bin_dir\bundle.bat --version
if ($LASTEXITCODE -ne 0) { Throw "Bundler validation failed with exit code $LASTEXITCODE" }

Write-Host ":lock: Validating OpenSSL can run"
$version = (&"$embedded_bin_dir\openssl.exe" version)
if ($LASTEXITCODE -ne 0) { Throw "OpenSSL validation failed with exit code $LASTEXITCODE" }

# Check if directory exists before changing location
if (Test-Path test/artifact) {
    Set-Location test/artifact
    rake
    if ($LASTEXITCODE -ne 0) { Throw "Rake command failed with exit code $LASTEXITCODE" }
} else {
    Write-Host "Directory test/artifact does not exist."
}
