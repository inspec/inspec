control "control-start" do
  desc "This control should not get skipped"
  describe "a string" do
    it { should cmp "a string" }
  end
end

control "control-skip-no-message" do
  desc "This control should get skipped"
  only_if { false }
  describe "a string" do
    it { should cmp "a string" }
  end
end

control "control-skip-with-message" do
  desc "This control should get skipped"
  only_if("here is a message") { false }
  describe "a string" do
    it { should cmp "a string" }
  end
end

control "control-skip-test-body" do
  desc "This control should demo that the test body does not get evaluated"
  only_if { false }
  describe "infinity" do
    it { should cmp 1/0 }
  end
end

control "control-skip-test-outer-error" do
  desc "This control should demo that following test resources do not get evaluated"
  only_if { false }
  describe 1/0 do # does not error!
    it { should cmp 1/0 }
  end
end

control "control-skip-test-outer-resource-test-first" do
  desc "This control should demo that preceding test resources DO NOT get evaluated"
  describe command("echo toldyaso") do # does exec
    its("stdout") { should include "toldya" }
  end
  only_if { false }
end

control "multi-skip" do
  desc "This control should get skipped"
  only_if("here is the intended message") { false }
  only_if("here is a different message") { false }
  describe "a string" do
    it { should cmp "a string" }
  end
end

