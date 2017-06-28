# encoding: utf-8
# copyright: 2015, Chef Software, Inc.

title '/tmp profile'

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."         # Describe why this is needed
  tag data: "temp data"                     # A tag allows you to associate key information
  tag "security"                            # to the test
  ref "Document A-12", url: 'http://...'    # Additional references

  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

# you can also use plain tests
describe file('/tmp') do
  it { should be_directory }
end
