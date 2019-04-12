# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "inspec" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

Write-Output "--- Downloading $channel $product $version"
$download_url = C:\opscode\omnibus-toolchain\embedded\bin\mixlib-install.bat download --url --channel "$channel" "$product" --version "$version"
$package_file = "$Env:Temp\$(Split-Path -Path $download_url -Leaf)"
Invoke-WebRequest -OutFile "$package_file" -Uri "$download_url"

Write-Output "--- Checking that $package_file has been signed."
If ((Get-AuthenticodeSignature "$package_file").Status -eq 'Valid') {
  Write-Output "Verified $package_file has been signed."
}
Else {
  Write-Output "Exiting with an error because $package_file has not been signed. Check your omnibus project config."
  exit 1
}

Write-Output "--- Installing $channel $product $version"
Start-Process "$package_file" /quiet -Wait

Write-Output "--- Testing $channel $product $version"

Write-Output "Running verification for $product"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Set GEM_HOME and GEM_PATH to verify our appbundle inspec shim is correctly
# removing them from the environment while launching from our embedded ruby.
$Env:GEM_HOME = "C:\SHOULD_NOT_EXIST"
$Env:GEM_PATH = "C:\SHOULD_NOT_EXIST"

inspec version
If ($lastexitcode -ne 0) { Exit $lastexitcode }
