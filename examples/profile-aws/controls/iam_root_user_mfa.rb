control "iam_root_user_mfa" do
  title "MFA should be enabled for the root user"
  impact 1.0

  describe aws_iam_root_user do
    it { should have_mfa_enabled }
  end
end
