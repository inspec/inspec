# encoding: utf-8
script = <<-EOH
  Write-Output 'hello'
EOH

describe powershell(script) do
  its('stdout') { should eq 'hello' }
end

# legacy test
describe script(script) do
  its('stdout') { should eq 'hello' }
end
