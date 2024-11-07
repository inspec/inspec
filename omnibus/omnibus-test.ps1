# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$Env:Path = "C:\opscode\inspec\bin;C:\opscode\inspec\embedded\bin;$Env:PATH"
Write-Host "+++ Testing $Plan"

# We don't want to add the embedded bin dir to the main PATH as this
# could mask issues in our binstub shebangs.
$embedded_bin_dir = "C:\opscode\inspec\embedded\bin"
$embedded_dir = "C:\opscode\inspec\embedded"

# FIXME: we should really use Bundler.with_unbundled_env in the caller instead of re-inventing it here
Remove-Item Env:_ORIGINAL_GEM_PATH -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLE_BIN_PATH -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLE_GEMFILE -ErrorAction SilentlyContinue
Remove-Item Env:GEM_HOME -ErrorAction SilentlyContinue
Remove-Item Env:GEM_PATH -ErrorAction SilentlyContinue
Remove-Item Env:GEM_ROOT -ErrorAction SilentlyContinue
Remove-Item Env:RUBYLIB -ErrorAction SilentlyContinue
Remove-Item Env:RUBYOPT -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_ENGINE -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_ROOT -ErrorAction SilentlyContinue
Remove-Item Env:RUBY_VERSION -ErrorAction SilentlyContinue
Remove-Item Env:BUNDLER_VERSION -ErrorAction SilentlyContinue

# Exercise various packaged tools to validate binstub shebangs
Write-Host ":ruby: Validating Ruby can run"
& $embedded_bin_dir\ruby --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":gem: Validating RubyGems can run"
& $embedded_bin_dir\gem.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":bundler: Validating Bundler can run"
& $embedded_bin_dir\bundle.bat --version
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL can run"
$version=(&"$embedded_bin_dir\openssl.exe" version)
If ($lastexitcode -ne 0) { Throw $lastexitcode }

Write-Host ":lock: Validating OpenSSL executable"
Start-Process -NoNewWindow -Wait "$embedded_bin_dir\openssl.exe" -ArgumentList "sha3-512" -RedirectStandardInput ".\LICENSE"  -PassThru
If ($lastexitcode -ne 0) {
    Write-Host "sha3 failed"
    Throw $lastexitcode
}
If ($env:OMNIBUS_FIPS_MODE -eq $true) {
    $env:OPENSSL_FIPS = "1"
}

& $embedded_bin_dir\bundle install --jobs=2 --retry=3

Write-Host "MSYS_OVERRIDE $env:MSYS_OVERRIDE"

If ((Get-Command "openssl.exe").Source -ne "$embedded_bin_dir\openssl.exe") {
    Write-Host "The default openssl.exe is at: $((Get-Command "openssl.exe").Source),"
    Write-Host "which has version $((Get-Command "openssl.exe").FileVersionInfo.FileVersion)"
}

Set-Location test/artifact
rake
If ($lastexitcode -ne 0) { Throw $lastexitcode }
