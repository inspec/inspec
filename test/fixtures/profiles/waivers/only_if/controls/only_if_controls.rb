
# This fixture will cause a "skip due to only if" if waivers are
# not working correctly (should be waivered)
control "01_only_if" do
  only_if("test_message_from_dsl") { false }
  describe true do
    it { should eq true }
  end
end

control "02_only_if_when_waiver_is_expired" do
  only_if("test_message_from_dsl_02_only_if") { false }
  describe true do
    it { should eq true }
  end
end