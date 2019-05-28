if os.unix?
  filename = '/tmp/example.json'
else
  filename = 'c:/windows/temp/example.json'
end

describe json(filename) do
  its(['cookbook_locks','omnibus','version']) { should eq('2.2.0') }
end
