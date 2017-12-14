control 'AWS IAM Role search for default AWS role' do
  # Every AWS account comes with this one by default
  describe aws_iam_role('AWSServiceRoleForOrganizations') do
    it { should exist }
  end
end