require "colorize"

control "tmp-1.0" do
  colored_text = "InSpec Test".colorize(:green)

  describe colored_text do
    it { should_not be_nil }
    it { should be_a(String) }
  end
end
