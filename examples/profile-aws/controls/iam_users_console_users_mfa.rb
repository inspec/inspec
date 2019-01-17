control "iam_users_console_users_mfa" do
  title "Users with console access must have MFA enabled"
  impact 1.0

  describe aws_iam_users.where { has_console_password && (not has_mfa_enabled) } do
    its("entries") { should be_empty }
  end
end
