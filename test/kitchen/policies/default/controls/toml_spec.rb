if os.unix?
  filename = '/tmp/example.toml'
else
  filename = 'c:/windows/temp/example.toml'
end

describe toml(filename) do
  its ('key') { should eq('value') }
  its (['arr', 1]) { should eq 2 }
  its (['mytable', 'key1']) { should eq 'value1' }
end
