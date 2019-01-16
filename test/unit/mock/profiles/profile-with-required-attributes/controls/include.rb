cis_level = attribute("cis_level")

control "control1" do
  title "title"

  only_if { cis_level == 2 }

  describe true do
    it { should eq true }
  end
end
