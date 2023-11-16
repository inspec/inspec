# It is common for some profiles - especially thos pubished by MITRE - 
# to use conditonal impact values. This means that we cannot expect control
# metadata to be top-level within the control block.

control "conditonal-control" do
  if Time.now.year == 1999
    description "If Branch Description"
  else
    description "Else Branch Description"
  end    
  describe true do
    it { should be_truthy }
  end
end

control "dynamic-control" do
  1.upto(5) do (n)
    describe true do
      it { should be_truthy }
    end
  end
end