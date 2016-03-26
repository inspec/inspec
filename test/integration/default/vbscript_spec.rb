# encoding: utf-8

# script that may have multiple lines
vbscript = <<-EOH
  WScript.Echo "hello"
EOH

describe vbscript(vbscript) do
  its('stdout') { should eq "hello\r\n" }
end

# remove whitespace \r\n from stdout
describe vbscript(vbscript) do
  its('strip') { should eq "hello" }
end

# ensure that we do not require a newline
describe vbscript("Wscript.Stdout.Write \"hello\"") do
  its('stdout') { should eq 'hello' }
end
