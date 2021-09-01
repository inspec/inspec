# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
