mfa_not_enabled_user = attribute(
  'mfa_not_enabled_user',
  default: 'default.mfa_not_enabled_user',
  description: 'Name of IAM user mfa_not_enabled_user')

console_password_enabled_user = attribute(
  'console_password_enabled_user',
  default: 'default.console_password_enabled_user',
  description: 'Name of IAM user console_password_enabled_user')

describe aws_iam_user(mfa_not_enabled_user) do
  its('has_mfa_enabled?') { should be false }
  its('has_console_password?') { should be false }
end

describe aws_iam_user(console_password_enabled_user) do
  its('has_console_password?') { should be true }
end