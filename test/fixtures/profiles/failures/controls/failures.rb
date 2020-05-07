# copyright: 2015, Chef Software, Inc.

title 'failures / profile'

# control, first test passes, second fails
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create / directory"             # A human-readable title
  desc "An optional description..."         # Describe why this is needed
  tag data: "temp data"                     # A tag allows you to associate key information
  tag "security"                            # to the test
  ref "Document A-12", url: 'http://...'    # Additional references

  describe file('/') do                  # The actual test
    it { should be_directory }
    it { should_not be_directory }
  end
end

# anonymous describe block, first passes, second is syntax error
control 'Raises an exception' do
  describe file('/') do
    it { should be_directory }
    it { should_nota be_directory }
  end
end

# anonymous describe block, first fails, second passes
describe file('/') do
  it { should_not be_directory }
  it { should be_directory }
  its('mode') { should cmp '01147' }
end

# fails a pattern match
control 'Generates a message' do
  describe file('/') do
    its('content') { should match /some regex that is expected in the content/ }
  end
end

# control, first and second fail, third passes
control 'cmp-1.0' do
  title 'Using the cmp matcher for numbers'
  describe 7 do
    it { should cmp >= 9 }
    it { should_not cmp /^\d$/ }
    it { should cmp == '7' }
  end
end
