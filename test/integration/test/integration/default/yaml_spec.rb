# encoding: utf-8

describe yaml('/tmp/example.yml') do
 its(['driver','name']) { should eq('vagrant') }
end
