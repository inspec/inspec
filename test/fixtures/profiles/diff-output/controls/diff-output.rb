control "no-diff" do
  expected = 1 + 1
  actual = 2
  describe expected do
    it { should eq actual }
  end
end

control "text-diff" do
  expected = <<~EOT
I am the very
model of a modern
major general
EOT
  # No one expects this
  actual = <<~EOT
The Spanish Inquisition
EOT
  describe expected do
    it { should eq actual }
  end
end

control "array-diff" do
  expected = [1,2,3,4]
  actual = [5,6,7]
  describe expected do
    it { should eq actual }
  end
end
