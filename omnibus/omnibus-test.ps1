# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# Function to check if OpenSSL is installed
function Test-OpenSSL {
    $openssl = Get-Command "openssl" -ErrorAction SilentlyContinue

    if ($openssl) {
        Write-Host "+++ OpenSSL is installed."
        $openssl_version = openssl version
        Write-Host "+++ OpenSSL Version: $openssl_version"

        # Check if the installed version is OpenSSL 3.x
        if ($openssl_version -like "OpenSSL 3*") {
            Write-Host "+++ OpenSSL version 3.x is already installed."
        } else {
            Write-Host "+++ OpenSSL is installed, but it's not version 3.x. Proceeding to update."
            Install-OpenSSL
        }
    } else {
        Write-Host "!!! OpenSSL is not installed or not found in the system PATH."
        Write-Host "+++ Installing OpenSSL version 3..."
        Install-OpenSSL
    }
}

# Function to install OpenSSL version 3
function Install-OpenSSL {
    # Define OpenSSL download URL for Windows (64-bit in this case)
    $openssl_url = "https://slproweb.com/products/Win32OpenSSL.html"

    Write-Host "+++ Downloading OpenSSL version 3..."

    # Download OpenSSL installer from the official source
    $installer_path = "$env:TEMP\Win64OpenSSL-3.0.0.exe"
    Invoke-WebRequest -Uri $openssl_url -OutFile $installer_path

    # Run the installer (silent install)
    Write-Host "+++ Installing OpenSSL..."
    Start-Process -FilePath $installer_path -ArgumentList "/silent" -Wait

    # Clean up installer
    Remove-Item -Path $installer_path -Force

    Write-Host "+++ OpenSSL version 3 has been installed successfully."
}

# Run the OpenSSL check and installation process
Test-OpenSSL


# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Throw $lastexitcode }
