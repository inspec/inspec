describe '14.2.4' do
  it { should cmp('14').segments(1) }      # "... (comparing first segment)"
  it { should cmp('14.2').segments(2) }    # "... (comparing first 2 segments)"
  it { should cmp('14.2.4').segments(3) }  # "... (comparing all segments)"
  it { should cmp('14.2.4').loose }        # "... (comparing first segment)"
  it { should cmp '14.2.4' } # regular cmp
  it { should cmp 14.2 }
end
