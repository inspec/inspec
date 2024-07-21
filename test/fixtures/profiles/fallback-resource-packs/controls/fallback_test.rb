control "fallback-control" do
  # This must match the pattern in etc/deprecations.json

  # This is defined in test/fixtures/plugins/inspec-test-resources
  # and should be dynamically installed by the fallback mechanism

  describe internal_fallback_test_resource do
    its('custom_method') { should 'be_available' }
  end
end