title 'Minimal control'

# you add controls here
control 'minimalist' do                                   # A unique ID for this control
  impact 0.7                                           # The criticality, if this control fails.

  describe file('/') do                             # The actual test
    it { should be_directory }
  end
end
