# copyright: 2018, The Authors

title "sample section"

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An simple description..."
  desc  "This is a multi-line description.
  The second line is here.
  The third line is here.
  The fourth line is here.
  The fifth line is here."
  desc 'some_key', 'some_value'
  desc 'another_key', 'another_value
  that spans multiple lines
  and has a newline in it
  and another newline in it
  and another newline in it
  and another newline in it'
  desc 'yet_another_key', 'yet_another_value'
  description 'description_key', 'description_value'
  description 'another_description_key', 'another_description_value
  that spans multiple lines
  and has a newline in it'
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end
