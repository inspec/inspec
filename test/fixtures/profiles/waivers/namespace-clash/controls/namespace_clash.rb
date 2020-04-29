# This fixture tests for a regression found here: https://github.com/inspec/inspec/issues/4936
control '01_my_control' do
only_if { input('01_my_control', value: 'false') == 'false' }
  describe true do
    it { should eq true }
  end
end
