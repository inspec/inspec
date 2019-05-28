if os.unix?
  filename = '/tmp/example.ini'
else
  filename = 'c:/windows/temp/example.ini'
end

describe ini(filename) do
  its(['client','port']) { should eq('3306') }
end
