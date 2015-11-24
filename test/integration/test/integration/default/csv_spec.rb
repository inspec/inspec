# encoding: utf-8

describe csv('/tmp/example.csv') do
  its('name') { should eq(['addressable', 'ast', 'astrolabe', 'berkshelf']) }
end
