echo "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
ruby -v
bundle --version

echo "--- bundle install"
bundle config set --local without tools maintenance deploy
bundle install --jobs=7 --retry=3

echo "+++ bundle exec rake test:parallel"
bundle exec rake test:parallel K=4

exit $LASTEXITCODE
