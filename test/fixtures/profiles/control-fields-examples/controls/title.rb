# copyright: 2018, The Authors

title "sample section"

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  title "Multi line title
  The second line is here.
  The third line is here."
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end
