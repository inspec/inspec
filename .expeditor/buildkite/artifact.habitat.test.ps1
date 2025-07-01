Write-Host "--- Building $Plan"
$project_root = "$(git rev-parse --show-toplevel)"
Set-Location $project_root

$env:DO_CHECK=$true; hab pkg build .

if (-not (Test-Path "$project_root/results/last_build.ps1")) {
    Write-Host "Build failed: last_build.ps1 not found."
    Exit 1
}
. $project_root/results/last_build.ps1

Write-Host "--- Installing $pkg_ident/$pkg_artifact"
hab pkg install -b $project_root/results/$pkg_artifact

$Env:Path += ";C:\hab\bin"

Write-Host "+++ Testing $Plan"

Push-Location $project_root/test/artifact
hab pkg exec $pkg_ident rake
If ($lastexitcode -ne 0) { Exit $lastexitcode }