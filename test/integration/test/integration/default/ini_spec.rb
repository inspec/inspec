# encoding: utf-8

describe ini('/tmp/example.ini') do
  its(['client','port']) { should eq('3306') }
end
