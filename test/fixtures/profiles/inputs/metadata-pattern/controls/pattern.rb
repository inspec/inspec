# copyright: 2021, Chef Software, Inc.
title "Testing :pattern flag"

control "pattern_flag_checking_odd_num" do
  describe input("input_value_01") do
    it { should eq 5 }
  end
end