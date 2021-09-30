# you add controls here
control 'profilec-1' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  tag 'tag-profilec1'
  describe file('/') do                  # The actual test
    it { should be_directory }
  end
end
