# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

# reload Env:PATH to ensure it gets any changes that the install made (e.g. C:\opscode\inspec\bin\ )
$Env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Set GEM_HOME and GEM_PATH to verify our appbundle inspec shim is correctly
# removing them from the environment while launching from our embedded ruby.
$Env:GEM_HOME = "C:\SHOULD_NOT_EXIST"
$Env:GEM_PATH = "C:\SHOULD_NOT_EXIST"

inspec version
If ($lastexitcode -ne 0) { Exit $lastexitcode }
