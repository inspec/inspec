echo "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
ruby -v
bundle --version

echo "--- download and install vault"
# Define the version of Vault to install
$VaultVersion = "1.13.0"

# Define the installation directory for Vault
$VaultDirectory = "$env:USERPROFILE\Vault"

# Create the installation directory if it doesn't exist
if (!(Test-Path $VaultDirectory))
{
    New-Item -ItemType Directory -Path $VaultDirectory | Out-Null
}

$VaultDownloadUrl = "https://releases.hashicorp.com/vault/$VaultVersion/vault_${VaultVersion}_windows_amd64.zip"
$VaultZipFilePath = Join-Path $VaultDirectory "vault.zip"

Invoke-WebRequest -Uri $VaultDownloadUrl -OutFile $VaultZipFilePath

# Extract the Vault binary from the zip file
$VaultExtractPath = Join-Path $VaultDirectory "vault"
Expand-Archive -Path $VaultZipFilePath -DestinationPath $VaultExtractPath

# Add the Vault binary to the system PATH environment variable
$env:Path += ";$VaultExtractPath"

# Verify the installation
echo "--- vault version installed is:"
vault version

echo "--- fetching Licensing API Keys from vault"
$Env:CHEF_LICENSE_SERVER_API_KEY=vault kv get -field acceptance secret/inspec/licensing/api-key
$Env:CHEF_LICENSE_SERVER=vault kv get -field acceptance secret/inspec/licensing/server
$Env:CHEF_LICENSE_KEY=vault kv get -field acceptance secret/inspec/licensing/license-key

echo "--- verifying if environment variables are set"

function CheckIfEnvVarIsSet {
  param (
    [string]$envVarName
  )
  if (Test-Path "env:\$envVarName") {
    Write-Host "  ++ $envVarName set successfully"
  } else {
    Write-Host "  !! $envVarName is not set."
  }
}

$envVarName = "CHEF_LICENSE_SERVER"
CheckIfEnvVarIsSet -envVarName $envVarName

$envVarName = "CHEF_LICENSE_SERVER_API_KEY"
CheckIfEnvVarIsSet -envVarName $envVarName

$envVarName = "CHEF_LICENSE_KEY"
CheckIfEnvVarIsSet -envVarName $envVarName

if ($Env:CI_ENABLE_COVERAGE)
{
    echo "--- fetching Sonar token from vault"
    $Env:SONAR_TOKEN=vault kv get -field token secret/inspec/sonar
}

echo "--- bundle install"
bundle config set --local without deploy kitchen
bundle install --jobs=7 --retry=3

echo "+++ bundle exec rake test:parallel"
bundle exec rake test:parallel K=4

exit $LASTEXITCODE
