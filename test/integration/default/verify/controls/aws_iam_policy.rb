control "aws_iam_policy recall" do
  describe aws_iam_policy("AWSSupportAccess") do
    it { should exist }
  end

  describe aws_iam_policy(policy_name: "AWSSupportAccess") do
    it { should exist }
  end
end

control "aws_iam_policy properties" do
  describe aws_iam_policy("AdministratorAccess") do
    its('arn') { should cmp "arn:aws:iam::aws:policy/AdministratorAccess" }
    its('default_version_id') { should cmp 'v1' }
    its('attachment_count') { should cmp 1 }
    its('attached_users') { should include "test-fixture-maker" }
    its('attached_groups') { should be_empty }
    its('attached_roles') { should be_empty }
  end
end

control "aws_iam_policy matchers" do
  describe aws_iam_policy("AdministratorAccess") do
    it { should be_attached }
  end
  describe aws_iam_policy("AdministratorAccess") do
    it { should be_attached_to_user("test-fixture-maker") }
  end
end