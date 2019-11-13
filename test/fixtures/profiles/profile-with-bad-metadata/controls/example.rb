# copyright: 2015, The Authors

title 'sample section'

# you can also use plain tests
describe file('/') do
  it { should be_directory }
end

# you add controls here
control 'tmp-1.0' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create / directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/') do                  # The actual test
    it { should be_directory }
  end
end
