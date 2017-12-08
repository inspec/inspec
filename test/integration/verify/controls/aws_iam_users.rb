describe aws_iam_users.where(has_console_password?: true)
                      .where(has_mfa_enabled?: false) do
  it { should exist }
end
