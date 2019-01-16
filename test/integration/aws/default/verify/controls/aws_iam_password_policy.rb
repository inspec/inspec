# There are other tests in the "minimal" test account.

#---------------------- Recall ------------------------#
# Password policy is a per-account singleton.  If it's been configured, it exists.
control "aws_iam_password_policy existence" do
  describe aws_iam_password_policy do
    it { should exist }
  end
end

#------------- Properties -------------#

control "aws_iam_password_policy properties" do
  describe aws_iam_password_policy do
    its("max_password_age_in_days") { should cmp 365 }
    its("number_of_passwords_to_remember") { should cmp 7 }
  end
end

#------------- Matchers - Positive Case -------------#

control "aws_iam_password_policy matchers" do
  describe aws_iam_password_policy do
    it { should require_lowercase_characters }
    it { should require_uppercase_characters }
    it { should require_numbers }
    it { should require_symbols }
    it { should allow_users_to_change_passwords }
    it { should expire_passwords }
    it { should prevent_password_reuse }
  end
end
