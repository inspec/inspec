# author: Adnan Duric
# author: Steffanie Freeman

module AwsIam
  class UserDetailsProvider
    def initialize(user)
      @aws_user = user
    end

    def exists?
      @aws_user.exists?
    end

    def name
      @aws_user.name
    end

    def has_mfa_enabled?
      !@aws_user.mfa_devices.first.nil?
    end

    def has_console_password?
      return !@aws_user.login_profile.create_date.nil?
    rescue Aws::IAM::Errors::NoSuchEntity
      return false
    end

    def access_keys
      @aws_user.access_keys
    end
  end

  class UserDetailsProviderInitializer
    def create(user)
      UserDetailsProvider.new(user)
    end
  end
end
