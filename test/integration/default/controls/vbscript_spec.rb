return unless os.windows?

describe vbscript("WScript.Echo \"hello\"") do
  its('stdout') { should eq "hello\r\n" }
end

# script that may have multiple lines
vbscript = <<-EOH
  WScript.Echo "hello"
  Wscript.Stdout.Write "end"
EOH

describe vbscript(vbscript) do
  its('stdout') { should eq "hello\r\nend" }
end

# remove whitespace from stdout
describe vbscript("WScript.Echo \"hello\"") do
  its('strip') { should eq 'hello' }
end

# ensure that we do not require a newline
describe vbscript("Wscript.Stdout.Write \"hello\"") do
  its('stdout') { should eq 'hello' }
end
