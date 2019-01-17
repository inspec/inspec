control "iam_password_policy_expiration" do
  title "Passwords must be set to expire"
  impact 1.0

  describe aws_iam_password_policy do
    it { should expire_passwords }
  end
end
