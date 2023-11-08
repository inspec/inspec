# copyright: 2018, The Authors

title "sample section"

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  ref "ref2"
  ref   ({:ref=>"Some ref", :url=>"https://something"})
  ref "ref3", url: "https://"
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end
