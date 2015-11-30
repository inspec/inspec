# encoding: utf-8

require_relative 'gordon_config'

describe port(80) do
    it { should_not be_listening }
end

describe gordon_config do
    its('version') { should eq('1.0') }
end
