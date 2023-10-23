# copyright: 2018, The Authors

title "sample section"

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  describe(true) { it { should eq true } }
end

# you add controls here
control "tmp-2.0" do                        # A unique ID for this control
  impact 0                             # The criticality, if this control fails.
  describe(true) { it { should eq true } }
end

# you add controls here
control "tmp-3.0" do                        # A unique ID for this control
  describe(true) { it { should eq true } }
end
