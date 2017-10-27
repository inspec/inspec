# author: Alex Bedley
# author: Steffanie Freeman
# author: Simon Varlow
# author: Chris Redekop

class AwsIamUser < Inspec.resource(1)
  name 'aws_iam_user'
  desc 'Verifies settings for AWS IAM user'
  example "
    describe aws_iam_user(name: 'test_user') do
      it { should have_mfa_enabled }
      it { should_not have_console_password }
    end
  "
  def initialize(
    opts,
    aws_user_provider = AwsIam::UserProvider.new,
    aws_user_details_provider_ini = AwsIam::UserDetailsProviderInitializer.new,
    access_key_factory = AwsIamAccessKeyFactory.new
  )
    user = opts[:user]
    user = aws_user_provider.user(opts[:name]) if user.nil?
    @aws_user_details_provider = aws_user_details_provider_ini.create(user)
    @access_key_factory = access_key_factory
  end

  def has_mfa_enabled?
    @aws_user_details_provider.has_mfa_enabled?
  end

  def has_console_password?
    @aws_user_details_provider.has_console_password?
  end

  def access_keys
    @aws_user_details_provider.access_keys.map { |access_key|
      @access_key_factory.create_access_key(access_key)
    }
  end

  def name
    @aws_user_details_provider.name
  end

  def to_s
    "IAM User #{name}"
  end

  class AwsIamAccessKeyFactory
    def create_access_key(access_key)
      AwsIamAccessKey.new({ access_key: access_key })
    end
  end
end
