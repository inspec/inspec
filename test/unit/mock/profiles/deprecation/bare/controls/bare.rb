# encoding: utf-8

# Calling this outside a control should trigger a warning, not a failure
deprecation_tester.fail_me

control 'post-fail-check' do
  describe 'test-01' do
    it { should include 'test-01' }
  end
end
