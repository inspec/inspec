
unless os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
  return
end

script = <<-EOH
  Write-Output 'hello'
EOH

# Write-Output comes with a newline
describe powershell(script) do
  its('stdout') { should eq "hello\r\n" }
  its('stderr') { should eq '' }
end

# remove whitespace \r\n from stdout
describe powershell(script) do
  its('strip') { should eq "hello" }
end

# legacy test with `script` resource
describe script(script) do
  its('stdout') { should eq "hello\r\n" }
  its('stderr') { should eq '' }
end

# -NoNewLine only works in powershell 5
# @see https://blogs.technet.microsoft.com/heyscriptingguy/2015/08/07/the-powershell-5-nonewline-parameter/
describe powershell("'hello' | Write-Host -NoNewLine") do
  its('stdout') { should eq 'hello' }
  its('stderr') { should eq '' }
end

# test stderr
describe powershell("Write-Error \"error\"") do
  its('stdout') { should eq '' }
  # this is an xml error for now, if the script is run via WinRM
  # @see https://github.com/WinRb/WinRM/issues/106
  # its('stderr') { should eq 'error' }
end
