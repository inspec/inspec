# author: Miles Tjandrawidjaja
class AwsIamRootUser < Inspec.resource(1)
  name 'aws_iam_root_user'
  desc 'Verifies settings for AWS root account'
  example "
    describe aws_iam_root_user do
      it { should have_access_key }
    end
  "

  def initialize(conn = AWSConnection.new)
    @client = conn.iam_client
  end

  def has_access_key?
    summary_account['AccountAccessKeysPresent'] == 1
  end

  def has_mfa_enabled?
    summary_account['AccountMFAEnabled'] == 1
  end

  def to_s
    'AWS Root-User'
  end

  private

  def summary_account
    @summary_account ||= @client.get_account_summary.summary_map
  end
end
