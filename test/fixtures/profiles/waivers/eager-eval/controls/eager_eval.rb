# This control uses eager evaluation pattern found in CIS profiles.
# When waived with run: false, the command should NOT be executed.
control "01_eager_waived_not_ran" do
  result = command("echo eager_eval_marker_01").stdout.strip
  describe result do
    it { should eq "eager_eval_marker_01" }
  end
end

# This control is NOT waived; eager evaluation should proceed normally.
control "02_eager_not_waived" do
  result = command("echo eager_eval_marker_02").stdout.strip
  describe result do
    it { should eq "eager_eval_marker_02" }
  end
end

# This control is waived with run: true; eager evaluation should proceed normally.
control "03_eager_waived_ran" do
  result = command("echo eager_eval_marker_03").stdout.strip
  describe result do
    it { should eq "eager_eval_marker_03" }
  end
end

# This control uses lazy evaluation (standard pattern) and is waived with run: false.
control "04_lazy_waived_not_ran" do
  describe command("echo lazy_eval_marker_04") do
    its("stdout") { should match /lazy_eval_marker_04/ }
  end
end
