# copyright: 2015, The Authors

title 'sample section'
include_controls 'profile_c'
#
# The following should fail even in the case where profile_d or
# profile_b is pulled in somewhere else in the dependency tree.
#
# include_controls 'profile_d'
# include_controls 'profile_b'

# you add controls here
control 'profilea-1' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

control 'profilea-2' do
  describe example_config do
    its('version') { should eq('1.0') }
  end
end
