# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# use basic tests
describe package('nginx') do
  it { should be_installed }
end

# extend tests with metadata
control '01' do
  impact 0.7
  title 'Verify nginx service'
  desc 'Ensures nginx service is up and running'
  describe service('nginx') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

# implement os dependent tests
web_user = 'www-data'
web_user = 'nginx' if os[:family] == 'centos'

describe user(web_user) do
  it { should exist }
end
