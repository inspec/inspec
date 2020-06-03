echo "--- system details"
$Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
Get-CimInstance Win32_OperatingSystem | Select-Object $Properties | Format-Table -AutoSize
ruby -v
bundle --version

echo "--- bundle install"
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

#echo "+++ bundle exec rake test:parallel"
#bundle exec rake test:parallel K=4

# Only run unit tests for now
echo "+++ bundle exec rake test:unit"
bundle exec rake test:unit

exit $LASTEXITCODE
