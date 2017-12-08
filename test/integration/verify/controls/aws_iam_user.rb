mfa_not_enabled_user = attribute(
  'mfa_not_enabled_user',
  default: 'default.mfa_not_enabled_user',
  description: 'Name of IAM user mfa_not_enabled_user')

console_password_enabled_user = attribute(
  'console_password_enabled_user',
  default: 'default.console_password_enabled_user',
  description: 'Name of IAM user console_password_enabled_user')

describe aws_iam_user(mfa_not_enabled_user) do
  it { should_not have_mfa_enabled }
  it { should_not have_console_password }
end

describe aws_iam_user(console_password_enabled_user) do
  it { should have_console_password }
end
