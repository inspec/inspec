control "aws_iam_policies recall" do
  describe aws_iam_policies do
    it { should exist }
  end
end
