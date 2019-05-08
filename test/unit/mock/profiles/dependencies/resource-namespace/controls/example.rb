# copyright: 2015, The Authors

require_resource(profile: 'profile_c', resource: 'gordon_config', as: 'gordy_config')

describe gordy_config do
  its('version') { should eq('1.0') }
end

control 'whichgordon' do
  describe gordy_config do
    its('version') { should eq('1.0') }
  end

  describe gordon_config do
    its('version') { should eq('2.0') }
  end

  describe gordy_config do
    its('version') { should eq(gordy_config.version) }
  end

  describe gordon_config do
    its('version') { should eq(gordon_config.version) }
  end

end
