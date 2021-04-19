# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "inspec" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

$package_file = "$Env:PACKAGE_FILE"
If ([string]::IsNullOrEmpty($package_file)) { $package_file = "" }

If ($package_file -eq "") {
  Write-Output "--- Installing $channel $product $version"
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Product "$product" -Channel "$channel" -Version "$version" | Select-Object -Last 1)
} 
Else {
  Write-Output "--- Installing $product $version"
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Package "$package_file" -Product "$product" -Version "$version" | Select-Object -Last 1)
}

Write-Output "--- Verifying omnibus package is signed"
C:\opscode\omnibus-toolchain\bin\check-omnibus-package-signed.ps1 "$package_file"

Write-Output "--- Running verification for $channel $product $version"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\$product\bin;C:\opscode\$product\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }
