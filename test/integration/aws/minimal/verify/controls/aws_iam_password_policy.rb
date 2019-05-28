#---------------------- Recall ------------------------#
# Password policy is a per-account singleton.  If it's been configured, it exists.
control "aws_iam_password_policy properties" do
  describe aws_iam_password_policy do
    it { should_not exist }
  end
end

#------------- Properties - Negative Case -------------#
# No negative tests yet - we'd need a third account

#------------- Matchers - Negative Case -------------#
# No negative tests yet - we'd need a third account