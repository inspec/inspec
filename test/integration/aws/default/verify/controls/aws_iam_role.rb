control "AWS IAM Role search for default AWS role" do
  # This should exist because we created an RDS
  describe aws_iam_role("AWSServiceRoleForRDS") do
    it { should exist }
  end
end
