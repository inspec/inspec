# encoding: utf-8

describe json('/tmp/example.json') do
  its(['cookbook_locks','omnibus','version']) { should eq('2.2.0') }
end
