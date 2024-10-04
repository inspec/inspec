# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# Function to check if OpenSSL is installed
function Test-OpenSSL {
    $openssl = Get-Command "openssl" -ErrorAction SilentlyContinue

    if ($openssl) {
        Write-Host "+++ OpenSSL is installed."
        $openssl_version = openssl version
        Write-Host "+++ OpenSSL Version: $openssl_version"
    } else {
        Write-Host "!!! OpenSSL is not installed or not found in the system PATH."
        Throw "Error: OpenSSL is required but was not found in the system PATH. Please install OpenSSL or add it to the PATH."
    }
}

# Run the OpenSSL check
Test-OpenSSL

$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Throw $lastexitcode }
