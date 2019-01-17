control "Users that have a password but do not have MFA enabled" do
  impact 0.7
  describe aws_iam_users.where { has_console_password && (not has_mfa_enabled) } do
    it { should_not exist }
  end
end

control "Do not allow access keys older than 90 days" do
  impact 1.0
  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    it { should_not exist }
  end
end

control "Check our demo bucket for dangerous settings" do
  impact 1.0
  describe aws_s3_bucket("inspec-testing-public-default.chef.io") do
    it { should_not be_public }
  end
end
