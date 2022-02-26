# copyright: 2015, The Authors

title 'sample section'
include_controls 'profile_d'

# you add controls here
control 'profileb-1' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create / directory'             # A human-readable title
  desc 'An optional description...'
  tag "tag-profileb1"
  describe file('/') do                  # The actual test
    it { should be_directory }
  end
end

control 'profileb-2' do
  tag "tag-profileb2"
  describe example_config do
    its('version') { should eq('2.0') }
  end
end