# author: Alex Bedley
# author: Steffanie Freeman
# author: Simon Varlow
# author: Chris Redekop

class AwsIamUser < Inspec.resource(1)
  name 'aws_iam_user'
  desc 'Verifies settings for AWS IAM user'
  example "
    describe aws_iam_user('test_user_name') do
      its('has_mfa_enabled?') { should be false }
      its('has_console_password?') { should be true }
    end
  "
  def initialize(name, aws_user_provider = AwsIam::UserProvider.new,
                 access_key_factory = AwsIamAccessKeyFactory.new)

    @name = name
    @user = aws_user_provider.user(name)
    @access_key_factory = access_key_factory
  end

  def has_mfa_enabled?
    @user[:has_mfa_enabled?]
  end

  def has_console_password?
    @user[:has_console_password?]
  end

  def access_keys
    @user[:access_keys].map { |access_key|
      @access_key_factory.create_access_key(access_key)
    }
  end

  def to_s
    "IAM User #{@name}"
  end

  class AwsIamAccessKeyFactory
    def create_access_key(access_key)
      AwsIamAccessKey.new({ access_key: access_key })
    end
  end
end
