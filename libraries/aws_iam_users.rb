# author: Alex Bedley
# author: Steffanie Freeman
# author: Simon Varlow
# author: Chris Redekop
class AwsIamUsers < Inspec.resource(1)
  name 'aws_iam_users'
  desc 'Verifies settings for AWS IAM users'
  example '
    describe aws_iam_users.where(has_mfa_enabled?: false) do
      it { should_not exist }
    end

    describe aws_iam_users.where(has_console_password?: true) do
      it { should exist }
    end
  '

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
  filter.connect(self, :collect_user_details)

  def initialize(
    aws_user_provider = AwsIam::UserProvider.new,
    aws_user_details_provider_ini = AwsIam::UserDetailsProviderInitializer.new,
    user_factory = AwsIamUserFactory.new
  )
    @user_provider = aws_user_provider
    @aws_user_details_provider_ini = aws_user_details_provider_ini
    @user_factory = user_factory
  end

  def collect_user_details
    @users_cache ||= @user_provider.list_users unless @user_provider.nil?
    @users_cache.map do |aws_user|
      details_provider = @aws_user_details_provider_ini.create(aws_user)
      {
        name: details_provider.name,
        has_mfa_enabled?: details_provider.has_mfa_enabled?,
        has_console_password?: details_provider.has_console_password?,
        access_keys: details_provider.access_keys,
      }
    end
  end

  def users
    users = []
    users ||= @user_provider.list_users unless @user_provider.nil?
    users.map { |user|
      @user_factory.create_user(user)
    }
  end

  def to_s
    'IAM Users'
  end

  class AwsIamUserFactory
    def create_user(user)
      AwsIamUser.new(user: user)
    end
  end
end
