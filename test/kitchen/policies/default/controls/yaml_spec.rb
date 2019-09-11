if os.unix?
  filename = '/tmp/example.yml'
else
  filename = 'c:/windows/temp/example.yml'
end

describe yaml(filename) do
 its(['driver','name']) { should eq('vagrant') }
end
