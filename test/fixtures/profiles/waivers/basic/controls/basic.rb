control "01_not_waivered_passes" do
  describe(true) { it { should eq true } }
end

control "02_not_waivered_fails" do
  describe(true) { it { should eq false } }
end

control "03_waivered_no_expiry_ran_passes" do
  describe(true) { it { should eq true } }
end

control "04_waivered_no_expiry_ran_fails" do
  describe(true) { it { should eq false } }
end

control "05_waivered_no_expiry_not_ran" do
  describe(true) { it { should eq true } }
end

control "06_waivered_expiry_in_past_ran_passes" do
  describe(true) { it { should eq true } }
end

control "07_waivered_expiry_in_past_ran_fails" do
  describe(true) { it { should eq false } }
end

control "08_waivered_expiry_in_past_not_ran" do
  describe(true) { it { should eq true } }
end

control "09_waivered_expiry_in_future_ran_passes" do
  describe(true) { it { should eq true } }
end

control "10_waivered_expiry_in_future_ran_fails" do
  describe(true) { it { should eq false } }
end

control "11_waivered_expiry_in_future_not_ran" do
  describe(true) { it { should eq true } }
end

control "12_waivered_expiry_in_future_z_ran_passes" do
  describe(true) { it { should eq true } }
end

control "13_waivered_expiry_in_future_z_ran_fails" do
  describe(true) { it { should eq false } }
end

control "14_waivered_expiry_in_future_z_not_ran" do
  describe(true) { it { should eq true } }
end

# If transcoding YAML between languages, a date might end up as an explicit string in YAML
control "15_waivered_expiry_in_future_string_ran_passes" do
  describe(true) { it { should eq true } }
end

control "16_waivered_expiry_in_future_string_ran_fails" do
  describe(true) { it { should eq false } }
end

control "17_waivered_expiry_in_future_string_not_ran" do
  describe(true) { it { should eq true } }
end

control "18_waivered_no_expiry_default_run" do
  describe(true) { it { should eq false } }
end
