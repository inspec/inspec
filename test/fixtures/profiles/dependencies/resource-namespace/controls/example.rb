# copyright: 2015, The Authors

require_resource(profile: 'profile_c', resource: 'example_config', as: 'placeholder_config')

describe placeholder_config do
  its('version') { should eq('1.0') }
end

control 'whichexample' do
  describe placeholder_config do
    its('version') { should eq('1.0') }
  end

  describe example_config do
    its('version') { should eq('2.0') }
  end

  describe placeholder_config do
    its('version') { should eq(placeholder_config.version) }
  end

  describe example_config do
    its('version') { should eq(example_config.version) }
  end

end
