control "iam_password_policy_max_age" do
  title "Passwords older than 90 days are not allowed"
  impact 1.0

  describe aws_iam_password_policy do
    its("max_password_age_in_days") { should cmp <= 90 }
  end
end
