# copyright: 2018, The Authors
# you add controls here
include_controls "profile-with-gem-dependency"

control "tmp-1.1" do                        # A unique ID for this control
  describe file('/') do
    it { should be_directory }
  end
end
