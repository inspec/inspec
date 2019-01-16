control "iam_users_access_key_age" do
  title "No access keys may be older than 90 days"
  impact 1.0

  describe aws_iam_access_keys.where { created_days_ago > 90 } do
    its("entries") { should be_empty }
  end
end
