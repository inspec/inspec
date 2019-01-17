control "aws_kms_keys recall" do
  describe aws_kms_keys do
    it { should exist }
  end
end
