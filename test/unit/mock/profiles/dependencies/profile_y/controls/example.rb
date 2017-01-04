# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'sample section'
include_controls 'profile_z'

# you add controls here
control 'profilez-1' do                     # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

control 'profilez-2' do
  title 'Verify gordon_config version'
  desc 'An optional description...'
  describe gordon_config do
    its('version') { should eq('1.0') }
    its('MaxSpeed') { should eq(200) }
  end
end
