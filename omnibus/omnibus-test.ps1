# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

# *********Debugging ***************
Write-Host ":ruby: Validating Ruby can run"
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Throw $lastexit

Write-Host ":bundler: Validating Bundler can run"
& $embedded_bin_dir\bundle.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL can run"
$version=(&"$embedded_bin_dir\openssl.exe" version)
If ($lastexitcode -ne 0) { Throw $lastexitcode }


Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Throw $lastexitcode }
