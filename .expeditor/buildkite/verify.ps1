echo "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
ruby -v
bundle --version

echo "--- configuring git credentials"
if ($env:GITHUB_TOKEN) {
    git config --global url."https://x-access-token:$($env:GITHUB_TOKEN)@github.com/".insteadOf "https://github.com/"
}

echo "--- bundle install"
bundle config set --local without deploy
bundle install --jobs=7 --retry=3

echo "+++ bundle exec rake test:parallel"
bundle exec rake test:parallel K=6

exit $LASTEXITCODE
