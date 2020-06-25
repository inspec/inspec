# Ref https://github.com/inspec/inspec/issues/5107
# Users may add code outside controls without exception handling.
# While this is a user mistake, users may not know about it if we don't report it...

raise StandardError, 'Something unforeseen...'

control "Test Exception Example" do
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end
